drain = function(card, target, amount, one_way, allow_negative)
    local amt = amount
    local amt_drained = 0

    if not allow_negative and target.sell_cost <= 0 then return end

    target.ability.extra_value = target.ability.extra_value or 0

    if not allow_negative then
        local max_drainable = target.sell_cost
        if max_drainable <= 0 then
            return
        end

        if amt >= max_drainable then
            amt_drained = max_drainable
        else
            amt_drained = amt
        end
    else
        amt_drained = amt
    end

    target.ability.extra_value = target.ability.extra_value - amt_drained

    if amt_drained > 0 then
        target:set_cost()
        card_eval_status_text(target, 'extra', nil, nil, nil, { message = localize('ina_val_down'), colour = G.C.RED })

        if not one_way then
            card.ability.extra_value = card.ability.extra_value or 0
            card.ability.extra_value = card.ability.extra_value + amt_drained
            card:set_cost()
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize('k_val_up') })
        end
    end
end

-- Hook into Card:set_cost to allow negative values
local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    -- If Xavier Schiller is in play, we allow sell_cost to be negative
    local xavier = get_joker_with_key('j_ina_Xavier_Ares')
    if xavier and not xavier.debuff then
        self.sell_cost = math.floor(self.base_cost / 2) + (self.ability.extra_value or 0)
    end
end

-- Hook into Card:sell_card to handle negative sell cost (charging the player)
local card_sell_card_ref = Card.sell_card
function Card:sell_card()
    if self.sell_cost < 0 then
        local cost = self.sell_cost
        ease_dollars(cost) -- cost is negative, so it subtracts
    end
    card_sell_card_ref(self)
end

--- Consume un recurso y otorga una estadística multiplicada por la cantidad consumida
---@param card Card
---@param resource_amount number Cantidad del recurso disponible para consumir
---@param consume_callback function|nil Función que se ejecuta para restarle el recurso al jugador
---@param current_stat_var string Variable dentro de card.ability.extra donde se guardará el resultado
---@param stat_mod number Multiplicador de la estadística por recurso consumido
---@param default_val number Valor por defecto de la estadística si no se consume nada
---@param loc_key string Clave de localización para el texto que sale sobre la carta (ej. 'a_xmult')
---@param colour table Color del texto emergente
Pokerleven.consume_all_for_stat = function(card, resource_amount, consume_callback, current_stat_var, stat_mod, default_val, loc_key, colour)
    local extra = card.ability.extra
    if resource_amount > 0 then
        extra[current_stat_var] = resource_amount * stat_mod
        if consume_callback then
            G.E_MANAGER:add_event(Event({ func = function() consume_callback(resource_amount); return true end }))
        end
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize{type='variable', key=loc_key, vars={extra[current_stat_var]}}, colour = colour or G.C.FILTER })
    else
        extra[current_stat_var] = default_val or 0
    end
end

--- Elimina una propiedad de una carta (edición, sello o mejora) y la devuelve
---@param card Card
---@param prop_type string 'edition', 'seal', o 'enhancement'
---@return any
Pokerleven.remove_card_property = function(card, p_type)
    local val
    if p_type == 'edition' and card.edition then
        for k, v in pairs(card.edition) do if v then val = k; break end end
        card:set_edition(nil, true, true); card.edition = nil
    elseif p_type == 'seal' then
        val = card.seal; card:set_seal(nil, true, true)
    elseif p_type == 'enhancement' and card.config.center.set == 'Enhanced' then
        val = card.config.center.key; card:set_ability(G.P_CENTERS.c_base, true)
    end
    return val
end

--- Salva cartas de ser descartadas o destruidas tras jugarse y las devuelve al mazo
---@param cards_to_rescue table Lista de cartas a rescatar
---@return boolean true si se rescató alguna carta
Pokerleven.rescue_cards = function(cards_to_rescue)
    local s = {}
    for _, v in ipairs(cards_to_rescue) do
        if not v.shattered and not v.destroyed then v.destroyed, v.shattered = true, true; s[#s+1] = v end
    end
    if #s > 0 then
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function()
            for i, v in ipairs(s) do
                v.destroyed, v.shattered = nil, nil
                if v.area == G.play then draw_card(G.play, G.deck, i*100/#s, 'up', false, v) end
            end
            return true
        end}))
        return true
    end
    return false
end

--- Modifica el valor de venta de una lista de comodines
---@param amount number Cantidad a sumar (puede ser negativa)
---@param jokers_list table|nil Si no se pasa, afecta a todos en G.jokers.cards
---@param ignore_card Card|nil Carta que no debe ser afectada
---@return boolean true si se modificó alguno
Pokerleven.modify_jokers_sell_value = function(amount, jokers_list, ignore_card)
    local did, list = false, jokers_list or (G.jokers and G.jokers.cards) or {}
    for _, v in ipairs(list) do if v ~= ignore_card then
        v.ability.extra_value = (v.ability.extra_value or 0) + amount; v:set_cost(); did = true
    end end
    return did
