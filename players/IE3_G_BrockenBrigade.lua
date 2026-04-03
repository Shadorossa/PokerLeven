local Thorsten = J({
  name = "Thorsten Welger",
  pos = { x = 0, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Alexander = J({
  name = "Alexander Hausen",
  pos = { x = 1, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Heinrich = J({
  name = "Heinrich Farber",
  pos = { x = 2, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Kurt = J({
  name = "Kurt Zawel",
  pos = { x = 3, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Lukas = J({
  name = "Lukas Schmidt",
  pos = { x = 4, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Theodor = J({
  name = "Theodor Ulrich",
  pos = { x = 5, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Brocken Brigade"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Jan = J({
  name = "Jan Oster",
  pos = { x = 6, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Niklas = J({
  name = "Niklas Kuster",
  pos = { x = 7, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Jonas = J({
  name = "Jonas Polk",
  pos = { x = 8, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Maximilian = J({
  name = "Maximilian Müller",
  pos = { x = 9, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Peter = J({
  name = "Peter Naumann",
  pos = { x = 10, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Brocken Brigade",
  list = {}
}