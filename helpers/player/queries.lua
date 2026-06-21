find_player_type = function(target_type, is_not)
    local found = {}
    if G.jokers and G.jokers.cards then
        for _, v in pairs(G.jokers.cards) do
            if v.ability then
                local extra = v.ability.extra
                local has_sticker = v.ability[string.lower(target_type) .. "_sticker"]

                if extra and type(extra) == "table" then
                    if is_not then
                        if extra.ptype ~= target_type then
                            table.insert(found, v)
                        end
                    else
                        if extra.ptype == target_type then
                            table.insert(found, v)
                        end
                    end
                elseif has_sticker then
                    table.insert(found, v)
                end
            end
        end
    end
    return found
end

find_player_position = function(target_type)
    local found = {}
    if G.jokers and G.jokers.cards then
        for k, v in pairs(G.jokers.cards) do
            if v.ability and ((v.ability.extra and type(v.ability.extra) == "table"
                    and target_type == v.ability.extra.pposition) or v.ability[string.lower(target_type) .. "_sticker"]) then
                table.insert(found, v)
            end
        end
    end
    return found
end

--- Returns players of target type and position
---@param target_type string the type of the player
---@param target_position string the position of the player
---@return table
Pokerleven.find_player_type_and_position = function(target_type, target_position)
    local found = {}
    if G.jokers and G.jokers.cards then
        for _, v in pairs(G.jokers.cards) do
            if v.ability and v.ability.extra and type(v.ability.extra) == "table" then
                if v.ability.extra.ptype == target_type and v.ability.extra.pposition == target_position then
                    table.insert(found, v)
                end
            end
        end
    end
    return found
end

---@param selected_pos string
---@param required number
---@return boolean
Pokerleven.has_enough_position = function(selected_pos, required)
    return #find_player_position(selected_pos) >= required
end

---Returns the team with most players
---@return string|nil most_played Team with most players
Pokerleven.most_played_team = function()
    local team_counts = {}

    if G.jokers and G.jokers.cards then
        for _, v in pairs(G.jokers.cards) do
            if v.ability and v.ability.extra and type(v.ability.extra) == "table" and v.ability.extra.pteam and v.config.center_key ~= "j_ina_Bobby" then
                local team = v.ability.extra.pteam
                team_counts[team] = (team_counts[team] or 0) + 1
            end
        end
    end

    local most_played = nil
    local max_count = 0

    for team, count in pairs(team_counts) do
        if count > max_count then
            most_played = team
            max_count = count
        end
    end

    return most_played
end

--- Comprueba si una carta es el ojeador elemental más a la izquierda
---@param card Card
---@return boolean
Pokerleven.is_active_elemental = function(card)
    local leftmost = nil
    if G.jokers and G.jokers.cards then
        for _, player in ipairs(G.jokers.cards) do
            if C.ELEMENTALS_KEYS[player.config.center_key] then
                leftmost = player
                break
            end
        end
    end
    return leftmost == card
end

find_player_team = function(target_type)
    local found = {}
    if G.jokers and G.jokers.cards then
        for k, v in pairs(G.jokers.cards) do
            if v.ability and ((v.ability.extra and type(v.ability.extra) == "table"
                    and target_type == v.ability.extra.pteam) or v.ability[string.lower(target_type) .. "_sticker"]) then
                table.insert(found, v)
            end
        end
    end
    return found
end

local check_player_property = function(card, field, value)
    return card and card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra[field] == value
end

is_team = function(card, target_team)
    return check_player_property(card, "pteam", target_team)
end

find_player_nation = function(target_nation)
    local found = {}
    if G.jokers and G.jokers.cards then
        for _, v in pairs(G.jokers.cards) do
            if v.ability and v.ability.extra and type(v.ability.extra) == "table" and v.ability.extra.pnation == target_nation then
                table.insert(found, v)
            end
        end
    end
    return found
end

is_nation = function(card, target_nation)
    return check_player_property(card, "pnation", target_nation)
end

is_position = function(card, target_position)
    return check_player_property(card, "pposition", target_position)
end

is_type = function(card, target_type)
    return check_player_property(card, "ptype", target_type)
end

