-- Jang Cho (1)
local Jang_FireDragon = J({
  name = "Jang Cho",
  pos = { x = 0, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 1,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Umi Wang (2)
local Wang_FireDragon = J({
  name = "Umi Wang",
  pos = { x = 1, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 2,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Doyo Hong (3)
local Hong_FireDragon = J({
  name = "Doyo Hong",
  pos = { x = 2, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 3,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Minho Cho (4)
local Minho_FireDragon = J({
  name = "Minho Cho",
  pos = { x = 3, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Songwan Ko (5)
local Ko_FireDragon = J({
  name = "Songwan Ko",
  pos = { x = 4, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Changsu Choi (6)
local Choi_FireDragon = J({
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
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pnumber = 6,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Pekyong Park (7)
local Park_FireDragon = J({
  name = "Pekyong Park",
  pos = { x = 11, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_3,
  pnumber = 7,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Enyong Kim (8)
local Kim_FireDragon = J({
  name = "Enyong Kim",
  pos = { x = 10, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_1,
  pnumber = 8,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Byron Love (9)
local Aphrodite_FireDragon = J({
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
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN, -- Byron es Japonés pero juega con Corea
  pyear = C.YEAR_2,
  pnumber = 9,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Claude Beacons (10)
local Torch_FireDragon = J({
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
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN, -- Torch es Japonés
  pyear = C.YEAR_2,
  pnumber = 10,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bryce Whitingale (11)
local Gazelle_FireDragon = J({
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
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN, -- Gazelle es Japonés
  pyear = C.YEAR_2,
  pnumber = 11,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Chi-Won Ho (12)
local Ho_FireDragon = J({
  name = "Chi-Won Ho",
  pos = { x = 12, y = 4 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Dong-Hyun Seul (13)
local Seul_FireDragon = J({
  name = "Dong-Hyun Seul",
  pos = { x = 0, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jung-Hoon Yi (14)
local Yi_FireDragon = J({
  name = "Jung-Hoon Yi",
  pos = { x = 1, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 14,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sung-Jin Noh (15)
local Noh_FireDragon = J({
  name = "Sung-Jin Noh",
  pos = { x = 2, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_3,
  pnumber = 15,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Joon-Ho Ja (16)
local Ja_FireDragon = J({
  name = "Joon-Ho Ja",
  pos = { x = 3, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Fire Dragon"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.KOREA_SOUTH,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_FireDragon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Fire Dragon",
  list = {
    Jang_FireDragon, Wang_FireDragon, Hong_FireDragon, Minho_FireDragon, Ko_FireDragon,
    Choi_FireDragon, Park_FireDragon, Kim_FireDragon, Aphrodite_FireDragon, Torch_FireDragon,
    Gazelle_FireDragon, Ho_FireDragon, Seul_FireDragon, Yi_FireDragon, Noh_FireDragon, Ja_FireDragon
  }
}