end

--- Busca las variables de multiplicador o fichas de un Joker y las incrementa dinámicamente
---@param joker Card El joker a mejorar
---@param mult_gain number|nil
---@param chip_gain number|nil
---@return boolean true si encontró alguna estadística compatible y la mejoró
Pokerleven.buff_joker_stats = function(joker, mult_gain, chip_gain)
    if not joker or type(joker.ability.extra) ~= 'table' or joker.debuff then return false end
    local ex, buffed, m_keys, c_keys = joker.ability.extra, false, {'mult_mod', 'mult_mod_low', 'current_mult', 'mult'}, {'chip_mod', 'current_chips', 'chips'}
    if mult_gain and mult_gain > 0 then for _, k in ipairs(m_keys) do if type(ex[k]) == 'number' then ex[k] = ex[k] + mult_gain; buffed = true; break end end end
    if not buffed and chip_gain and chip_gain > 0 then for _, k in ipairs(c_keys) do if type(ex[k]) == 'number' then ex[k] = ex[k] + chip_gain; buffed = true; break end end end
    if buffed then joker:juice_up(0.5, 0.5) end
    return buffed
end

--- Aplica una propiedad a una carta
---@param card Card
---@param prop_type string 'edition', 'seal', o 'enhancement'
---@param val any
Pokerleven.apply_card_property = function(card, p_type, val)
    if not val then return end
    if p_type == 'edition' then card:set_edition({[val] = true}, true, true)
    elseif p_type == 'seal' then card:set_seal(val, true, true)
    elseif p_type == 'enhancement' then card:set_ability(G.P_CENTERS[val], true) end
end

--- Simula el trigger de un joker de forma segura (sin causar eventos visuales ni de puntuación reales) para saber si le sirve
---@param joker Card
---@param context table
---@return boolean
Pokerleven.simulates_trigger = function(joker, context)
    if not joker then return false end
    local old_ability, q_len = copy_table(joker.ability), G.E_MANAGER.queues.base and #G.E_MANAGER.queues.base or 0
    local eval = joker:calculate_joker(context)
    joker.ability = old_ability
    while G.E_MANAGER.queues.base and #G.E_MANAGER.queues.base > q_len do table.remove(G.E_MANAGER.queues.base) end
    return eval ~= nil
end

--- Degrada un Joker quitándole su edición. Si no tiene, le baja el nivel de técnica. Si no tiene, lo destruye.
---@param target Card
---@return boolean true si el joker fue afectado o destruido, false si era eterno o inválido
Pokerleven.corrupt_joker = function(target)
    if not target or target.ability.eternal then return false end

    if target.edition then
        Pokerleven.remove_card_property(target, 'edition')
        card_eval_status_text(target, 'extra', nil, nil, nil, {message = localize('ina_val_down'), colour = G.C.DARK_EDITION})
    elseif target.ability.extra and target.ability.extra.tech_level and target.ability.extra.tech_level > 0 then
        target.ability.extra.tech_level = target.ability.extra.tech_level - 1
        if set_sticker then set_sticker(target) end
        card_eval_status_text(target, 'extra', nil, nil, nil, {message = localize('ina_val_down'), colour = G.C.RED})
    else
        target:start_dissolve({G.C.RED}, nil, 1.6)
    end
    return true
end

--- Aplica un multiplicador a todas las estadísticas mejorables de un Joker
---@param card Card
---@param id string Identificador único del buff
---@param multiplier number Multiplicador (ej: 2.2 para +120%)
Pokerleven.apply_stat_multiplier = function(card, id, multiplier)
    if not card or not card.ability or type(card.ability.extra) ~= "table" then return end
    card.ability.ina_stat_mults = card.ability.ina_stat_mults or {}
    if card.ability.ina_stat_mults[id] == multiplier then return end

    if card.ability.ina_stat_mults[id] then
        Pokerleven.remove_stat_multiplier(card, id)
    end

    card.ability.ina_stat_mults[id] = multiplier
    for k, _ in pairs(technique_values) do
        if card.ability.extra[k] ~= nil and type(card.ability.extra[k]) == "number" then
            card.ability.extra[k] = card.ability.extra[k] * multiplier
        end
    end
end

--- Revierte un multiplicador de estadísticas de un Joker
---@param card Card
---@param id string Identificador único del buff
Pokerleven.remove_stat_multiplier = function(card, id)
    if not card or not card.ability or type(card.ability.extra) ~= "table" then return end
    if not card.ability.ina_stat_mults or not card.ability.ina_stat_mults[id] then return end

    local multiplier = card.ability.ina_stat_mults[id]
    card.ability.ina_stat_mults[id] = nil

    for k, _ in pairs(technique_values) do
        if card.ability.extra[k] ~= nil and type(card.ability.extra[k]) == "number" then
            local val = card.ability.extra[k] / multiplier
            if math.abs(val - math.floor(val + 0.5)) < 0.001 then
                val = math.floor(val + 0.5)
            end
            card.ability.extra[k] = val
        end
    end
