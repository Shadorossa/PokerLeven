-- Hotel (1)
local Hotel = J({
  name = "Hotel",
  pos = { x = 11, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 1,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Oscar (2)
local Oscar = J({
  name = "Oscar",
  pos = { x = 12, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 2,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Eco (3)
local Eco = J({
  name = "Eco",
  pos = { x = 0, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 3,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Golf (4)
local Golf = J({
  name = "Golf",
  pos = { x = 1, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 4,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Charlie (5)
local Charlie = J({
  name = "Charlie",
  pos = { x = 2, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 5,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Lima (6)
local Lima = J({
  name = "Lima",
  pos = { x = 3, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 6,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bravo (7)
local Bravo = J({
  name = "Bravo",
  pos = { x = 4, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 7,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- India (8)
local India = J({
  name = "India",
  pos = { x = 5, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 8,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Julieta (9)
local Julieta = J({
  name = "Julieta",
  pos = { x = 6, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 9,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Alfa (10)
local Alfa = J({
  name = "Alfa",
  pos = { x = 7, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Protocol Omega"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pcaptain = C.CAPTAIN,
  pnumber = 10,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mike (11)
local Mike = J({
  name = "Mike",
  pos = { x = 8, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 11,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Uniform (12)
local Uniform = J({
  name = "Uniform",
  pos = { x = 9, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 12,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tango (13)
local Tango = J({
  name = "Tango",
  pos = { x = 10, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 13,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zulu (14)
local Zulu = J({
  name = "Zulu",
  pos = { x = 11, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 14,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- X-Ray (15)
local X_Ray = J({
  name = "X-Ray",
  pos = { x = 12, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 15,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Delta (16)
local Delta = J({
  name = "Delta",
  pos = { x = 0, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Protocol Omega"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 16,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ProtocolOmega",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Protocol Omega",
  list = {  }
}
