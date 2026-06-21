-- Gideon Poe (1)
local Gideon_Poe = J({
  name = "Gideon Poe",
  pos = { x = 12, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Brain (Ares)"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 1,
  pyear = C.YEAR_1,
  pteam = "ina_team_BrainAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Electra Faraday (6)
local Electra_Faraday = J({
  name = "Electra Faraday",
  pos = { x = 0, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Brain (Ares)"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 6,
  pyear = C.YEAR_1,
  pteam = "ina_team_BrainAres",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Brain (Ares)",
  list = {  }
}
