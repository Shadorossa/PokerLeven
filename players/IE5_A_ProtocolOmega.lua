-- Alpha
local Alpha = J({
  name = "Alpha",
  pos = { x = 0, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Protocol Omega"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = "Wind",
  pposition = "FW",
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Beta
local Beta = J({
  name = "Beta",
  pos = { x = 1, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Protocol Omega"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = "Forest",
  pposition = "FW",
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gamma
local Gamma = J({
  name = "Gamma",
  pos = { x = 2, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Protocol Omega"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = "Fire",
  pposition = "FW",
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Protocol Omega",
  list = { }
}