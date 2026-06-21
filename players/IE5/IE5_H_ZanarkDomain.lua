-- Eka (1)
local Eka = J({
  name = "Eka",
  pos = { x = 7, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 1,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Dva (2)
local Dva = J({
  name = "Dva",
  pos = { x = 8, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 2,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tyrah (3)
local Tyrah = J({
  name = "Tyrah",
  pos = { x = 9, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 3,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Catvari (4)
local Catvari = J({
  name = "Catvari",
  pos = { x = 10, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 4,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Panca (5)
local Panca = J({
  name = "Panca",
  pos = { x = 11, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 5,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sas (6)
local Sas = J({
  name = "Sas",
  pos = { x = 12, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 6,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sapta (7)
local Sapta = J({
  name = "Sapta",
  pos = { x = 0, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 7,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Asta (8)
local Asta = J({
  name = "Asta",
  pos = { x = 1, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 8,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Navan (9)
local Navan = J({
  name = "Navan",
  pos = { x = 2, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 9,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zanark Avalonic (10)
local Zanark_Avalonic = J({
  name = "Zanark Avalonic",
  pos = { x = 3, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 3,
  pools = { ["Zanark Domain"] = true },
  cost = 10,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pcaptain = C.CAPTAIN,
  pnumber = 10,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Dasan (11)
local Dasan = J({
  name = "Dasan",
  pos = { x = 4, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 11,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sata (12)
local Sata = J({
  name = "Sata",
  pos = { x = 5, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 12,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sahasra (13)
local Sahasra = J({
  name = "Sahasra",
  pos = { x = 6, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 13,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ayuta (14)
local Ayuta = J({
  name = "Ayuta",
  pos = { x = 7, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 14,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Laksha (15)
local Laksha = J({
  name = "Laksha",
  pos = { x = 8, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 15,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Niyuta (16)
local Niyuta = J({
  name = "Niyuta",
  pos = { x = 9, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 16,
  pyear = C.UNKNOWN,
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Zanark Domain",
  list = {  }
}