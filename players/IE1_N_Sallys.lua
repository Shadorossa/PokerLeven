

-- Yuma (1)
local Yuma = J({
  name = "Yuma",
  pos = { x = 9, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.F,
  pnation = C.JAPAN,
  pnumber = 1,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Fielding (2)
local Fielding = J({
  name = "Fielding",
  pos = { x = 10, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pnumber = 2,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Lovely (3)
local Lovely = J({
  name = "Lovely",
  pos = { x = 11, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pnumber = 3,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Knuckles (4)
local Knuckles = J({
  name = "Knuckles",
  pos = { x = 12, y = 15 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 4,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sheldon (5)
local Sheldon = J({
  name = "Sheldon",
  pos = { x = 0, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 5,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Squirrel (6)
local Squirrel = J({
  name = "Squirrel",
  pos = { x = 1, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pnumber = 6,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jones (7)
local Jones = J({
  name = "Jones",
  pos = { x = 2, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 7,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Riversong (8)
local Riversong = J({
  name = "Riversong",
  pos = { x = 3, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 8,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Samantha (9)
local Samantha = J({
  name = "Samantha",
  pos = { x = 4, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Sally's"] = true },
  cost = 6,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.JAPAN,
  pcaptain = C.CAPTAIN,
  pnumber = 9,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sandstone (10)
local Sandstone = J({
  name = "Sandstone",
  pos = { x = 5, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 10,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Prentice (11)
local Prentice = J({
  name = "Prentice",
  pos = { x = 6, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 11,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Holmes (12)
local Holmes = J({
  name = "Holmes",
  pos = { x = 7, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 12,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Stager (13)
local Stager = J({
  name = "Stager",
  pos = { x = 8, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 13,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Crumb (14)
local Crumb = J({
  name = "Crumb",
  pos = { x = 9, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 14,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Baughan (15)
local Baughan = J({
  name = "Baughan",
  pos = { x = 10, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 15,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Daltry (16)
local Daltry = J({
  name = "Daltry",
  pos = { x = 11, y = 16 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Sally's"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pnumber = 16,
  pyear = C.ADULT,
  pteam = "ina_team_Sallys",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Sally's",
  list = {  }
}
