local Freddy = J({
  name = "Freddy McQueen",
  pos = { x = 0, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Galen = J({
  name = "Galen Mayhew",
  pos = { x = 1, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Lance = J({
  name = "Lance Roof",
  pos = { x = 2, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Edge = J({
  name = "Edge Edwards",
  pos = { x = 3, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Peter = J({
  name = "Peter Cole",
  pos = { x = 4, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gary = J({
  name = "Gary Linkless",
  pos = { x = 5, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Paul = J({
  name = "Paul Appleton",
  pos = { x = 6, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Eric = J({
  name = "Eric Huntley",
  pos = { x = 7, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Philip = J({
  name = "Philip Owen",
  pos = { x = 8, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Edgar = J({
  name = "Edgar Partinus",
  pos = { x = 9, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Knights of Queen"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gareth = J({
  name = "Gareth Barrett",
  pos = { x = 10, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Knights of Queen",
  list = {}
}