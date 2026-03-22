local wild_tag = {
    object_type = "Tag",
    atlas = "Tags01",
    name = "wild_tag",
    order = 27,
    pos = { x = 0, y = 0 },
    config = { type = "store_joker_create" },
    key = "wild_tag",
    min_ante = 2,
    discovered = false,
    loc_vars = function(self, info_queue)
        return { vars = {} }
    end,
    apply = function(self, tag, context)
        if context and context.type == "store_joker_create" then
            local card = nil

            local possible_teams = {}
            if G.jokers and G.jokers.cards then
                for _, v in pairs(G.jokers.cards) do
                    if v.ability and type(v.ability.extra) == "table" and v.ability.extra.pteam then
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

            card = create_random_ina_joker("wildtag", "Uncommon", context.area, selected_team)
            create_shop_card_ui(card, 'Joker', context.area)
            card.states.visible = false
            tag:yep('+', G.C.GREEN, function()
                if pseudorandom('wild_tag', 1, 8) == 1 then
                    card:set_edition('e_negative')
                end
                card:start_materialize()
                card.ability.couponed = true
                card:set_cost()
                return true
            end)

            tag.triggered = true
            return card
        end
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local chain_tag = {
    object_type = "Tag",
    atlas = "Tags01",
    name = "chain_tag",
    order = 27,
    pos = { x = 1, y = 0 },
    config = {},
    key = "chain_tag",
    min_ante = 2,
    discovered = false,
    loc_vars = function(self, info_queue)
        return { vars = {} }
    end,
    apply = function(self, tag, context)
        if G.GAME.round_resets.blind == G.P_BLINDS.bl_small then
            tag:yep('+', G.C.GREEN, function()
                reroll_big()
                return true
            end)
        else
            tag:yep('+', G.C.GREEN, function()
                G.FUNCS.reroll_boss()
                return true
            end)
        end

        tag.triggered = true
        return true
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local bench_tag = T({
    object_type = "Tag",
    atlas = "Tags01",
    name = "bench_tag",
    order = 27,
    pos = { x = 3, y = 4 },
    config = {},
    key = "bench_tag",
    min_ante = 1,
    discovered = false,
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_ina_manager_pack
    end,
    apply = function(self, tag, context)
        return Pokerleven.open_booster_from_tag(tag, 'p_ina_manager_pack', context)
    end,
    ina_credits = {
        art = { "Shadorossa" }
    },
    in_pool = function(self, args)
        if #Pokerleven.ina_manager_area.cards >= Pokerleven.ina_manager_area.config.card_limit then
            return false
        end
        return true
    end
})

local technique_tag = {
    object_type = "Tag",
    atlas = "Tags01",
    name = "technique_tag",
    order = 27,
    pos = { x = 4, y = 3 },
    config = {},
    key = "technique_tag",
    min_ante = 6,
    discovered = false,
    loc_vars = function(self, info_queue, tag)
        info_queue[#info_queue + 1] = G.P_CENTERS.p_ina_mega_training_pack
    end,
    apply = function(self, tag, context)
        return Pokerleven.open_booster_from_tag(tag, 'p_ina_mega_training_pack', context)
    end,
    ina_credits = {
        art = { "Shadorossa" }
    }
}

local function apply_coin(self, tag, context)
    if context.type == 'immediate' then
        G.GAME.ina_gacha_coins = G.GAME.ina_gacha_coins or {blue = 0, red = 0, silver = 0, purple = 0, gold = 0}
        local color = self.config.coin_color
        if color then G.GAME.ina_gacha_coins[color] = (G.GAME.ina_gacha_coins[color] or 0) + 1 end
        tag:yep('+', G.C.GOLD, function() return true end)
        tag.triggered = true
        return true
    end
end

local coin_blue_tag = {
    object_type = "Tag",
    atlas = "Tags01",
    name = "coin_blue_tag",
    order = 28,
    pos = { x = 1, y = 1 },
    config = { type = "immediate", coin_color = "blue" },
    key = "coin_blue_tag",
    min_ante = 1,
    weight = 8.0,
    discovered = false,
    loc_vars = function(self, info_queue) return { vars = {} } end,
    apply = apply_coin,
}

local coin_red_tag = {
    object_type = "Tag",
    atlas = "Tags01",
    name = "coin_red_tag",
    order = 29,
    pos = { x = 2, y = 1 },
    config = { type = "immediate", coin_color = "red" },
    key = "coin_red_tag",
    min_ante = 1,
    weight = 4.0,
    discovered = false,
    loc_vars = function(self, info_queue) return { vars = {} } end,
    apply = apply_coin,
}

local coin_silver_tag = {
    object_type = "Tag",
    atlas = "Tags01",
    name = "coin_silver_tag",
    order = 30,
    pos = { x = 3, y = 1 },
    config = { type = "immediate", coin_color = "silver" },
    key = "coin_silver_tag",
    min_ante = 1,
    weight = 1.5,
    discovered = false,
    loc_vars = function(self, info_queue) return { vars = {} } end,
    apply = apply_coin,
}

local coin_purple_tag = {
    object_type = "Tag",
    atlas = "Tags01",
    name = "coin_purple_tag",
    order = 31,
    pos = { x = 4, y = 1 },
    config = { type = "immediate", coin_color = "purple" },
    key = "coin_purple_tag",
    min_ante = 1,
    weight = 0.4,
    discovered = false,
    loc_vars = function(self, info_queue) return { vars = {} } end,
    apply = apply_coin,
}

local coin_gold_tag = {
    object_type = "Tag",
    atlas = "Tags01",
    name = "coin_gold_tag",
    order = 32,
    pos = { x = 5, y = 1 },
    config = { type = "immediate", coin_color = "gold" },
    key = "coin_gold_tag",
    min_ante = 1,
    weight = 0.1,
    discovered = false,
    loc_vars = function(self, info_queue) return { vars = {} } end,
    apply = apply_coin,
}

return {
    name = "Tags",
    list = { wild_tag, chain_tag, bench_tag, technique_tag, coin_blue_tag, coin_red_tag, coin_silver_tag, coin_purple_tag, coin_gold_tag }
}
