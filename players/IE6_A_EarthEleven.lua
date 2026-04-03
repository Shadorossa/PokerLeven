-- Terry Archibald (Ibuki Munemasa)
local Terry = J({
  name = "Terry",
  pos = { x = 0, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Earth Eleven"] = true },
  cost = 7,
  atlas = "Jokers06",
  ptype = "Mountain",
  pposition = "GK",
  pteam = "ina_team_EarthEleven",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Falco Flashman (Matatagi Hayato)
local Falco = J({
  name = "Falco",
  pos = { x = 1, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Earth Eleven"] = true },
  cost = 7,
  atlas = "Jokers06",
  ptype = "Wind",
  pposition = "FW",
  pteam = "ina_team_EarthEleven",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Trina Verdure (Morimura Konoha)
local Trina = J({
  name = "Trina",
  pos = { x = 2, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Earth Eleven"] = true },
  cost = 5,
  atlas = "Jokers06",
  ptype = "Forest",
  pposition = "DF",
  pteam = "ina_team_EarthEleven",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Earth Eleven",
  list = {  }
}