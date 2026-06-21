--- Crea una carta consumible de forma segura y maneja el buffer global
---@param card_type string 'Tarot', 'Planet', 'Spectral', etc.
---@param specific_key string|nil Clave del consumible específico
---@return boolean true si se creó la carta, false si no había espacio
Pokerleven.spawn_consumable = function(card_type, specific_key)
    if not Pokerleven.has_enough_consumables_space() then return false end
    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
    G.E_MANAGER:add_event(Event({
        func = function()
            local _c = create_card(card_type, G.consumeables, nil, nil, nil, nil, specific_key)
            Pokerleven.add_card_to_consumables(_c)
            G.GAME.consumeable_buffer = 0
            return true
        end
    }))
    return true
end

-- Creates random card
create_random_ina_joker = function(pseed, inararity, area, inateam, enable_dupes, special, exclude_keys)
    local create_args = { set = "Joker", area = nil, key = '' }
    create_args.key = get_random_joker_key(pseed, inararity, area, inateam, exclude_keys or nil, enable_dupes or nil,
        special or nil)

    return SMODS.create_card(create_args)
end

get_random_joker_key = function(pseed, inararity, area, inateam, exclude_keys, enable_dupes, special)
    local ina_keys = {}
    local inaarea = area or G.jokers
    local ina_key
    exclude_keys = exclude_keys or { j_ina_Jude_Raimon = true }

    if inararity and type(inararity) == "string" then
        if string.lower(inararity) == "common" then inararity = 1 end
        if string.lower(inararity) == "uncommon" then inararity = 2 end
        if string.lower(inararity) == "rare" then inararity = 3 end
    end

    for _, v in pairs(G.P_CENTERS) do
        if ((special and v.special == special) or v.pteam)
            and not (inararity and v.rarity ~= inararity)
            and not (inateam and v.pteam and inateam ~= v.pteam)
            and (
                (special and v.special == special)
                or (not special and (player_in_pool(v) or (inateam == 'ina_team_Scout' and v.pteam == 'ina_team_Scout')))
            )
            and not v.aux_ina
            and not exclude_keys[v.key]
        then
            local no_dup = true
            if not enable_dupes and inaarea and inaarea.cards and not next(find_joker("Showman")) then
                local has_wonder = next(find_joker("Trixy_Wonder"))
                local count = 0

                for _, m in pairs(inaarea.cards) do
                    if v.key == m.config.center_key then
                        count = count + 1
                    end
                end

                if has_wonder then
                    if count >= 2 then no_dup = false end
                else
                    if count >= 1 then no_dup = false end
                end
            end

            if no_dup then
                table.insert(ina_keys, v.key)
            end
        end
    end

    if #ina_keys == 0 and enable_dupes then
        for _, v in pairs(G.P_CENTERS) do
            if v.pteam
                and not (inararity and v.rarity ~= inararity)
                and not (inateam and inateam ~= v.pteam)
                and not v.aux_ina
                and not exclude_keys[v.key] then
                table.insert(ina_keys, v.key)
            end
        end
    end

    if #ina_keys > 0 then
        ina_key = pseudorandom_element(ina_keys, pseudoseed(pseed))
    else
        ina_key = "j_ina_Willy"
    end

    return ina_key
end

--- Spawns a random Ina Joker with custom rarity/team tables.
---@param card table The card triggering the effect
---@param context table The current game context
---@param rarity_table table<string, number> A table of rarities and their corresponding chance
---@param team_table table<string, number> A table of team names and their corresponding chance
---@return table Effect table with a `.func` function to be executed to spawn the joker
function spawn_random_ina_joker(card, context, rarity_table, team_table)
    local function roll_from_table(t, seed)
        local roll = pseudorandom(seed)
        local cumulative = 0
        for key, chance in pairs(t) do
            cumulative = cumulative + chance
            if roll < cumulative then return key end
        end

        local last_key = nil
        for k in pairs(t) do last_key = k end
        return last_key
    end

    return {
        func = function()
            local created_joker = false
            if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                created_joker = true
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1

                local rarity = roll_from_table(rarity_table, 'ina_rarity')
                local team = roll_from_table(team_table, 'ina_team')

                G.E_MANAGER:add_event(Event({
                    trigger = 'immediate',
                    func = function()
                        G.GAME.joker_buffer = 0
                        print("Rarity:", rarity)
                        print("Team:", team)
                        local _card = create_random_ina_joker('sweet', rarity, G.jokers, team, true, nil,
                            { j_ina_Jude_Raimon = true })
                        _card:add_to_deck()
                        G.jokers:emplace(_card)
                        return true
                    end
                }))
            end

            if created_joker then
                card.ability.extra.triggered = true
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {
                    message = localize('k_plus_joker'),
                    colour = G.C.BLUE
                })
            end

            return true
        end
    }
end

Pokerleven.destroy_all_jokers = function()
    for _, c in ipairs(G.jokers.cards) do
        c:start_dissolve({ HEX("57ecab") }, nil, 1.6)
        c:remove_from_deck()
    end
end

---@param manager_key string
Pokerleven.destroy_manager_with_key = function(manager_key)
    local manager = get_joker_with_key(manager_key, Pokerleven.ina_manager_area.cards)

    if manager then
        manager:start_dissolve({ HEX("57ecab") }, nil, 1.6)
        manager:remove_from_deck()
    end
end
