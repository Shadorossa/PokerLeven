local Fox = J({
  name = "Fox",
  pos = { x = 0, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Zoolan Team"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Jackal = J({
  name = "Jackal",
  pos = { x = 1, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Buffalo = J({
  name = "Buffalo",
  pos = { x = 2, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Owl = J({
  name = "Owl",
  pos = { x = 3, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hedgehog = J({
  name = "Hedgehog",
  pos = { x = 4, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Mantis = J({
  name = "Mantis",
  pos = { x = 5, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Crow = J({
  name = "Crow",
  pos = { x = 6, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Coyote = J({
  name = "Coyote",
  pos = { x = 7, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Scorpion = J({
  name = "Scorpion",
  pos = { x = 8, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Condor = J({
  name = "Condor",
  pos = { x = 9, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Spider = J({
  name = "Spider",
  pos = { x = 10, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Zoolan Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_ZoolanTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Zoolan Team",
  list = {}
}