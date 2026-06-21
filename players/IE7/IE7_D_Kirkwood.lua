-- Trice Topper (1)
local Trice_Topper = J({
  name = "Trice Topper",
  pos = { x = 9, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Kirkwood (Ares)"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 1,
  pyear = C.YEAR_1,
  pteam = "ina_team_KirkwoodAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hilary Prentice (23)
local Hilary_Prentice = J({
  name = "Hilary Prentice",
  pos = { x = 10, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Kirkwood (Ares)"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 23,
  pyear = C.YEAR_1,
  pteam = "ina_team_KirkwoodAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jodi Green (24)
local Jodi_Green = J({
  name = "Jodi Green",
  pos = { x = 11, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Kirkwood (Ares)"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 24,
  pyear = C.YEAR_1,
  pteam = "ina_team_KirkwoodAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Kirkwood (Ares)",
  list = {  }
}
