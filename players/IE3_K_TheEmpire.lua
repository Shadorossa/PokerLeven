local Ortega = J({
  name = "Ortega",
  pos = { x = 0, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Thiago = J({
  name = "Thiago Torres",
  pos = { x = 1, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["The Empire"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gorde = J({
  name = "Gorde",
  pos = { x = 2, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Santana = J({
  name = "Santana",
  pos = { x = 3, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Bertoni = J({
  name = "Bertoni",
  pos = { x = 4, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hernan = J({
  name = "Hernan",
  pos = { x = 5, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ramos = J({
  name = "Ramos",
  pos = { x = 6, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Lopez = J({
  name = "Lopez",
  pos = { x = 7, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Diego = J({
  name = "Diego",
  pos = { x = 8, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Leone = J({
  name = "Leone Batista",
  pos = { x = 9, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Garcian = J({
  name = "Garcian",
  pos = { x = 10, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "The Empire",
  list = {}
}