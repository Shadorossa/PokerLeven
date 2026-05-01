local Astaroth = J({
  name = "Astaroth",
  pos = { x = 3, y = 17 },
  config = { extra = { extra_hands = 1, played_count = 0, current_extra = 1, threshold = 10 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.extra_hands, center.ability.extra.played_count, center.ability.extra.current_extra, center.ability.extra.threshold } }
  end,
  rarity = 3,
  pools = { ["Dark Team"] = true },
  cost = 8,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.GAME or not G.jokers or card.area ~= G.jokers then return end
    
    if context.setting_blind and not self.getting_sliced and not context.blueprint then
      card.ability.extra.current_extra = card.ability.extra.extra_hands
    end

    if context.joker_main and (G.GAME and G.GAME.current_round and G.GAME.current_round.hands_left or 0) == 0 then
      if card.ability.extra.current_extra > 0 then
        card.ability.extra.current_extra = card.ability.extra.current_extra - 1
        if not context.blueprint then
          card.ability.extra.played_count = card.ability.extra.played_count + 1
          if card.ability.extra.played_count >= card.ability.extra.threshold then
            card.ability.extra.played_count = 0
            card.ability.extra.extra_hands = card.ability.extra.extra_hands + 1
          end
        end
        G.E_MANAGER:add_event(Event({
          func = function()
            G.GAME.current_round.hands_left = G.GAME.current_round.hands_left + 1
            return true
          end
        }))
        return {
          message = localize('ina_oblivion'),
          colour = G.C.BLACK
        }
      end
    end
  end
})

local Rubu = J({
  name = "Rubú",
  pos = { x = 4, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Dark Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Agor = J({
  name = "Agor",
  pos = { x = 5, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Dark Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hebimos = J({
  name = "Hebimos",
  pos = { x = 6, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Dark Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Belal = J({
  name = "Belal",
  pos = { x = 7, y = 17 },
  config = { extra = { reduction = 0.85 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { (1 - center.ability.extra.reduction) * 100 } }
  end,
  rarity = 2,
  pools = { ["Dark Team"] = true },
  cost = 6,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.GAME or not G.jokers or card.area ~= G.jokers then return end

    if context.joker_main and Pokerleven.get_cards_of_suite(C.Mountain, context.scoring_hand) > 0 then
      G.E_MANAGER:add_event(Event({
        func = function()
          G.GAME.blind.chips = G.GAME.blind.chips * card.ability.extra.reduction
          G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
          return true
        end
      }))
      return {
        message = localize('ina_hell_drop'),
        colour = G.C.MOUNTAIN
      }
    end
  end
})

local Malphas = J({
  name = "Malphas",
  pos = { x = 8, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Dark Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gorja = J({
  name = "Gorja",
  pos = { x = 9, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Dark Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Arakune = J({
  name = "Arakune",
  pos = { x = 10, y = 17 },
  config = { extra = { odds = 3 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.odds, G.GAME.probabilities.normal or 1 } }
  end,
  rarity = 2,
  pools = { ["Dark Team"] = true },
  cost = 6,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.discard and not context.blueprint then
      if pseudorandom('arakune') < G.GAME.probabilities.normal / card.ability.extra.odds then
        if Pokerleven.spawn_consumable('Tarot', 'c_hanged_man') then
          return {
            message = localize('k_plus_tarot'),
            colour = G.C.SECONDARY_SET.Tarot,
            card = card
          }
        end
      end
    end
  end
})

local Borba = J({
  name = "Borba",
  pos = { x = 11, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Dark Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Zanos = J({
  name = "Zanos",
  pos = { x = 12, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Dark Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Destra = J({
  name = "Destra",
  pos = { x = 3, y = 2 },
  soul_pos = { x = 3, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Dark Team"] = true },
  cost = 5,
  atlas = "ina_top",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_DarkTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Dark Team",
  list = { Astaroth, Belal, Arakune }
}
