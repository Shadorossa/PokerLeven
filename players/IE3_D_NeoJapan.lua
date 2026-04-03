local King = J({
  name = "Joseph King (Neo)",
  pos = { x = 0, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hillvalley = J({
  name = "Tyler Hillvalley (Neo)",
  pos = { x = 1, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Bargie = J({
  name = "Cyrus Bargie (Neo)",
  pos = { x = 2, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Simmons = J({
  name = "Ben Simmons (Neo)",
  pos = { x = 3, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Grent = J({
  name = "Grent (Neo)",
  pos = { x = 4, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Master = J({
  name = "Alan Master (Neo)",
  pos = { x = 5, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Quagmire = J({
  name = "Dave Quagmire (Neo)",
  pos = { x = 6, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Neo Japan"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hatch = J({
  name = "Daniel Hatch (Neo)",
  pos = { x = 7, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Samford = J({
  name = "David Samford (Neo)",
  pos = { x = 8, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Wittz = J({
  name = "Johan Tartz (Neo)",
  pos = { x = 9, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Zell = J({
  name = "Zell (Neo)",
  pos = { x = 10, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Neo Japan"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_NeoJapan",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Neo Japan",
  list = {}
}