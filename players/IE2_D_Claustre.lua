local Kik = J({
  name = "Kik",
  pos = { x = 8, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Waxon = J({
  name = "Waxon",
  pos = { x = 9, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Sparky = J({
  name = "Sparky",
  pos = { x = 10, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Maxi = J({
  name = "Maxi",
  pos = { x = 11, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Water = J({
  name = "Water",
  pos = { x = 12, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Fardream = J({
  name = "Fardream",
  pos = { x = 0, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Telektual = J({
  name = "Telektual",
  pos = { x = 1, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Dinglite = J({
  name = "Dinglite",
  pos = { x = 2, y = 4 },
  config = { extra = { mult = 0, gain = 5 } },
  loc_vars = function(self, info_queue, center) return { vars = { center.ability.extra.mult, center.ability.extra.gain } } end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.after and G.GAME.current_round.discards_left == 0 and not ctx.blueprint then
      ex.mult = ex.mult + ex.gain; return { message = localize('k_upgrade_ex'), colour = G.C.MULT }
    end
    if Pokerleven.is_joker_turn(ctx) and ex.mult > 0 then
      return { mult_mod = ex.mult, message = localize { type = 'variable', key = 'a_mult', vars = { ex.mult } } }
    end
  end
})

local Marshall = J({
  name = "Marshall",
  pos = { x = 3, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Wando = J({
  name = "Wando",
  pos = { x = 4, y = 4 },
  config = { extra = { repetitions = 2 } },
  loc_vars = function(self, info_queue, center) return { vars = { center.ability.extra.repetitions } } end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.retrigger_joker_check and not ctx.retrigger_joker and ctx.scoring_name == 'Three of a Kind' then
      local id = ctx.other_card:get_id()
      if id >= 2 and id <= 4 then
        return {
          message = localize('k_again_ex'),
          repetitions = card.ability.extra
              .repetitions,
          card = card
        }
      end
    end
  end
})

local Dirk = J({
  name = "Dirk",
  pos = { x = 5, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Scotty = J({
  name = "Scotty",
  pos = { x = 6, y = 4 },
  config = { extra = { chips = 50, odds = 4 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chips, G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
  end,
  rarity = 2,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if Pokerleven.is_joker_turn(ctx) then
      return {
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
        chip_mod =
            card.ability.extra.chips,
        colour = G.C.CHIPS
      }
    elseif ctx.setting_blind and not ctx.blueprint then
      if pseudorandom('scotty') < G.GAME.probabilities.normal / card.ability.extra.odds then
        ina_evolve(card, 'j_ina_Scotty_Angry')
      end
    end
  end
})

local Scotty_Angry = J({
  name = "Scotty_Angry",
  pos = { x = 6, y = 4 },
  soul_pos = { x = 7, y = 4 },
  config = { extra = { chips = 100 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chips } }
  end,
  rarity = 2,
  pools = { ["Claustro Sagrado"] = false },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if Pokerleven.is_joker_turn(ctx) then
      return {
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
        chip_mod =
            card.ability.extra.chips,
        colour = G.C.CHIPS
      }
    elseif ctx.after and not ctx.blueprint then
      local lowest, lowest_id = nil, 15
      for _, c in ipairs(ctx.scoring_hand) do
        if c:get_id() < lowest_id and not c.destroyed then lowest, lowest_id = c, c:get_id() end
      end
      if lowest then
        if lowest.ability.name == 'Glass Card' then
          lowest.shattered = true; lowest:shatter()
        else
          lowest.destroyed = true; lowest:start_dissolve()
        end
        return { message = localize('ina_destroy'), colour = G.C.RED }
      end
    elseif Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
      card.ability.extra.chips = card.ability.extra.chips + 50
      return { message = localize('ina_upgrade'), colour = G.C.GOLD }
    end
  end
})

local Bookworm = J({
  name = "Bookworm",
  pos = { x = 9, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gami = J({
  name = "Gami",
  pos = { x = 10, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Kandel = J({
  name = "Kandel",
  pos = { x = 11, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ation = J({
  name = "Ation",
  pos = { x = 12, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_ClaustroSagrado",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.selling_self and not ctx.blueprint then
      local val = card.sell_cost
      for _, v in ipairs(G.jokers.cards) do
        if v ~= card and is_team(v, 'ina_team_ClaustroSagrado') and v.ability.extra and v.ability.extra.mult then
          v.ability.extra.mult = v.ability.extra.mult + val
          card_eval_status_text(v, 'extra', nil, nil, nil, { message = localize('k_upgrade_ex'), colour = G.C.MULT })
        end
      end
    end
  end
})

return {
  name = "Claustro Sagrado",
  list = { Dinglite, Wando, Ation }
}
