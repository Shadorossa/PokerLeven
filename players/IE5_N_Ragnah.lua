-- Kohlt (1)
local Kohlt = J({
  name = "Kohlt",
  pos = { x = 11, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 1,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Eidah (2)
local Eidah = J({
  name = "Eidah",
  pos = { x = 12, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 2,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hamstah (3)
local Hamstah = J({
  name = "Hamstah",
  pos = { x = 0, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 3,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mouton (4)
local Mouton = J({
  name = "Mouton",
  pos = { x = 1, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 4,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Swihn (5)
local Swihn = J({
  name = "Swihn",
  pos = { x = 2, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 5,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Felis (6)
local Felis = J({
  name = "Felis",
  pos = { x = 3, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 6,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Psitta (7)
local Psitta = J({
  name = "Psitta",
  pos = { x = 4, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 7,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mehr (8)
local Mehr_L = J({
  name = "Mehr",
  pos = { x = 5, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["The Lagoon"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 8,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ghiris (9)
local Ghiris_L = J({
  name = "Ghiris",
  pos = { x = 6, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["The Lagoon"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 9,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Simeon Ayp (10)
local Simeon_Ayp = J({
  name = "Simeon Ayp",
  pos = { x = 7, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 3,
  pools = { ["The Lagoon"] = true },
  cost = 12,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pcaptain = C.CAPTAIN,
  pnumber = 10,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Canis (11)
local Canis = J({
  name = "Canis",
  pos = { x = 8, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 11,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sinapis (12)
local Sinapis = J({
  name = "Sinapis",
  pos = { x = 9, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 12,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Chincha (13)
local Chincha = J({
  name = "Chincha",
  pos = { x = 10, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 13,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Vora (14)
local Vora = J({
  name = "Vora",
  pos = { x = 11, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 14,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Snoshu (15)
local Snoshu = J({
  name = "Snoshu",
  pos = { x = 12, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 15,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Rosmarus (16)
local Rosmarus = J({
  name = "Rosmarus",
  pos = { x = 0, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["The Lagoon"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 16,
  pyear = C.UNKNOWN,
  pteam = "ina_team_TheLagoon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "The Lagoon",
  list = {  }
}
