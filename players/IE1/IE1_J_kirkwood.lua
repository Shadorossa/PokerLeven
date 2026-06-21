-- Neville
local Neville = J({
    name = "Neville",
    pos = { x = 11, y = 10 },
    config = { extra = { new_glass_denom = 6 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { G.GAME.probabilities.normal, G.GAME.probabilities.new_glass_denom or center.ability.extra.new_glass_denom } }
    end,
    rarity = 1,
    pools = { ["ina_team_Kirkwood"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Fire,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    pdorsal = 1,
    pteam = "ina_team_Kirkwood",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.probabilities.new_glass_denom = card.ability.extra.new_glass_denom
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.probabilities.new_glass_denom = nil
    end,
})

-- Night
local Night = J({
    name = "Night",
    pos = { x = 12, y = 10 },
    config = {},
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    pools = { ["ina_team_Kirkwood"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 2,
    pteam = "ina_team_Kirkwood",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            local spawn_effect = spawn_random_ina_joker(card, context,
                {
                    ["Common"] = 0.6,
                    ["Uncommon"] = 0.4
                },
                {
          ["ina_team_Kirkwood"] = 1,
                }
            )
            spawn_effect.func()
        end
    end,
})

-- Meenan
local Meenan = J({
  name = "Meenan",
  pos = { x = 0, y = 11 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 3,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Mirthful
local Mirthful = J({
  name = "Mirthful",
  pos = { x = 1, y = 11 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 4,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Ricky Clover
local Ricky_Clover = J({
  name = "Ricky Clover",
  pos = { x = 2, y = 11 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 5,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Damian
local Damian = J({
    name = "Damian",
    pos = { x = 3, y = 11 },
    config = { extra = { chip_mod = 7, current_chips = 0, triggered = false } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.chip_mod, center.ability.extra.current_chips } }
    end,
    rarity = 1,
    pools = { ["ina_team_Kirkwood"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 6,
    pteam = "ina_team_Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.ending_shop then
            card.ability.extra.triggered = true
            local count = #find_player_type("Fire")

            if count > 0 then
                card.ability.extra.current_chips = card.ability.extra.current_chips +
                    card.ability.extra.chip_mod * count
            end
            return {
                message = localize("k_upgrade_ex"),
                colour = G.C.CHIPS,
            }
        end

        if context.scoring_hand and Pokerleven.is_joker_turn(context) then
            if card.ability.extra.current_chips > 0 then
                return {
                    message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.current_chips } },
                    colour = G.C.CHIPS,
                    chip_mod = card.ability.extra.current_chips
                }
            end
        end
    end,
})

-- Nashmith
local Nashmith = J({
    name = "Nashmith",
    pos = { x = 4, y = 11 },
    config = { extra = { chip_mod = 15 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.chip_mod } }
    end,
    rarity = 1,
    pools = { ["ina_team_Kirkwood"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pdorsal = 7,
    pteam = "ina_team_Kirkwood",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card then
            if context.other_card:is_suit("Spades") then
                local forest_count = #find_player_type("Forest") or 0
                local extra_chips = card.ability.extra.chip_mod * forest_count

                if extra_chips > 0 then
                    return {
                        message = localize {
                            type = 'variable',
                            key = 'a_chips',
                            vars = { extra_chips }
                        },
                        chip_mod = extra_chips,
                        colour = G.C.CHIPS,
                    }
                end
            end
        end
    end,
})

-- Moore
local Moore = J({
  name = "Moore",
  pos = { x = 5, y = 11 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 8,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Marvin
local Marvin = J({
    name = "Marvin",
    pos = { x = 6, y = 11 },
    config = { extra = { mult_mod_low = 4 } },
    loc_vars = function(self, info_queue, center)
        local mult_mod = center.ability.extra.mult_mod_low
        table.insert(info_queue, { set = "Other", key = "Trillizos" })
        return { vars = { mult_mod } }
    end,
    rarity = 2,
    pools = { ["ina_team_Kirkwood"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 9,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        local scoring_card = Pokerleven.card_scoring(context)
        if context.individual and scoring_card and scoring_card:is_uneven() then
            local mult_mod = card.ability.extra.mult_mod_low
            return {
                mult = mult_mod,
                card = card
            }
        end
    end,
})

-- Thomas
local Thomas = J({
    name = "Thomas",
    pos = { x = 7, y = 11 },
    config = { extra = { chip_mod = 15, retrigger_count = 1 } },
    loc_vars = function(self, info_queue, center)
        local chip_mod = center.ability.extra.chip_mod
        table.insert(info_queue, { set = "Other", key = "Trillizos" })
        return { vars = { chip_mod } }
    end,
    rarity = 2,
    pools = { ["ina_team_Kirkwood"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 10,
    pteam = "ina_team_Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        local scoring_card = Pokerleven.card_scoring(context)
        if context.repetition and context.cardarea == G.play and
            (function() return next(find_joker("Marvin")) and next(find_joker("Thomas")) and next(find_joker("Tyler")) end)() and
            scoring_card and scoring_card:is_uneven() then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.retrigger_count,
                card = scoring_card
            }
        end

        if context.individual and scoring_card and scoring_card:is_uneven() then
            local chip_mod = card.ability.extra.chip_mod
            return {
                chips = chip_mod,
                card = card
            }
        end
    end,
})

-- Tyler
local Tyler = J({
    name = "Tyler",
    pos = { x = 8, y = 11 },
    config = { extra = { odds = 4 } },
    loc_vars = function(self, info_queue, center)
        table.insert(info_queue, { set = "Other", key = "Trillizos" })
        return { vars = { G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
    end,
    rarity = 2,
    pools = { ["ina_team_Kirkwood"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Mountain,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 11,
    pteam = "ina_team_Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, context)
        local scoring_card = Pokerleven.card_scoring(context)
        if context.individual and scoring_card
            and scoring_card:is_uneven()
            and card:odds_triggered('Tyler') then
            if Pokerleven.spawn_consumable('Tarot') then
                return {message = localize('k_plus_tarot'), colour = G.C.PURPLE, card = card}
            end
        end
    end
})

-- Calier
local Calier = J({
  name = "Calier",
  pos = { x = 9, y = 11 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 12,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Gloom
local Gloom = J({
  name = "Gloom",
  pos = { x = 10, y = 11 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 13,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Talis
local Talis = J({
  name = "Talis",
  pos = { x = 11, y = 11 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 14,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Middleton
local Middleton = J({
  name = "Middleton",
  pos = { x = 12, y = 11 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 15,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Wells
local Wells = J({
  name = "Wells",
  pos = { x = 0, y = 12 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Kirkwood"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 16,
  pteam = "ina_team_Kirkwood",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
    name = "Kirkwood",
    list = { Neville, Night, Damian, Nashmith, Marvin, Thomas, Tyler }
}


