local Fermin = J({
  name = "Fermín Sánchez",
  pos = { x = 0, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Red Matadors"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Jose = J({
  name = "José Costa",
  pos = { x = 1, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Rafael = J({
  name = "Rafael López",
  pos = { x = 2, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Antonio = J({
  name = "Antonio Gallego",
  pos = { x = 3, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Queraldo = J({
  name = "Queraldo Naval",
  pos = { x = 4, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Pedro = J({
  name = "Pedro Moreno",
  pos = { x = 5, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Miguel = J({
  name = "Miguel Pereira",
  pos = { x = 6, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Carlos = J({
  name = "Carlos Arroyo",
  pos = { x = 7, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Isaac = J({
  name = "Isaac César",
  pos = { x = 8, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Federico = J({
  name = "Federico Rubiera",
  pos = { x = 9, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Samuel = J({
  name = "Samuel Mayo",
  pos = { x = 10, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Red Matadors"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pteam = "ina_team_RedMatadors",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Red Matadors",
  list = {}
}