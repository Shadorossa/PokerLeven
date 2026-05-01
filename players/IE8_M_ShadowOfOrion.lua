-- Procyon
local Procyon = J({
  name = "Procyon",
  pos = { x = 0, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_2,
  pnumber = 1,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tabit
local Tabit = J({
  name = "Tabit",
  pos = { x = 1, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_3,
  pnumber = 2,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Meissa
local Meissa = J({
  name = "Meissa",
  pos = { x = 2, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.RUSSIA,
  pyear = C.YEAR_3,
  pnumber = 3,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Saiph
local Saiph = J({
  name = "Saiph",
  pos = { x = 3, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_1,
  pnumber = 4,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Alnitak
local Alnitak = J({
  name = "Alnitak",
  pos = { x = 4, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_1,
  pnumber = 5,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Alnilam
local Alnilam = J({
  name = "Alnilam",
  pos = { x = 5, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mintaka
local Mintaka = J({
  name = "Mintaka",
  pos = { x = 6, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bella (Bellatrix)
local Bella = J({
  name = "Bella",
  pos = { x = 7, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_3,
  pnumber = 8,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Rigel
local Rigel = J({
  name = "Rigel",
  pos = { x = 8, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_1,
  pnumber = 9,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jade Beor
local Jade = J({
  name = "Jade Beor",
  pos = { x = 9, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 3,
  pools = { ["Shadow of Orion"] = true },
  cost = 8,
  atlas = "Jokers08",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.RUSSIA,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pnumber = 10,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Betelgeuse (Geuse)
local Geuse = J({
  name = "Geuse",
  pos = { x = 10, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_3,
  pnumber = 11,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sirius
local Sirius = J({
  name = "Sirius",
  pos = { x = 11, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_1,
  pnumber = 14,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kappa
local Kappa = J({
  name = "Kappa",
  pos = { x = 0, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_2,
  pnumber = 15,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hatysa
local Hatysa = J({
  name = "Hatysa",
  pos = { x = 1, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Shadow of Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.RUSSIA,
  pyear = C.YEAR_3,
  pnumber = 17,
  pteam = "ina_team_ShadowOfOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "ShadowOfOrion",
  list = {}
}
