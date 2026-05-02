-- Feduhm (1)
local Feduhm = J({
  name = "Feduhm",
  pos = { x = 3, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 1,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tsync (2)
local Tsync = J({
  name = "Tsync",
  pos = { x = 4, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 2,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Driss (3)
local Driss = J({
  name = "Driss",
  pos = { x = 5, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 3,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ludeau (4)
local Ludeau = J({
  name = "Ludeau",
  pos = { x = 6, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 4,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Deos (5)
local Deos = J({
  name = "Deos",
  pos = { x = 7, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 5,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Grigham (6)
local Grigham = J({
  name = "Grigham",
  pos = { x = 8, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 6,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zatang (7)
local Zatang = J({
  name = "Zatang",
  pos = { x = 9, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 7,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Rodh (8)
local Rodh = J({
  name = "Rodh",
  pos = { x = 10, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 8,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Djibz (9)
local Djibz = J({
  name = "Djibz",
  pos = { x = 11, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 9,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zanark Avalonic (10)
local Zanark_Avalonic_Z = J({
  name = "Zanark Avalonic",
  pos = { x = 12, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 3,
  pools = { ["Zan"] = true },
  cost = 10,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pcaptain = C.CAPTAIN,
  pnumber = 10,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Garreau (11)
local Garreau = J({
  name = "Garreau",
  pos = { x = 0, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 11,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Steiyah (12)
local Steiyah = J({
  name = "Steiyah",
  pos = { x = 1, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 12,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mhadoor (13)
local Mhadoor = J({
  name = "Mhadoor",
  pos = { x = 2, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 13,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Heyze (14)
local Heyze = J({
  name = "Heyze",
  pos = { x = 3, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 14,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kuhrach (15)
local Kuhrach = J({
  name = "Kuhrach",
  pos = { x = 4, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 15,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Torhm (16)
local Torhm = J({
  name = "Torhm",
  pos = { x = 5, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zan"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 16,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Zan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Zan",
  list = {  }
}
