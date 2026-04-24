-- Nero
local Nero = J({
  name = "Nero",
  pos = { x = 12, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gele
local Gele = J({
  name = "Gele",
  pos = { x = 0, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kiburn
local Kiburn = J({
  name = "Kiburn",
  pos = { x = 1, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zohen
local Zohen = J({
  name = "Zohen",
  pos = { x = 2, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hauser
local Hauser = J({
  name = "Hauser",
  pos = { x = 3, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kormer
local Kormer = J({
  name = "Kormer",
  pos = { x = 4, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kiwill
local Kiwill = J({
  name = "Kiwill",
  pos = { x = 5, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ark
local Ark = J({
  name = "Ark",
  pos = { x = 6, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Wittz
local Wittz = J({
  name = "Wittz",
  pos = { x = 7, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bellatrix
local Bellatrix = J({
  name = "Bellatrix",
  pos = { x = 8, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Xene
local Xene = J({
  name = "Xene",
  pos = { x = 9, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Genesis",
  list = {}
}
