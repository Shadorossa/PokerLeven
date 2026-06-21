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
        local max_ch = get_max_charges(card.ability.extra)
        card.greyed = not Pokerleven.is_spirit_active(card) or (card.ability.extra.charges <= 0) or not max_ch
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

    if ctx.setting_blind and not ctx.blueprint then
        card.ability.spirit_used_this_round = false
    end

    if ctx.end_of_round and ctx.main_eval and not ctx.blueprint then
        local diff = 0
        if ex.charges > 0 and card.ability.spirit_used_this_round then
            diff = Pokerleven.modify_charges(card, -1)
            if diff < 0 then
                ex.charges_spent = (ex.charges_spent or 0) + math.abs(diff)
                local max_ch = get_max_charges(ex) or 1
                local req = math.max(1, math.ceil(max_ch * 0.25 * math.max(1, ex.tech_level or 0)))
                local max_spirit_lvl = 5
                if ex.charges_spent >= req and (ex.tech_level or 0) < max_spirit_lvl then
                    ex.charges_spent = 0; increment_technique(card)
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("ina_evolve_level"), colour = G.C.PURPLE})
                end
            end
        end
        local max_ch = get_max_charges(ex) or 1
        if G.GAME.blind:get_type() == 'Boss' then diff = diff + Pokerleven.modify_charges(card, math.max(1, math.floor(max_ch * 0.15))) end

        if diff > 0 then return {message = "+" .. diff .. " Carga" .. (diff > 1 and "s" or ""), colour = G.C.PURPLE}
        elseif diff < 0 then return {message = diff .. " Carga", colour = G.C.RED} end
    end
end

--- Aplica o retira un multiplicador de estadísticas de área para un Espíritu según sus cargas y un tipo específico
---@param card Card
---@param target_type string El elemento o tipo que recibe el aura (ej: C.Wind)
Pokerleven.update_spirit_aura = function(card, target_type)
    local ex = card.ability.extra
    local act = not card.debuff and (card.ability.extra.charges > 0) and Pokerleven.is_spirit_active(card)
    local spirit_key = card.config.center_key..'_'..card.sort_id
    local sticker_key = string.lower(target_type).."_sticker"
    local has_target = false

    SMODS.find_card("Joker", function(v)
        if act and (is_type(v, target_type) or (v.ability and v.ability[sticker_key])) then
            Pokerleven.apply_stat_multiplier(v, spirit_key, ex.stat_mult)
            has_target = true
        else
            Pokerleven.remove_stat_multiplier(v, spirit_key)
        end
        return false
    end)

    if has_target then card.ability.spirit_used_this_round = true end
end

Pokerleven.remove_spirit_aura = function(card)
    local spirit_key = card.config.center_key..'_'..card.sort_id
    SMODS.find_card("Joker", function(v)
        Pokerleven.remove_stat_multiplier(v, spirit_key)
        return false
    end)
end
