local Blasi = J({
  name = "Gigi Blasi",
  pos = { x = 0, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Galliano = J({
  name = "Vento Galliano",
  pos = { x = 1, y = 12 },
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
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Nobili = J({
  name = "Otto Nobili",
  pos = { x = 2, y = 12 },
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
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Graziuso = J({
  name = "Anton Graziuso",
  pos = { x = 3, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Maserati = J({
  name = "Marco Maserati",
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
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gabrini = J({
  name = "Angelo Gabrini",
  pos = { x = 5, y = 12 },
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
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Nakata = J({
  name = "Hidetoshi Nakata",
  pos = { x = 6, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Orpheus"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = { C.JAPAN, C.ITALY },
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Yani = J({
  name = "Giacomo Yani",
  pos = { x = 7, y = 12 },
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
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Diavolo = J({
  name = "Dante Diavolo",
  pos = { x = 8, y = 12 },
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
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Bianchi = J({
  name = "Paolo Bianchi",
  pos = { x = 9, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Orpheus"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Generani = J({
  name = "Raffaele Generani",
  pos = { x = 10, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Santini = J({
  name = "Daniele Santini",
  pos = { x = 11, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Oconti = J({
  name = "Enrico Oconti",
  pos = { x = 12, y = 12 },
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
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Rossa = J({
  name = "Alessandro Rossa",
  pos = { x = 13, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Carnivale = J({
  name = "Giuseppe Carnivale",
  pos = { x = 14, y = 12 },
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
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Zanardi = J({
  name = "Gianluca Zanardi",
  pos = { x = 15, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Orpheus"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ITALY,
  pteam = "ina_team_Orpheus",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Orpheus",
  list = { }
}
