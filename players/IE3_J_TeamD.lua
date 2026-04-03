-- Paolo Bianchi
local Bravin = J({
  name = "Bravin",
  pos = { x = 0, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Alphe = J({
  name = "Alphe",
  pos = { x = 1, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Beru = J({
  name = "Beru",
  pos = { x = 2, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gamma = J({
  name = "Gamma",
  pos = { x = 3, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Delta = J({
  name = "Delta",
  pos = { x = 4, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Epsilon = J({
  name = "Epsilon",
  pos = { x = 5, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Giulio = J({
  name = "Giulio Acuto",
  pos = { x = 6, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Team D"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Eta = J({
  name = "Eta",
  pos = { x = 7, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Teta = J({
  name = "Teta",
  pos = { x = 8, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Iota = J({
  name = "Iota",
  pos = { x = 9, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Kappa = J({
  name = "Kappa",
  pos = { x = 10, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Team D"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_TeamD",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Team D",
  list = {}
}