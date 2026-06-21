Pokerleven.TEAM_GROUPS = {
    ["ina_team_Zeus"] = "ZEUS",
    ["ina_team_Zeus_Ares"] = "ZEUS",
    ["ina_team_SolariaZeus"] = "ZEUS",
    ["Zeus"] = "ZEUS",

    ["ina_team_Kirkwood"] = "KIRKWOOD",
    ["ina_team_KirkwoodAres"] = "KIRKWOOD",

    ["ina_team_Brain"] = "BRAIN",
    ["ina_team_BrainAres"] = "BRAIN",

    ["ina_team_InazumaJapon"] = "INAZUMA_JAPAN",
    ["ina_team_InazumaJaponGalaxy"] = "INAZUMA_JAPAN",
    ["ina_team_InazumaJapanOrion"] = "INAZUMA_JAPAN",

    ["ina_team_Orpheus"] = "ITALY",
    ["ina_team_GuardiansOfQueen"] = "ITALY",

    ["ina_team_Raimon"] = "RAIMON",
    ["ina_team_InakuniRaimon"] = "RAIMON",
    ["ina_team_RaimonGO"] = "RAIMON",

    ["ina_team_TormentaDeGeminis"] = "ALIUS",
    ["ina_team_Epsilon"] = "ALIUS",
    ["ina_team_Genesis"] = "ALIUS",
    ["ina_team_DiamondDust"] = "ALIUS",
    ["ina_team_Prominence"] = "ALIUS",
    ["ina_team_Caos"] = "ALIUS",
    ["ina_team_EiseiGakuen"] = "ALIUS",
}

Pokerleven.get_player_concept = function(card)
    if not card or not card.ability then return nil end
    if card.ability.extra and card.ability.extra.pteam_concept then
        return card.ability.extra.pteam_concept
    end
    local pteam = card.ability.extra and card.ability.extra.pteam
    return pteam and Pokerleven.TEAM_GROUPS[pteam] or pteam
end

Pokerleven.find_player_concept = function(concept)
    return SMODS.find_card("Joker", function(v)
        return Pokerleven.get_player_concept(v) == concept
    end)
end

Pokerleven.is_concept = function(card, concept)
    return Pokerleven.get_player_concept(card) == concept
end

Pokerleven.count_concept = function(concept)
    return #Pokerleven.find_player_concept(concept)
end

Pokerleven.refresh_concept_boosts = function(target_concept, multiplier, boost_id)
    local boost_active = false
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v.ability and v.ability.gives_boost == boost_id and not v.debuff then
                boost_active = true; break
            end
        end
    end

    local tag = "boost_" .. boost_id
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v.ability and v.ability[tag .. "_active"] then
                local original_stats = v.ability[tag .. "_originals"] or {}
                for k, original_val in pairs(original_stats) do
                    if v.ability.extra then v.ability.extra[k] = original_val end
                end
                v.ability[tag .. "_active"] = nil
                v.ability[tag .. "_originals"] = nil
            end
        end
    end

    if boost_active then
        local odds_mod = multiplier > 1 and 0.75 or 1.25
        for _, v in ipairs(G.jokers.cards) do
            if v.ability and v.ability.extra and Pokerleven.is_concept(v, target_concept) and v.ability.gives_boost ~= boost_id then
                v.ability[tag .. "_originals"] = {}
                v.ability[tag .. "_active"] = true
                for k, val in pairs(v.ability.extra) do
                    if type(val) == "number" then
                        v.ability[tag .. "_originals"][k] = val
                        local nk = k:lower()
                        if nk:find("odds") or nk:find("denom") or nk:find("chance") then
                            if nk:find("lose") or nk:find("destroy") or nk:find("reset") or nk:find("nerf") or nk:find("debuff") then
                                v.ability.extra[k] = val * multiplier
                            else
                                if val > 1 then v.ability.extra[k] = math.max(1, val * odds_mod) end
                            end
                        elseif technique_values[k] or nk:find("mult") or nk:find("chip") or nk:find("mod") or nk:find("amount") or nk:find("gain") then
                            v.ability.extra[k] = val * multiplier
                        end
                    end
                end
                v:juice_up(0.2, 0.2)
            end
        end
    end
end
