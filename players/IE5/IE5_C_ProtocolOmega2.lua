-- Kilo (3)
local Kilo = J({
  name = "Kilo",
  pos = { x = 1, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega 2.0"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 3,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega2",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Foxtrot (5)
local Foxtrot = J({
  name = "Foxtrot",
  pos = { x = 2, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega 2.0"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 5,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega2",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Noviembre (7)
local Noviembre = J({
  name = "Noviembre",
  pos = { x = 3, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega 2.0"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 7,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega2",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Beta (10)
local Beta = J({
  name = "Beta",
  pos = { x = 4, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Protocol Omega 2.0"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pcaptain = C.CAPTAIN,
  pnumber = 10,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega2",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Protocol Omega 2.0",
  list = {  }
}