get_team = function(card)
    if card.ability then
        if type(card.ability.extra) == "table" and card.ability.extra.pteam then
            return card.ability.extra.pteam
        end
    end
    return nil
end

local player_in_bench = function(name)
    if (not Pokerleven.ina_bench_area or not Pokerleven.ina_bench_area.cards) then
        return false
    end

    for _, card in ipairs(Pokerleven.ina_bench_area.cards) do
        if name == card.config.center.name then
            return true
        end
    end
    return false
end

player_in_pool = function(self)
    if self.special then
        return false
    end

    -- Lógica centralizada de bloqueo (Tienda y Pool)
    if self.aux_ina then
        -- 1. Versiones Plus/Evoluciones: SIEMPRE bloqueadas en tienda
        if string.find(self.key or "", "_Plus$") or string.find(self.name or "", "_Plus$") then
            return false
        end

        -- 2. Internacionales: Desbloqueados por Growing Player (V1)
        local is_international = (self.pteam == "ina_team_InazumaJapon")
        if is_international then
            local has_v1 = (G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers["v_ina_growing_player"])
            if has_v1 then return true end
            return false
        end

        -- 3. Alius/Especiales/Ares: Desbloqueados por Modified Player (V2) o Eris
        local is_modified = (self.pteam == "ina_team_RoyalRedux" or self.pteam == "ina_team_EmperadoresOscuros")
        local is_ares = (self.pteam == "ina_team_InakuniRaimon" or self.pteam == "ina_team_EiseiGakuen" or self.pteam == "ina_team_Zeus_Ares" or self.pteam == "ina_team_Seishou")

        if is_modified or is_ares then
            local has_v2 = (G.GAME and G.GAME.used_vouchers and G.GAME.used_vouchers["v_ina_modified_player"])
            local is_eris = (Pokerleven.Universe and Pokerleven.Universe.eris_active)

            -- Los Alius se permiten si tienes el vale, eres Eris o ya tienes a alguien del equipo
            if is_modified and (has_v2 or is_eris or #find_player_team(self.pteam) > 0) then return true end
            -- Los Ares solo se permiten si Eris está activa
            if is_ares and is_eris then return true end

            return false
        end

        -- Si es aux_ina pero no cumple ninguna condición de arriba, bloqueamos
        return false
    end

    -- v16.2: Lógica de duplicados (Custom y Trixy Wonder)
    local name
    if not self.name and self.ability and self.ability.name then
        name = self.ability.name
    else
        name = self.name or "Mark"
    end

    local has_custom = next(find_joker("Custom"))
    local has_wonder = next(find_joker("Trixy_Wonder"))
    local current_copies = #find_joker(name)

    -- Custom: Duplicados ilimitados de Viento
    if has_custom and self.ptype == "Wind" then
        return true
    end

    -- Trixy Wonder: Máximo 1 duplicado (2 copias total) de CUALQUIER Joker
    if has_wonder and current_copies == 1 then
        return true
    end

    if current_copies > 0 or player_in_bench(name) or self.pteam == 'ina_team_Scout' then
        return false
    elseif self.rarity == "winner" or self.rarity == "ina_winner" or self.rarity == "ina_vestige" then
        return false
    else
        return true
    end
end

get_adjacent_jokers = function(card)
    local jokers = {}
    if #G.jokers.cards > 1 then
        local pos = 0
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i] == card then
                pos = i
                break
            end
        end
        if pos > 1 and G.jokers.cards[pos - 1] then
            table.insert(jokers, G.jokers.cards[pos - 1])
        end
        if pos < #G.jokers.cards and G.jokers.cards[pos + 1] then
            table.insert(jokers, G.jokers.cards[pos + 1])
        end
    end
    return jokers
end

--- Returns the average sell value of a group of type jokers
---@param ptype string The reference type
---@return number|nil avg_sell_value Average sell value of the group of jokers. Nil for collection
calculate_avg_sell_cost = function(ptype)
    local sumSellCost = 0
    if G.jokers then
        for _, v in pairs(G.jokers.cards) do
            if ptype == nil then
                sumSellCost = sumSellCost + v.sell_cost
            else
                if v.ability.extra.ptype == ptype then
                    sumSellCost = sumSellCost + v.sell_cost
                end
            end
        end

        if ptype == nil then
            return sumSellCost / #G.jokers.cards
        else
            return sumSellCost / #find_player_type(ptype)
        end
    end

    return nil
