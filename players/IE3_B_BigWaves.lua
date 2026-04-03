local Jean = J({
  name = "Jean Baker",
  pos = { x = 0, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Holly = J({
  name = "Holly Dash",
  pos = { x = 1, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Robert = J({
  name = "Robert Reef",
  pos = { x = 2, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Wilson = J({
  name = "Wilson Shore",
  pos = { x = 3, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Joe = J({
  name = "Joe Jaws",
  pos = { x = 4, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Daniel = J({
  name = "Daniel Gordon",
  pos = { x = 5, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Nice = J({
  name = "Nice Dolphin",
  pos = { x = 6, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Big Waves"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Julian = J({
  name = "Julian Reef",
  pos = { x = 7, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local David = J({
  name = "David Shark",
  pos = { x = 8, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Sebastian = J({
  name = "Sebastian Shark",
  pos = { x = 9, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gene = J({
  name = "Gene Baker",
  pos = { x = 10, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Big Waves",
  list = {}
}