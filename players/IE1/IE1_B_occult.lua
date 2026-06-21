-- Mask
local Mask = J({
  name = "Mask",
  pos = { x = 0, y = 1 },
  config = { extra = { sell_value = 6 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.sell_value } }
  end,
  rarity = 2,
  pools = { ["ina_team_Occult"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 1,
  pteam = "ina_team_Occult",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not card.getting_sliced and not context.blueprint then
      local sliced_card = card:get_right_joker()
      if sliced_card and not card.getting_sliced and not sliced_card.ability.eternal and not sliced_card.getting_sliced then
        sliced_card.getting_sliced = true
        card.ability.extra_value = card.ability.extra_value + card.ability.extra.sell_value
        card:set_cost()

        G.E_MANAGER:add_event(Event({
          func = function()
            card:juice_up(0.8, 0.8)
            sliced_card:start_dissolve({ HEX("57ecab") }, nil, 1.6)
            play_sound('slice1', 0.96 + math.random() * 0.08)
            return true
          end
        }))
        card_eval_status_text(card, 'extra', nil, nil, nil,
          {
            message = localize { type = 'variable', key = 'a_mult',
              vars = { card.ability.extra.sell_value } },
            colour = G.C.RED,
            no_juice = true
          })
      end
    end
  end,
})

-- Styx
local Styx = J({
  name = "Styx",
  pos = { x = 1, y = 1 },
  config = { extra = { chip_mod = 9, triggered = false } },
  loc_vars = function(self, info_queue, center)
    local current_chips = 0
    if G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot > 0 then
      current_chips = G.GAME.consumeable_usage_total.tarot * center.ability.extra.chip_mod
    end
    return { vars = { current_chips, center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 2,
  pteam = "ina_team_Occult",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand
        and G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot > 0 then
      if context.joker_main then
        local current_chips = G.GAME.consumeable_usage_total.tarot * card.ability.extra.chip_mod
        card.ability.extra.triggered = true
        return {
          message = localize { type = 'variable', key = 'a_chips', vars = { current_chips } },
          colour = G.C.CHIPS,
          chip_mod = current_chips
        }
      end
    end
  end,
})

-- Creepy
local Creepy_JasonJones = J({
  name = "Creepy",
    pos = { x = 2, y = 1 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 3,
  pteam = "ina_team_Occult",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Franky
local Franky = J({
  name = "Franky",
  pos = { x = 3, y = 1 },
  config = { extra = { mult_mod = 16, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.mult_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 4,
  pteam = "ina_team_Occult",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main and context.scoring_name == "High Card" then
        card.ability.extra.triggered = true
        return {
          message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_mod } },
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult_mod
        }
      end
    end
  end,
})

-- Undead
local Undead = J({
  name = "Undead",
    pos = { x = 4, y = 1 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 5,
  pteam = "ina_team_Occult",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Jiangshi
local Jiangshi = J({
  name = "Jiangshi",
    pos = { x = 5, y = 1 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 6,
  pteam = "ina_team_Occult",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Mummy
local Mummy = J({
  name = "Mummy",
  pos = { x = 6, y = 1 },
  config = { extra = { mult_mod = 4, chip_mod = 4, suit = "Clubs", triggered = false } },
  loc_vars = function(self, info_queue, center)
    return {
      vars = { center.ability.extra.mult_mod,
        center.ability.extra.chip_mod, localize(center.ability.extra.suit, 'suits_singular') }
    }
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 7,
  pteam = "ina_team_Occult",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
      if not context.end_of_round and not context.before and not context.after and not context.other_card.debuff then
        card.ability.extra.triggered = true
        return {
          message = "AAAAAAA",
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult_mod,
          chip_mod = card.ability.extra.chip_mod,
          card = card
        }
      end
    end
  end,
})

-- Grave
local Grave = J({
  name = "Grave",
  pos = { x = 7, y = 1 },
  config = { extra = { odds = 5, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { '' .. (G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds } }
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 8,
  pteam = "ina_team_Occult",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        if context.scoring_hand and context.other_card:get_id() == 6 and card:odds_triggered('Grave') then
            if Pokerleven.spawn_consumable('Tarot', 'c_death') then
                card.ability.extra.triggered = true
                return {message = localize('k_plus_tarot'), colour = G.C.PURPLE, card = card}
            end
        end
    end
  end
})

-- Talisman
local Talisman = J({
  name = "Talisman",
  pos = { x = 8, y = 1 },
  config = { extra = { evolving_retriggers = 1, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.evolving_retriggers } }
  end,
  rarity = 3,
  pools = { ["ina_team_Occult"] = true },
  cost = 8,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 9,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Occult",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= card then
      card.ability.extra.triggered = true;
      if context.other_card == card:get_right_joker() and is_team(context.other_card, "ina_team_Occult") then
        return {
          repetitions = card.ability.extra.evolving_retriggers,
        }
      else
        return nil, true
      end
    end
  end,
})

-- Wolfy
local Wolfy = J({
  name = "Wolfy",
  pos = { x = 9, y = 1 },
  config = { extra = { Xmult_mod = 0.4, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { 1 + center.ability.extra.Xmult_mod * (G.GAME.used_moon_cards or 0), center.ability.extra.Xmult_mod } }
  end,
  rarity = 2,
  pools = { ["ina_team_Occult"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 10,
  pteam = "ina_team_Occult",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_hand
        and 1 + card.ability.extra.Xmult_mod * (G.GAME.used_moon_cards or 0) > 1 then
      card.ability.extra.triggered = true
      return {
        message =
            localize { type = 'variable', key = 'a_xmult',
              vars = { 1 + card.ability.extra.Xmult_mod * (G.GAME.used_moon_cards or 0) } },
        colour = G.C.MULT,
        Xmult_mod = 1 + card.ability.extra.Xmult_mod * (G.GAME.used_moon_cards or 0)
      }
    end
  end,
})

-- Blood
local Blood = J({
  name = "Blood",
  pos = { x = 10, y = 1 },
  config = { extra = { drain = 1, chip_mod = 10, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.drain, center.ability.extra.chip_mod, center.sell_cost * center.ability.extra.chip_mod } }
  end,
  rarity = 2,
  pools = { ["ina_team_Occult"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 11,
  pteam = "ina_team_Occult",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.scoring_hand then
      if context.joker_main then
        card.ability.extra.triggered = true
        return {
          message = localize { type = 'variable', key = 'a_mult', vars = { card.sell_cost * card.ability.extra.chip_mod } },
          colour = G.C.MULT,
          chip_mod = card.sell_cost * card.ability.extra.chip_mod
        }
      end
    end
    if context.end_of_round and not context.individual and not context.repetition then
      local adjacent = get_adjacent_jokers(card)
      for _, adjacent_card in ipairs(adjacent) do
        drain(card, adjacent_card, card.ability.extra.drain)
      end
    end
  end,
})

-- Zombie
local Zombie = J({
  name = "Zombie",
    pos = { x = 11, y = 1 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 12,
  pteam = "ina_team_Occult",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Dollman
local Dollman = J({
  name = "Dollman",
    pos = { x = 12, y = 1 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 13,
  pteam = "ina_team_Occult",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Alien
local Alien = J({
  name = "Alien",
    pos = { x = 0, y = 2 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 14,
  pteam = "ina_team_Occult",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Noir
local Noir = J({
  name = "Noir",
    pos = { x = 1, y = 2 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 15,
  pteam = "ina_team_Occult",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Ghost
local Ghost = J({
  name = "Ghost",
    pos = { x = 2, y = 2 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Occult"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 16,
  pteam = "ina_team_Occult",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
  name = "Occult",
  list = { Mask, Styx, Franky, Mummy, Grave, Talisman, Wolfy, Blood }
}

