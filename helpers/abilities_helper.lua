drain = function(card, target, amount, one_way)
    local amt = amount
    local amt_drained = 0

    if target.sell_cost <= 0 then return end

    target.ability.extra_value = target.ability.extra_value or 0

    local max_drainable = target.sell_cost
    if max_drainable <= 0 then
        return
    end

    if amt >= max_drainable then
        amt_drained = max_drainable
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
