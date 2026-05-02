

-- Ingram (1)
local Ingram = J({
  name = "Ingram",
  pos = { x = 3, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 1,
  pyear = C.YEAR_3,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sefton (2)
local Sefton = J({
  name = "Sefton",
  pos = { x = 4, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 2,
  pyear = C.YEAR_1,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Strike (3)
local Strike = J({
  name = "Strike",
  pos = { x = 5, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 3,
  pyear = C.YEAR_2,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Porter (4)
local Porter = J({
  name = "Porter",
  pos = { x = 6, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 4,
  pyear = C.YEAR_2,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Chops (5)
local Chops = J({
  name = "Chops",
  pos = { x = 7, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 5,
  pyear = C.YEAR_1,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Chaney (6)
local Chaney = J({
  name = "Chaney",
  pos = { x = 8, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 6,
  pyear = C.YEAR_2,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Rhymes (7)
local Rhymes = J({
  name = "Rhymes",
  pos = { x = 9, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 7,
  pyear = C.YEAR_2,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Scott (8)
local Scott = J({
  name = "Scott",
  pos = { x = 10, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 8,
  pyear = C.YEAR_1,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Edmonds (9)
local Edmonds = J({
  name = "Edmonds",
  pos = { x = 11, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Umbrella"] = true },
  cost = 6,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pcaptain = C.CAPTAIN,
  pnumber = 9,
  pyear = C.YEAR_1,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Morefield (10)
local Morefield = J({
  name = "Morefield",
  pos = { x = 12, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 10,
  pyear = C.YEAR_1,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Cyborg (11)
local Cyborg = J({
  name = "Cyborg",
  pos = { x = 0, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 11,
  pyear = C.YEAR_2,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Banker (12)
local Banker = J({
  name = "Banker",
  pos = { x = 1, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 12,
  pyear = C.YEAR_2,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tunk (13)
local Tunk = J({
  name = "Tunk",
  pos = { x = 2, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 13,
  pyear = C.YEAR_1,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Most (14)
local Most = J({
  name = "Most",
  pos = { x = 3, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 14,
  pyear = C.YEAR_1,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Caperock (15)
local Caperock = J({
  name = "Caperock",
  pos = { x = 4, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 15,
  pyear = C.YEAR_1,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Molehill (16)
local Molehill = J({
  name = "Molehill",
  pos = { x = 5, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Umbrella"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pnumber = 16,
  pyear = C.YEAR_2,
  pteam = "ina_team_Umbrella",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Umbrella",
  list = {  }
}
