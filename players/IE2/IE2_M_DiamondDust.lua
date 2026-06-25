-- Ben_North (Beluga)
local Ben_North = J({
  name = "Ben_North",
  pos = { x = 8, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Alan_Downhill (Arkew)
local Alan_Downhill = J({
  name = "Alan_Downhill",
  pos = { x = 9, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Claire_Lesnow (Clear)
local Claire_Lesnow = J({
  name = "Claire_Lesnow",
  pos = { x = 10, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Albert_Denver (Gocker)
local Albert_Denver = J({
  name = "Albert_Denver",
  pos = { x = 11, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Lucy_Hailstone (Icer)
local Lucy_Hailstone = J({
  name = "Lucy_Hailstone",
  pos = { x = 12, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Brad_Coldwater (Balen)
local Brad_Coldwater = J({
  name = "Brad_Coldwater",
  pos = { x = 0, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Dawson_Foxx (Droll)
local Dawson_Foxx = J({
  name = "Dawson_Foxx",
  pos = { x = 1, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Ving_Rice (Rhine)
local Ving_Rice = J({
  name = "Ving_Rice",
  pos = { x = 2, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Bernie_White (Blown)
local Bernie_White = J({
  name = "Bernie_White",
  pos = { x = 3, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Bryce_Whitingale (Gazelle)
local Bryce_Whitingale = J({
  name = "Bryce_Whitingale",
  pos = { x = 7, y = 0 },
  soul_pos = { x = 7, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = "ina_top", -- Destacado
  pools = { ["DiamondDust"] = true },
  cost = 15,
  atlas = "top",
  ptype = C.Wind,
  pposition = C.FW,
  techtype = C.UPGRADES.Grade,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Denzel_Freezer (Frost)
local Denzel_Freezer = J({
  name = "Denzel_Freezer",
  pos = { x = 4, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["DiamondDust"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.FW,
  pteam = "Polvo de Diamantes",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
  name = "Diamond Dust",
  list = {}
  -- list = { Ben_North, Alan_Downhill, Claire_Lesnow, Albert_Denver, Lucy_Hailstone, Brad_Coldwater, Dawson_Foxx, Ving_Rice, Bernie_White, Bryce_Whitingale, Denzel_Freezer }
}
