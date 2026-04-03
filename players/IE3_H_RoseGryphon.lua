local JeanLuc = J({
  name = "Jean-Luc",
  pos = { x = 0, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Francis = J({
  name = "Francis Poujol",
  pos = { x = 1, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Pierre = J({
  name = "Pierre Godin",
  pos = { x = 2, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Rose Gryphon"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Alain = J({
  name = "Alain",
  pos = { x = 3, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Claude = J({
  name = "Claude",
  pos = { x = 4, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Roland = J({
  name = "Roland Pérec",
  pos = { x = 5, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Julien = J({
  name = "Julien Rousseau",
  pos = { x = 6, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Antoine = J({
  name = "Antoine",
  pos = { x = 7, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Louis = J({
  name = "Louis",
  pos = { x = 8, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Michel = J({
  name = "Michel Morland",
  pos = { x = 9, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Jacques = J({
  name = "Jacques",
  pos = { x = 10, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Rose Gryphon",
  list = {}
}