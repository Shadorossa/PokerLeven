local Blasi = J({
  name = "Blasi",
  pos = { x = 0, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ottorino = J({
  name = "Ottorino",
  pos = { x = 1, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Anton = J({
  name = "Anton",
  pos = { x = 2, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Marco = J({
  name = "Marco",
  pos = { x = 3, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Giorgio = J({
  name = "Giorgio",
  pos = { x = 4, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Dante = J({
  name = "Dante",
  pos = { x = 5, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Angelo = J({
  name = "Angelo",
  pos = { x = 6, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Paolo = J({
  name = "Paolo Bianchi",
  pos = { x = 7, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Orpheus"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Nakata = J({
  name = "Hidetoshi Nakata",
  pos = { x = 8, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 3,
  pools = { ["Orpheus"] = true },
  cost = 8,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gianluca = J({
  name = "Gianluca",
  pos = { x = 9, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Raffaele = J({
  name = "Raffaele",
  pos = { x = 10, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Orpheus",
  list = {}
}