end

--- Modifica las cargas de una carta respetando sus límites (ex.charges, ex.max_charges)
---@param card Card
---@param amount number
---@return number difference La cantidad real de cargas que se añadieron o eliminaron
Pokerleven.modify_charges = function(card, amount)
    if not card or not card.ability or type(card.ability.extra) ~= "table" then return 0 end
    local ex = card.ability.extra
    local max_ch = get_max_charges(ex)
    if not ex.charges or not max_ch then return 0 end
    local old_charges = ex.charges
    ex.charges = math.max(0, math.min(max_ch, ex.charges + amount))
    return ex.charges - old_charges
end

--- Simula cómo puntuaría un Joker si la carta evaluada fuera cambiada temporalmente
---@param card Card Joker actual
---@param context table Contexto de la evaluación
---@param target_ranks table Lista de rangos a simular { {id=14, val='Ace', nom=11}, {id=13, val='King', nom=10} }
---@return table|nil
Pokerleven.simulate_rank_difference = function(card, context, target_ranks)
    local b_c, b_xc = 0, 1
    local sim_ctx = {cardarea=G.play, full_hand=context.full_hand, scoring_hand=context.scoring_hand, scoring_name=context.scoring_name, poker_hands=context.poker_hands, individual=true, other_card=context.other_card}
    local q_len = G.E_MANAGER.queues.base and #G.E_MANAGER.queues.base or 0
    local oc = context.other_card
    local o_ab = copy_table(oc.ability)
    local o_id, o_s, o_f, o_nom = oc.get_id, oc.is_suit, oc.is_face, oc.get_nominal
    local o_b_id, o_b_val = oc.base.id, oc.base.value
    for _, j in ipairs(G.jokers.cards) do
        if j ~= card and not j.debuff then
            local j_ab = copy_table(j.ability)
            local r_eval = j:calculate_joker(sim_ctx); j.ability = copy_table(j_ab)
            local max_c, max_xc = 0, 1
            for _, target in ipairs(target_ranks) do
                oc.get_id = function() return target.id end
                if target.id >= 11 and target.id <= 13 then oc.is_face = function() return true end else oc.is_face = function() return false end end
                if target.nom then oc.get_nominal = function() return target.nom end end
                oc.base.id = target.id; oc.base.value = target.val
                local sim_eval = j:calculate_joker(sim_ctx); j.ability = copy_table(j_ab)
                if type(sim_eval) == 'table' then
                    local c = (sim_eval.chips or 0) + (sim_eval.chip_mod or 0)
                    local xc = (sim_eval.xchips or 1) * (sim_eval.x_chips or 1) * (sim_eval.Xchip_mod or 1)
                    if c > max_c then max_c = c end; if xc > max_xc then max_xc = xc end
                end
            end
            oc.get_id = o_id; oc.is_suit = o_s; oc.is_face = o_f; oc.get_nominal = o_nom; oc.base.id = o_b_id; oc.base.value = o_b_val
            local rc, rxc = 0, 1
            if type(r_eval) == 'table' then rc = (r_eval.chips or 0) + (r_eval.chip_mod or 0); rxc = (r_eval.xchips or 1) * (r_eval.x_chips or 1) * (r_eval.Xchip_mod or 1) end
            b_c, b_xc = b_c + math.max(0, max_c - rc), b_xc * math.max(1, max_xc / rxc)
        end
    end
    oc.ability = o_ab; while G.E_MANAGER.queues.base and #G.E_MANAGER.queues.base > q_len do table.remove(G.E_MANAGER.queues.base) end
    local ret = {}
    if b_c > 0 then ret.chips = b_c end; if b_xc > 1 then ret.xchips = b_xc; ret.x_chips = b_xc end
    return next(ret) and ret or nil
end

--- Evalúa el cálculo de un Joker copiado de forma segura mediante intercambio de center y ability
---@param card Card Carta que realiza la copia
---@param copied_key string Clave del joker copiado
---@param copied_ability table|nil Tabla de ability de la copia (o nil para usar los valores por defecto)
---@param ctx table Contexto de cálculo
---@return table|nil result, table mutated_ability
Pokerleven.evaluate_copied_joker = function(card, copied_key, copied_ability, ctx)
    if not copied_key or copied_key == 'Ninguno' then return nil, copied_ability end

    local copied_center = G.P_CENTERS[copied_key]
    if not copied_center then return nil, copied_ability end

    local orig_center = card.config.center
    local orig_ability = card.ability

    local current_copied_ability = copy_table(copied_ability or copied_center.config or {})

    -- Swap
    card.config.center = copied_center
    card.ability = current_copied_ability

    -- Calculate
    local result = card:calculate_joker(ctx)

    -- Store mutated ability
    local new_copied_ability = copy_table(card.ability)

    -- Restore
    card.config.center = orig_center
    card.ability = orig_ability

    return result, new_copied_ability
end
