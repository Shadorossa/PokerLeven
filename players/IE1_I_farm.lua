-- Greeny
local Greeny = J({
    name = "Greeny",
    pos = { x = 8, y = 9 },
    config = { extra = { barriers_added = 1, DF_required = 2, barriers = 3 } },
    loc_vars = function(self, info_queue, center)
        table.insert(info_queue, { set = 'Other', key = 'Right_Footed' })
        return {
            vars = { center.ability.extra.barriers_added, center.ability.extra.DF_required,
                center.ability.extra.barriers }
        }
    end,
    rarity = 1,
    pools = { ["ina_team_Farm"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Fire,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 1,
    pteam = "ina_team_Farm",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind
            and not context.blueprint
            and card:has_enough_barriers()
            and card:is_rightmost_joker() then
            local combinations = Pokerleven.get_all_type_pos_combinations()
            local selected_combination = pseudorandom_element(combinations, pseudoseed('training'))

            if Pokerleven.spawn_consumable(C.TRAINING, selected_combination) then
                Pokerleven.ease_barriers(-card.ability.extra.barriers)
                return { message = localize("ina_technique_card"), colour = G.C.MULT }
            end
        end

        if context.setting_blind then
            local df_required = card.ability.extra.DF_required
            if Pokerleven.has_enough_position(C.DF, df_required) then
                local barriers_added = card.ability.extra.barriers_added
                return Pokerleven.ease_barriers(barriers_added, true)
            end
        end
    end
})

-- Hayseed
local Hayseed = J({
    name = "Hayseed",
    pos = { x = 9, y = 9 },
    config = {
        extra = {
            current_mult = 0,
            mult_mod_low = 4
        }
    },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.mult_mod_low, center.ability.extra.current_mult or 0 } }
    end,
    rarity = 1,
    pools = { ["ina_team_Farm"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 2,
    pteam = "ina_team_Farm",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.scoring_hand and context.joker_main
            and card.ability.extra.current_mult > 0 then
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.current_mult } },
                mult_mod = card.ability.extra.current_mult,
                colour = G.C.MULT
            }
        end
        if context.before and context.cardarea == G.jokers and context.scoring_hand
            and next(context.poker_hands["Three of a Kind"]) and #context.scoring_hand == 3 then
            card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.mult_mod_low
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.MULT
            }
        end
    end
})

-- Work
local Work = J({
  name = "Work",
  pos = { x = 10, y = 9 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 3,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Hillvalley
local Hillvalley = J({
    name = "Hillvalley",
    pos = { x = 11, y = 9 },
    config = { extra = { current_chips = 0, triggered = false } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.current_chips } }
    end,
    rarity = 1,
    pools = { ["ina_team_Farm"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 4,
    pteam = "ina_team_Farm",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.scoring_hand and context.other_card and
            context.cardarea == G.play and
            (context.other_card:get_id() == 8 or
                context.other_card:get_id() == 9 or
                context.other_card:get_id() == 10) then
            card.ability.extra.current_chips = card.ability.extra.current_chips + context.other_card:get_id()
            card.ability.extra.triggered = true
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                card = card
            }
        end

        if context.scoring_hand and context.joker_main and card.ability.extra.current_chips > 0 then
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.current_chips } },
                colour = G.C.CHIPS,
                chip_mod = card.ability.extra.current_chips
            }
        end
    end
})

-- Sherman
local Sherman = J({
    name = "Sherman",
    pos = { x = 12, y = 9 },
    config = { extra = { current_chips = 0, chip_mod = 5 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.chip_mod, center.ability.extra.current_chips } }
    end,
    rarity = 1,
    pools = { ["ina_team_Farm"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    pdorsal = 5,
    pteam = "ina_team_Farm",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.post_trigger and context.other_card ~= card
            and context.other_card.ability and context.other_card.ability.extra.pteam
      and context.other_card.ability.extra.pteam == "ina_team_Farm" then
            card.ability.extra.current_chips =
                card.ability.extra.current_chips + card.ability.extra.chip_mod

            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize("ina_evolve_level"),
                        colour = G.C.XMULT
                    })
                    return true
                end
            }))
            return {}
        end

        if context.scoring_hand and context.cardarea == G.jokers
            and context.joker_main then
            if card.ability.extra.current_chips > 0 then
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.current_chips } },
                    colour = G.C.CHIPS,
                    chip_mod = card.ability.extra.current_chips
                }
            end
        end
    end
})

