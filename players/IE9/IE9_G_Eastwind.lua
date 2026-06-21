-- Martino Leone
local Martino = J({
  name = "Martino",
  pos = { x = 7, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 1,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jenny Okutba
local Jenny = J({
  name = "Jenny",
  pos = { x = 8, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 2,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gigy Maharaja
local Gigy = J({
  name = "Gigy",
  pos = { x = 9, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 3,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Robart Anderson
local Robart = J({
  name = "Robart",
  pos = { x = 10, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Maribelle Flanmir
local Maribelle = J({
  name = "Maribelle",
  pos = { x = 11, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Toyo Yamanouchi
local Yamanouchi = J({
  name = "Yamanouchi",
  pos = { x = 12, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 3,
  pools = { ["Eastwind"] = true },
  cost = 8,
  atlas = "Jokers09",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pnumber = 6,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ming Chow
local Ming = J({
  name = "Ming",
  pos = { x = 0, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Judie Cassios
local Judie = J({
  name = "Judie",
  pos = { x = 1, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 8,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Joey Beat
local Joey = J({
  name = "Joey",
  pos = { x = 2, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 9,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kai Yoshizaki
local Yoshizaki = J({
  name = "Yoshizaki",
  pos = { x = 3, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 10,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sikuvot Shivan
local Sikuvot = J({
  name = "Sikuvot",
  pos = { x = 4, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 11,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Olson Carchis
local Olson = J({
  name = "Olson",
  pos = { x = 5, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mengmeng Wang
local Mengmeng = J({
  name = "Mengmeng",
  pos = { x = 6, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kain Vijet
local Kain = J({
  name = "Kain",
  pos = { x = 7, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 14,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kaos Dao
local Kaos = J({
  name = "Kaos",
  pos = { x = 8, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 15,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Edmond Pias
local Edmond = J({
  name = "Edmond",
  pos = { x = 9, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Eastwind"] = true },
  cost = 5,
  atlas = "Jokers09",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_Eastwind",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Eastwind",
  list = {}
}
