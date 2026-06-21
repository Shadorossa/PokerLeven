-- Joseph King (1)
local Joseph_King = J({
  name = "Joseph King",
  pos = { x = 1, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Royal Academy (Ares)"] = true },
  cost = 7,
  atlas = "Jokers07",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 1,
  pyear = C.YEAR_3,
  pteam = "ina_team_RoyalAcademyAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Nathan Swift (12)
local Nathan_Swift = J({
  name = "Nathan Swift",
  pos = { x = 2, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Royal Academy (Ares)"] = true },
  cost = 7,
  atlas = "Jokers07",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 12,
  pyear = C.YEAR_3,
  pteam = "ina_team_RoyalAcademyAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Grotley Bogwash (18)
local Grotley_Bogwash = J({
  name = "Grotley Bogwash",
  pos = { x = 3, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Royal Academy (Ares)"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pcaptain = C.CAPTAIN,
  pnumber = 18,
  pyear = C.YEAR_1,
  pteam = "ina_team_RoyalAcademyAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Caleb Stonewall (19)
local Caleb_Stonewall = J({
  name = "Caleb Stonewall",
  pos = { x = 4, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Royal Academy (Ares)"] = true },
  cost = 7,
  atlas = "Jokers07",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 19,
  pyear = C.YEAR_3,
  pteam = "ina_team_RoyalAcademyAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Royal Academy (Ares)",
  list = {  }
}
