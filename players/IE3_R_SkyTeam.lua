local Anorel = J({
  name = "Anorel",
  pos = { x = 1, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 1,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Nenel = J({
  name = "Nenel",
  pos = { x = 2, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 2,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Genel = J({
  name = "Genel",
  pos = { x = 3, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ekadel = J({
  name = "Ekadel",
  pos = { x = 4, y = 18 },
  config = { extra = { odds = 3 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 4,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.individual and context.cardarea == G.play then
      if pseudorandom('ekadel') < G.GAME.probabilities.normal / card.ability.extra.odds then
        if Pokerleven.rank_up(context.other_card) then
          return {
            message = localize('ina_rank_up'),
            colour = G.C.WIND
          }
        end
      end
    end
  end
})

local Lephiel = J({
  name = "Lephiel",
  pos = { x = 5, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 5,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Sachinel = J({
  name = "Sachinel",
  pos = { x = 6, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 6,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Wenel = J({
  name = "Wenel",
  pos = { x = 7, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 7,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Nuel = J({
  name = "Nuel",
  pos = { x = 8, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 8,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ientel = J({
  name = "Ientel",
  pos = { x = 9, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 9,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gaiel = J({
  name = "Gaiel",
  pos = { x = 10, y = 18 },
  config = { extra = { savings = 0 } },
  loc_vars = function(self, info_queue, center)
    local savings = G.GAME and G.GAME.gaiel_savings or 0
    return { vars = { number_format(savings) } }
  end,
  rarity = 3,
  pools = { ["Sky Team"] = true },
  cost = 10,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 10,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = false,
  calculate = function(self, card, context)
  end
})

local Sael = J({
  name = "Sael",
  pos = { x = 4, y = 2 },
  soul_pos = { x = 4, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "ina_top",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_UNKNOWN,
  pdorsal = 11,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Sky Team",
  list = { Ekadel, Gaiel }
}
