-- Bhufa (1)
local Bhufa = J({
  name = "Bhufa",
  pos = { x = 6, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 1,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zohtan (2)
local Zohtan = J({
  name = "Zohtan",
  pos = { x = 7, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 2,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mustah (3)
local Mustah = J({
  name = "Mustah",
  pos = { x = 8, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 3,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mohrir (4)
local Mohrir = J({
  name = "Mohrir",
  pos = { x = 9, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 4,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ghimus (5)
local Ghimus = J({
  name = "Ghimus",
  pos = { x = 10, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 5,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tzeikh (6)
local Tzeikh = J({
  name = "Tzeikh",
  pos = { x = 11, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 6,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Miehd (7)
local Miehd = J({
  name = "Miehd",
  pos = { x = 12, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 7,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mehr (8)
local Mehr = J({
  name = "Mehr",
  pos = { x = 0, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Gir"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pcaptain = C.CAPTAIN,
  pnumber = 8,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ghiris (9)
local Ghiris = J({
  name = "Ghiris",
  pos = { x = 1, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Gir"] = true },
  cost = 7,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 9,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Chell (10)
local Chell = J({
  name = "Chell",
  pos = { x = 2, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 10,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zetoh (11)
local Zetoh = J({
  name = "Zetoh",
  pos = { x = 3, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 11,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Enimaux (12)
local Enimaux = J({
  name = "Enimaux",
  pos = { x = 4, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 12,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Darehn (13)
local Darehn = J({
  name = "Darehn",
  pos = { x = 5, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 13,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mabhi (14)
local Mabhi = J({
  name = "Mabhi",
  pos = { x = 6, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 14,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Nahrje (15)
local Nahrje = J({
  name = "Nahrje",
  pos = { x = 7, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pnumber = 15,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Veneth (16)
local Veneth = J({
  name = "Veneth",
  pos = { x = 8, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Gir"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pnumber = 16,
  pyear = C.UNKNOWN,
  pteam = "ina_team_Gir",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Gir",
  list = {  }
}