end

Pokerleven.calculate_total_sell_cost = function(cards)
    local sumSellCost = 0
    for _, card in ipairs(cards) do
        sumSellCost = sumSellCost + card.sell_cost
    end
    return sumSellCost
end

--- Returns the joker with the key provided, in the area provided or jokers if nil
---@param key string The reference joker key
---@param areaCards table | nil The area to search
---@return Card|SMODS.Joker|nil Selected_Joker Joker with that key or nil if not found
function get_joker_with_key(key, areaCards)
    local cards = areaCards or (G.jokers and G.jokers.cards)
    if not cards then return nil end
    for _, v in ipairs(cards) do
        if v.config.center_key == key then
            return v
        end
    end
end

---Aplica un elemento a un jugador, priorizando el más a la izquierda
---@param element string Elemento a aplicar (ej: "Fire")
---@param message_key string Clave de localización del mensaje (ej: "ina_onfire")
---@param colour table Color para el texto (ej: G.C.RED)
apply_element = function(element, message_key, colour)
    local without_that_element = find_player_type(element, true)

    if #without_that_element > 0 then
        for _, player in ipairs(without_that_element) do
            apply_property_sticker(player, element, "type")
            card_eval_status_text(player, 'extra', nil, nil, nil, {
                message = localize(message_key),
                colour = colour or G.C.WHITE
            })
        end
    end
end

restore_types_for_area = function()
    local function restore_types(area)
        if area and area.cards then
            for _, player in ipairs(area.cards) do
                if player and player.config and player.config.center and player.config.center.ptype then
                    apply_property_sticker(player, player.config.center.ptype, "type")
                end
            end
        end
    end

    if G and G.jokers then
        restore_types(G.jokers)
    end

    if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
        restore_types(Pokerleven.ina_bench_area)
    end
end

Pokerleven.get_random_team_from_actuals = function()
    local possible_teams = {}
    if G.jokers and G.jokers.cards then
        for _, v in pairs(G.jokers.cards) do
            if v.ability and type(v.ability.extra) == "table" and v.ability.extra.pteam
                and v.ability.extra.pteam ~= "ina_team_Scout" then
                possible_teams[v.ability.extra.pteam] = true
            end
        end
    end

    local team_list = {}
    for team, _ in pairs(possible_teams) do
        table.insert(team_list, team)
    end

    local selected_team = nil
    if #team_list > 0 then
        selected_team = pseudorandom_element(team_list, pseudoseed("teamselect"))
    end
    if not selected_team then
        selected_team = "ina_team_Raimon"
    end

    return selected_team
end

---@param enh_name string
---@return integer
Pokerleven.get_enhancement_count = function(c, enh_name)
    local count = 0
    if SMODS.has_enhancement(c, enh_name) then
        count = count + 1
    end
    return count
end

Pokerleven.get_jokers_to_the_left = function(card)
    for i, c in ipairs(G.jokers.cards) do
        if c == card then
            return i - 1
        end
    end
    return 0
end

Pokerleven.get_jokers_to_the_right = function(card)
    for i, c in ipairs(G.jokers.cards) do
        if c == card then
            return #G.jokers.cards - i
        end
    end
    return 0
end

Pokerleven.is_in_left_half = function(card)
    if G.jokers and G.jokers.cards then for i, c in ipairs(G.jokers.cards) do
        if c == card then return i <= (#G.jokers.cards + 1) / 2 end
    end end
    return false
end

Pokerleven.suit_element_aura = function(card, suit, element, remove)
    if G.jokers and not G.jokers.cards then return end
    if G.playing_cards then local act, a_k, s_k = not remove and card.area == G.jokers and not card.debuff, 'aura_'..string.lower(element), string.lower(element)..'_sticker'
        for _, v in ipairs(G.playing_cards) do
            if act and v:is_suit(suit) then if not v.ability[s_k] then v.ability[a_k], v.ability[s_k] = true, true end
            elseif v.ability[a_k] then v.ability[a_k], v.ability[s_k] = nil, false end
        end
    end
end
