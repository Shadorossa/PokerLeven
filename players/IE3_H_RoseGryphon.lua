-- Roger Pialat (1)
local Roger_Pialat = J({
  name = "Roger Pialat",
  pos = { x = 8, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 1,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Pierre Godin (2)
local Pierre_Godin = J({
  name = "Pierre Godin",
  pos = { x = 9, y = 8 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pnumber = 2,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Michaël Aron (3)
local Michael_Aron = J({
  name = "Michaël Aron",
  pos = { x = 10, y = 8 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 3,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Francis Poujol (4)
local Francis_Poujol = J({
  name = "Francis Poujol",
  pos = { x = 11, y = 8 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kevin Pinot (5)
local Kevin_Pinot = J({
  name = "Kevin Pinot",
  pos = { x = 12, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Roland Perec (6)
local Roland_Perec = J({
  name = "Roland Perec",
  pos = { x = 0, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_3,
  pnumber = 6,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Romuald Huysmans (7)
local Romuald_Huysmans = J({
  name = "Romuald Huysmans",
  pos = { x = 1, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Stéphane Hinault (8)
local Stephane_Hinault = J({
  name = "Stéphane Hinault",
  pos = { x = 2, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_3,
  pnumber = 8,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Julien Rousseau (9)
local Julien_Rousseau = J({
  name = "Julien Rousseau",
  pos = { x = 3, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_3,
  pnumber = 9,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jerome Hervaud (10)
local Jerome_Hervaud = J({
  name = "Jerome Hervaud",
  pos = { x = 4, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 10,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Alain Favreau (11)
local Alain_Favreau = J({
  name = "Alain Favreau",
  pos = { x = 5, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 11,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Émile Lazare (12)
local Emile_Lazare = J({
  name = "Émile Lazare",
  pos = { x = 6, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- André Pinson (13)
local Andre_Pinson = J({
  name = "André Pinson",
  pos = { x = 7, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Rose Gryphon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jean Gutain (14)
local Jean_Gutain = J({
  name = "Jean Gutain",
  pos = { x = 8, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 14,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Claude Moreau (15)
local Claude_Moreau = J({
  name = "Claude Moreau",
  pos = { x = 9, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_1,
  pnumber = 15,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Michel Morland (16)
local Michel_Morland = J({
  name = "Michel Morland",
  pos = { x = 10, y = 9 },
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
  pgender = C.M,
  pnation = C.FRANCE,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_RoseGryphon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Rose Gryphon",
  list = {}
}