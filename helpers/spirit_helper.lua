--- Comprueba si el espíritu está activo (en las 3 primeras posiciones o en juego)
---@param card Card
---@return boolean
Pokerleven.is_spirit_active = function(card)
    if card.area and card.area == Pokerleven.ina_spirits_area then
        for i, c in ipairs(card.area.cards) do
            if c == card then return i <= 3 end
        end
    elseif card.area == G.jokers then
        return true
    end
    return false
end

--- Actualiza el estado visual (sombreado) del espíritu
---@param card Card
Pokerleven.update_spirit_visuals = function(card)
    if card.area == Pokerleven.ina_spirits_area then
        card.greyed = not Pokerleven.is_spirit_active(card) or (card.ability.extra.charges <= 0)
    else
        card.greyed = false
    end
end

local orig_card_update = Card.update
function Card:update(dt)
    if orig_card_update then orig_card_update(self, dt) end
    if Pokerleven and Pokerleven.is_spirit(self) then
        Pokerleven.update_spirit_visuals(self)
    end
end

--- Gestiona el consumo, la evolución y la regeneración de cargas para los Espíritus
---@param card Card
---@param ctx table
---@return table|nil
Pokerleven.manage_spirit_charges = function(card, ctx)
    if not Pokerleven.is_spirit_active(card) then return end
    local ex = card.ability.extra
    
    if ctx.end_of_round and ctx.main_eval and not ctx.blueprint then
        local diff = 0
        if ex.charges > 0 then
            diff = Pokerleven.modify_charges(card, -1)
            if diff < 0 then
                ex.charges_spent = (ex.charges_spent or 0) + math.abs(diff)
                local req = math.max(1, math.ceil(ex.max_charges * 0.25 * math.max(1, ex.tech_level or 0)))
                if ex.charges_spent >= req and (ex.tech_level or 0) < 5 then
                    ex.charges_spent = 0; increment_technique(card)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("ina_evolve_level"), colour = G.C.PURPLE})
                end
            end
        end
        if G.GAME.blind:get_type() == 'Boss' then diff = diff + Pokerleven.modify_charges(card, math.max(1, math.floor(ex.max_charges * 0.15))) end
        
        if diff > 0 then return {message = "+" .. diff .. " Carga" .. (diff > 1 and "s" or ""), colour = G.C.PURPLE}
        elseif diff < 0 then return {message = diff .. " Carga", colour = G.C.RED} end
    end
end

--- Aplica o retira un multiplicador de estadísticas de área para un Espíritu según sus cargas y un tipo específico
---@param card Card
---@param target_type string El elemento o tipo que recibe el aura (ej: C.Wind)
Pokerleven.update_spirit_aura = function(card, target_type)
    local ex, act = card.ability.extra, not card.debuff and (card.ability.extra.charges > 0) and Pokerleven.is_spirit_active(card)
    if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do
        if act and (is_type(v, target_type) or (v.ability and v.ability[string.lower(target_type).."_sticker"])) then Pokerleven.apply_stat_multiplier(v, card.config.center_key..'_'..card.sort_id, ex.stat_mult)
        else Pokerleven.remove_stat_multiplier(v, card.config.center_key..'_'..card.sort_id) end
    end end
end

--- Limpia el aura de un espíritu al ser vendido o destruido
---@param card Card
Pokerleven.remove_spirit_aura = function(card)
    if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do Pokerleven.remove_stat_multiplier(v, card.config.center_key..'_'..card.sort_id) end end
end