-- Milky
local Milky = J({
  name = "Milky",
  pos = { x = 0, y = 10 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 6,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Mother
local Mother = J({
  name = "Mother",
  pos = { x = 1, y = 10 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 7,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Spray
local Spray = J({
    name = "Spray",
    pos = { x = 2, y = 10 },
    config = { extra = { current_Xmult = 1, max_money = 4, Xmult_mod = 0.25, triggered = false } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.max_money, center.ability.extra.Xmult_mod, center.ability.extra.current_Xmult } }
    end,
    rarity = 2,
    pools = { ["ina_team_Farm"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 8,
    pteam = "ina_team_Farm",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            if G.GAME.dollars < card.ability.extra.max_money then
                card.ability.extra.current_Xmult = card.ability.extra.current_Xmult + card.ability.extra.Xmult_mod
                card.ability.extra.triggered = true
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT
                }
            end
        end

        if Pokerleven.is_joker_turn(context) and context.scoring_hand and card.ability.extra.current_Xmult > 1 then
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.current_Xmult } },
                colour = G.C.XMULT,
                Xmult_mod = card.ability.extra.current_Xmult
            }
        end
    end
})

-- Roast
local Roast = J({
  name = "Roast",
  pos = { x = 3, y = 10 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 9,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Dawson
local Dawson = J({
    name = "Dawson",
    pos = { x = 4, y = 10 },
    config = { extra = { max_money = 2, triggered = false } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.max_money } }
    end,
    rarity = 2,
    pools = { ["ina_team_Farm"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pdorsal = 10,
    pteam = "ina_team_Farm",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if Pokerleven.is_joker_turn(context) and G.GAME.dollars < card.ability.extra.max_money
            and #context.full_hand == 1 then
            G.E_MANAGER:add_event(Event({ delay = 0.5, func = function() Pokerleven.clone_playing_card(context.scoring_hand[1], G.deck, 1); return true end }))
            card.ability.extra.triggered = true
            return {
                message = "DAWSON!",
                colour = G.C.XMULT
            }
        end
    end
})

-- Muffs
local Muffs = J({
    name = "Muffs",
    pos = { x = 5, y = 10 },
    config = { extra = { current_mult = 0, mult_mod_low = 3, triggered = false } },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Harvester' }
        return { vars = { center.ability.extra.mult_mod_low, center.ability.extra.current_mult } }
    end,
    rarity = 2,
    pools = { ["ina_team_Farm"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 11,
    pteam = "ina_team_Farm",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.discard and context.other_card.ability["ina_harvest_sticker"] == true then
            card.ability.extra.current_mult =
                card.ability.extra.current_mult + card.ability.extra.mult_mod_low
            card.ability.extra.triggered = true
            return {
                message = localize("ina_harvest"),
                colour = G.C.MULT,
                card = context.other_card
            }
        end
        if context.after and context.cardarea == G.jokers and G.hand and #G.hand.cards > 0 then
            local random_index = math.random(1, #G.hand.cards)
            local selected_card = G.hand.cards[random_index]

            G.E_MANAGER:add_event(Event({
                delay = 0.5,
                func = function()
                    selected_card.ability["ina_harvest_sticker"] = true
                    return true
                end
            }))
            card.ability.extra.triggered = true
            return {
                message = localize("ina_seed"),
                colour = G.C.MULT,
                card = selected_card
            }
        end

        if context.scoring_hand and Pokerleven.is_joker_turn(context)
            and card.ability.extra.current_mult > 0 then
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.current_mult } },
                colour = G.C.MULT,
                mult_mod = card.ability.extra.current_mult,
            }
        end
    end
})

-- Mower
local Mower = J({
  name = "Mower",
  pos = { x = 6, y = 10 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 12,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Grower
local Grower = J({
  name = "Grower",
  pos = { x = 7, y = 10 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 13,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Howells
local Howells = J({
  name = "Howells",
  pos = { x = 8, y = 10 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 14,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Lively
local Lively = J({
  name = "Lively",
  pos = { x = 9, y = 10 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 15,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Nevis
local Nevis = J({
  name = "Nevis",
  pos = { x = 10, y = 10 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Farm"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 16,
  pteam = "ina_team_Farm",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
    name = "Farm",
    list = { Greeny, Hayseed, Hillvalley, Sherman, Spray, Dawson, Muffs },
}

