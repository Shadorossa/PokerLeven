-- Aiden Froste (10)
local Aiden_Froste = J({
  name = "Aiden Froste",
  pos = { x = 9, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Alpine (Ares)"] = true },
  cost = 7,
  atlas = "Jokers07",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 10,
  pyear = C.YEAR_2,
  pteam = "ina_team_AlpinoAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Shawn Froste (9)
local Shawn_Froste_A = J({
  name = "Shawn Froste",
  pos = { x = 10, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Alpine (Ares)"] = true },
  cost = 7,
  atlas = "Jokers07",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pcaptain = C.CAPTAIN,
  pnumber = 9,
  pyear = C.YEAR_3,
  pteam = "ina_team_AlpinoAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bunny Cottontail (17)
local Bunny_Cottontail = J({
  name = "Bunny Cottontail",
  pos = { x = 11, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Alpine (Ares)"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.JAPAN,
  pnumber = 17,
  pyear = C.YEAR_1,
  pteam = "ina_team_AlpinoAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kevin Dragonfly (19)
local Kevin_Dragonfly_A = J({
  name = "Kevin Dragonfly",
  pos = { x = 12, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Alpine (Ares)"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 19,
  pyear = C.YEAR_3,
  pteam = "ina_team_AlpinoAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Alpine (Ares)",
  list = {  }
}
