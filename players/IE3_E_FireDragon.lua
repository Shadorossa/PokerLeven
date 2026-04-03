local JungSoo = J({
  name = "Jung-Soo",
  pos = { x = 0, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Mountain",
  pposition = "GK",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local DoJun = J({
  name = "Do-Jun",
  pos = { x = 1, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Fire",
  pposition = "DF",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local SungHwan = J({
  name = "Sung-Hwan",
  pos = { x = 2, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Mountain",
  pposition = "DF",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local MyungHo = J({
  name = "Myung-Ho",
  pos = { x = 3, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Forest",
  pposition = "DF",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local BaekYong = J({
  name = "Baek-Yong",
  pos = { x = 4, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Wind",
  pposition = "DF",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hyun = J({
  name = "Hyun",
  pos = { x = 5, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Forest",
  pposition = "MF",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Choi = J({
  name = "Changsu Choi",
  pos = { x = 6, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Fire Dragon"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = "Forest",
  pposition = "MF",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Byron = J({
  name = "Byron Love",
  pos = { x = 7, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Fire Dragon"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = "Wind",
  pposition = "MF",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Claude = J({
  name = "Claude Beacons",
  pos = { x = 8, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Fire",
  pposition = "FW",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Bryce = J({
  name = "Bryce Whitingale",
  pos = { x = 9, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Wind",
  pposition = "FW",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local EunYong = J({
  name = "Eun-Yong",
  pos = { x = 10, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = "Fire",
  pposition = "MF",
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Fire Dragon",
  list = {}
}