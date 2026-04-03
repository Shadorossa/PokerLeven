local Nasir = J({
  name = "Nasir Mustafa",
  pos = { x = 0, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Fal = J({
  name = "Fal Fal",
  pos = { x = 1, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Musa = J({
  name = "Musa Senan",
  pos = { x = 2, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Yousuf = J({
  name = "Yousuf Pirzada",
  pos = { x = 3, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Bjorn = J({
  name = "Bjorn Kyle",
  pos = { x = 4, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Desert Lion"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Rajab = J({
  name = "Rajab Ismail",
  pos = { x = 5, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local NasirA = J({
  name = "Nasir Adwan",
  pos = { x = 6, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Seif = J({
  name = "Seif Ahmed",
  pos = { x = 7, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Majed = J({
  name = "Majed Ghazzali",
  pos = { x = 8, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Talal = J({
  name = "Talal Hamad",
  pos = { x = 9, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hassan = J({
  name = "Hassan Ahmed",
  pos = { x = 10, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Desert Lion",
  list = {}
}