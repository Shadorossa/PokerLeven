local Billy = J({
  name = "Billy Rapid",
  pos = { x = 0, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ted = J({
  name = "Ted Bryan",
  pos = { x = 1, y = 11 },
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
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Tony = J({
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
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Dyne = J({
  name = "Dyne Star",
  pos = { x = 3, y = 11 },
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
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Bobby = J({
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
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Krueger = J({
  name = "Mark Krueger",
  pos = { x = 5, y = 11 },
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
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Keats = J({
  name = "Dylan Keats",
  pos = { x = 6, y = 11 },
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
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Erik = J({
  name = "Erik Eagle",
  pos = { x = 7, y = 11 },
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
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Mich = J({
  name = "Mich Ryan",
  pos = { x = 8, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Steve = J({
  name = "Steve Eagle",
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
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Shane = J({
  name = "Shane Pierce",
  pos = { x = 10, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Unicorn"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_Unicorn",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Unicorn",
  list = {}
}