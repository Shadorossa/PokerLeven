-- Chitoh (1)
local Chitoh = J({
  name = "Chitoh",
  pos = { x = 9, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 1,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kazach (2)
local Kazach = J({
  name = "Kazach",
  pos = { x = 10, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 2,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Fumh (3)
local Fumh = J({
  name = "Fumh",
  pos = { x = 11, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 3,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gumille (4)
local Gumille = J({
  name = "Gumille",
  pos = { x = 12, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 4,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Yurkeh (5)
local Yurkeh = J({
  name = "Yurkeh",
  pos = { x = 0, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 5,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Rokah (6)
local Rokah = J({
  name = "Rokah",
  pos = { x = 1, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 6,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Pinoh (7)
local Pinoh = J({
  name = "Pinoh",
  pos = { x = 2, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 7,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tahk (8)
local Tahk = J({
  name = "Tahk",
  pos = { x = 3, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 8,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Fei Rune (9)
local Fei_Rune_G = J({
  name = "Fei Rune",
  pos = { x = 4, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 3,
  pools = { ["Gar"] = true },
  cost = 10,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pcaptain = C.CAPTAIN,
  pnumber = 9,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Dekih (10)
local Dekih = J({
  name = "Dekih",
  pos = { x = 5, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 10,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Yuh (11)
local Yuh = J({
  name = "Yuh",
  pos = { x = 6, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 11,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bhabass (12)
local Bhabass = J({
  name = "Bhabass",
  pos = { x = 7, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 12,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sheenai (13)
local Sheenai = J({
  name = "Sheenai",
  pos = { x = 8, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 13,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tessell (14)
local Tessell = J({
  name = "Tessell",
  pos = { x = 9, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 14,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Chikka (15)
local Chikka = J({
  name = "Chikka",
  pos = { x = 10, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 15,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mahrsa (16)
local Mahrsa = J({
  name = "Mahrsa",
  pos = { x = 11, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gar"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 16,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gar",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Gar",
  list = {  }
}
