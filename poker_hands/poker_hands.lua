local get_number_of_cards_of_same_rank = function(hand)
    local selected_rank = (hand and #hand > 0) and hand[1]:get_id() or nil
    local scoring_cards = {}
    for _, card in pairs(hand) do
        if card:get_id() == selected_rank then
            table.insert(scoring_cards, card)
        end
    end
    return scoring_cards
end

local triple_pair = P({
    key = "TriplePair",
    visible = false,
    chips = 190,
    mult = 19,
    l_chips = 60,
    l_mult = 12,
    example = {
        { "S_A", true },
        { "D_A", true },
        { "H_K", true },
        { "S_K", true },
        { "D_Q", true },
        { "H_Q", true },
    },
    evaluate = function(parts, hand)
        if #parts._2 == 3 then
            return { SMODS.merge_lists(parts._2) }
        end
        return {}
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return "Triple Pair"
    end
})

local full_mansion = P({
    key = "FullMansion",
    visible = false,
    chips = 220,
    mult = 22,
    l_chips = 70,
    l_mult = 15,
    example = {
        { "S_A", true },
        { "D_A", true },
        { "H_A", true },
        { "C_A", true },
        { "S_K", true },
        { "D_K", true },
    },
    evaluate = function(parts, hand)
        if next(parts._4) and next(parts._2) then
            local fm_4 = parts._4[1]
            local fm_2 = nil
            for i = 1, #parts._2 do
                if parts._2[i][1]:get_id() ~= fm_4[1]:get_id() then
                    fm_2 = parts._2[i]
                    break
                end
            end
            if fm_2 then
                return { SMODS.merge_lists({fm_4, fm_2}) }
            end
        end
        return {}
    end,
    modify_display_text = function(self, cards, scoring_hand)
        return "FullMansion"
    end
})

local god_hand = P({
    key = "GodHand",
    visible = false,
    chips = 250,
    mult = 26,
    l_chips = 80,
    l_mult = 20,
    example = {
        { "S_A", true },
        { "D_A", true },
        { "H_A", true },
        { "S_A", true },
        { "D_A", true },
        { "H_A", true },
    },
    evaluate = function(parts, hand)
        local scoring_cards = get_number_of_cards_of_same_rank(hand)
        if #scoring_cards == 6 then
            return { scoring_cards }
        end
        return {}
    end,
})

local magic_hand = P({
    key = "MagicHand",
    visible = false,
    chips = 300,
    mult = 30,
    l_chips = 90,
    l_mult = 25,
    example = {
        { "S_A", true },
        { "D_A", true },
        { "H_A", true },
        { "C_A", true },
        { "S_A", true },
        { "D_A", true },
    },
    evaluate = function(parts, hand)
        local allowed_variants = {
            {sticker = 'fire_sticker', name_key = "ina_magic_fire"},
            {sticker = 'forest_sticker', name_key = "ina_magic_forest"},
            {sticker = 'mountain_sticker', name_key = "ina_magic_mountain"},
            {sticker = 'wind_sticker', name_key = "ina_magic_wind"}
        }
        local rank_counts = {}
        for _, card in ipairs(hand) do
            local id = card:get_id()
            rank_counts[id] = rank_counts[id] or {}
            table.insert(rank_counts[id], card)
        end
        local best_scoring = {}
        local current_variant = nil
        for _, cards in pairs(rank_counts) do
            if #cards >= 6 then
                for _, variant in ipairs(allowed_variants) do
                    local variant_cards = {}
                    for _, c in ipairs(cards) do
                        if c.ability and c.ability[variant.sticker] then table.insert(variant_cards, c) end
                    end
                    if #variant_cards >= 6 and #variant_cards > #best_scoring then
                        best_scoring = variant_cards
                        current_variant = variant.name_key
                    end
                end
            end
        end
        if #best_scoring >= 6 then 
            G.GAME.magic_hand_variant = current_variant
            return { best_scoring } 
        end
        G.GAME.magic_hand_variant = nil
        return {}
    end,
    modify_display_text = function(self, cards, scoring_hand)
        if G.GAME and G.GAME.magic_hand_variant then
            return localize(G.GAME.magic_hand_variant, "poker_hands")
        end
        return localize("ina_MagicHand", "poker_hands")
    end
})

return {
    name = "Hands",
    list = { triple_pair, full_mansion, god_hand, magic_hand }
}
