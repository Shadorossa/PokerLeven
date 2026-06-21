local Atlas = "Jokers02"
local team_id = "ina_team_YoungInazuma"

-- 1. Hillman (Capitán)
local Hillman = J({
  name = "Hillman_Young",
  pos = { x = 4, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 3,
  pools = { ["Young Inazuma"] = true },
  cost = 8,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 2. Island
local Island = J({
  name = "Island_Young",
  pos = { x = 5, y = 14 },
  config = { extra = { chips = 10, count = 0, trigger_at = 3 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.chips, ex.count, ex.trigger_at } }
  end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context)
    if context.joker_main and context.poker_hands['Two Pair'] then
      return {
        chip_mod = card.ability.extra.chips,
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
      }
    end

    if context.before and not context.blueprint and context.poker_hands['Two Pair'] then
      card.ability.extra.count = card.ability.extra.count + 1
      if card.ability.extra.count >= card.ability.extra.trigger_at then
        card.ability.extra.count = 0
        update_hand_stack(context.scoring_hand, 1) -- Función de Balatro para subir nivel
        return {
          card = card,
          message = localize('k_level_up_ex')
        }
      end
    end
  end
})

-- 3. Hairtown
local Hairtown = J({
  name = "Hairtown_Young",
  pos = { x = 6, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 4. Sweet
local Sweet = J({
  name = "Sweet_Young",
  pos = { x = 7, y = 14 },
  config = { extra = { joker_limit_loss = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.joker_limit_loss + 1 } }
  end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  add_to_deck = function(self, card, from_debuff)
    if G.jokers then
      G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.joker_limit_loss
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers then
      G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.joker_limit_loss
    end
  end,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local spawn_effect = spawn_random_ina_joker(card, context,
        { ["Common"] = 0.7, ["Uncommon"] = 0.25, ["Rare"] = 0.05 },
        { ["ina_team_Raimon"] = 0.5, ["ina_team_YoungInazuma"] = 0.5 }
      )
      spawn_effect.func()
    end
  end
})

-- 5. Butler
local Butler = J({
  name = "Butler_Young",
  pos = { x = 8, y = 14 },
  config = { extra = { bankrupt_at = 40, chips_per_debt = 2, debt_step = 2, cost_mult = 1.5 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    local current_chips = 0
    if G.GAME and G.GAME.dollars < 0 then
        current_chips = math.floor(math.abs(G.GAME.dollars) / ex.debt_step) * ex.chips_per_debt
    end
    return { vars = { ex.bankrupt_at, ex.debt_step, ex.chips_per_debt, ex.cost_mult, current_chips } }
  end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_YoungInazuma",
  add_to_deck = function(self, card, from_debuff)
    G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.bankrupt_at
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.bankrupt_at
  end,
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.dollars < 0 then
      local chips = math.floor(math.abs(G.GAME.dollars) / card.ability.extra.debt_step) * card.ability.extra.chips_per_debt
      if chips > 0 then
        return {
          chip_mod = chips,
          message = localize { type = 'variable', key = 'a_chips', vars = { chips } }
        }
      end
    end

    if context.set_cost and context.card and context.card.ability and context.card.ability.set == 'Booster' then
      context.card.cost = math.floor(context.card.cost * card.ability.extra.cost_mult)
    end
  end
})

-- 6. Nathaniel
local Nathaniel = J({
  name = "Nathaniel_Young",
  pos = { x = 9, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 7. Gladstone
local Gladstone = J({
  name = "Gladstone_Young",
  pos = { x = 10, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 8. Tailor
local Tailor = J({
  name = "Tailor_Young",
  pos = { x = 11, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 9. Barista
local Barista = J({
  name = "Barista_Young",
  pos = { x = 12, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Young Inazuma"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 10. Suffolk
local Suffolk = J({
  name = "Suffolk_Young",
  pos = { x = 0, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 11. Builder
local Builder = J({
  name = "Builder_Young",
  pos = { x = 1, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Young Inazuma"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

return {
  name = "Young Inazuma",
  list = { Island, Sweet, Butler }
}
