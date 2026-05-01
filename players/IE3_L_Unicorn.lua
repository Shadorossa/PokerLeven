-- Billy Dash (1)
local Billy_Dash = J({
  name = "Billy Dash",
  pos = { x = 0, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_3,
  pnumber = 1,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ted Bryant (2)
local Ted_Bryant = J({
  name = "Ted Bryant",
  pos = { x = 1, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pnumber = 2,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tony Strider (3)
local Tony_Strider = J({
  name = "Tony Strider",
  pos = { x = 2, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pnumber = 3,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Drake Dynamo (4)
local Drake_Dynamo = J({
  name = "Drake Dynamo",
  pos = { x = 3, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bobby Shearer (5)
local Bobby_Shearer = J({
  name = "Bobby Shearer",
  pos = { x = 4, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = { C.JAPAN, C.USA },
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Steve Woodmark (6)
local Steve_Woodmark = J({
  name = "Steve Woodmark",
  pos = { x = 5, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Erik Eagle (7)
local Erik_Eagle = J({
  name = "Erik Eagle",
  pos = { x = 6, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = { C.JAPAN, C.USA },
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Shane Pierce (8)
local Shane_Pierce = J({
  name = "Shane Pierce",
  pos = { x = 7, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pnumber = 8,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mark Krueger (9)
local Mark_Krueger = J({
  name = "Mark Krueger",
  pos = { x = 8, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Unicorn"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pnumber = 9,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Dylan Keats (10)
local Dylan_Keats = J({
  name = "Dylan Keats",
  pos = { x = 9, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pnumber = 10,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gabriel Jax (11)
local Gabriel_Jax = J({
  name = "Gabriel Jax",
  pos = { x = 10, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pnumber = 11,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Alex Hawke (12)
local Alex_Hawke = J({
  name = "Alex Hawke",
  pos = { x = 11, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_3,
  pnumber = 12,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Corey Washington (13)
local Corey_Washington = J({
  name = "Corey Washington",
  pos = { x = 12, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_1,
  pnumber = 13,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bob Bobbins (14)
local Bob_Bobbins = J({
  name = "Bob Bobbins",
  pos = { x = 13, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_1,
  pnumber = 14,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Petie Pooma (15)
local Petie_Pooma = J({
  name = "Petie Pooma",
  pos = { x = 14, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_1,
  pnumber = 15,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Norbert Poindexter (16)
local Norbert_Poindexter = J({
  name = "Norbert Poindexter",
  pos = { x = 15, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.USA,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Unicorn",
  list = {
    Billy_Dash, Ted_Bryant, Tony_Strider, Drake_Dynamo, Bobby_Shearer,
    Steve_Woodmark, Erik_Eagle, Shane_Pierce, Mark_Krueger, Dylan_Keats,
    Gabriel_Jax, Alex_Hawke, Corey_Washington, Bob_Bobbins, Petie_Pooma, Norbert_Poindexter
  }
}
