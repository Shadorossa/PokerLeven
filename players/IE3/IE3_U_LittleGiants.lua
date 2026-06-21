-- Hector Helio (1)
local Hector_Helio = J({
  name = "Hector_Helio",
  pos = { x = 0, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_2,
  pnumber = 1,
  pteam = "ina_team_LittleGiants",
  pcaptain = C.CAPTAIN,
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zephyr Vitesse (2)
local Zephyr_Vitesse = J({
  name = "Zephyr_Vitesse",
  pos = { x = 1, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_2,
  pnumber = 2,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Walter Mountain (3)
local Walter_Mountain = J({
  name = "Walter_Mountain",
  pos = { x = 2, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_1,
  pnumber = 3,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jimi Gaines (4)
local Jimi_Gaines = J({
  name = "Jimi_Gaines",
  pos = { x = 3, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ian Ferrum (5)
local Ian_Ferrum = J({
  name = "Ian_Ferrum",
  pos = { x = 4, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_1,
  pnumber = 5,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Quint Hampton (6)
local Quint_Hampton = J({
  name = "Quint_Hampton",
  pos = { x = 5, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Yasir Haddad (7)
local Yasir_Haddad = J({
  name = "Yasir_Haddad",
  pos = { x = 6, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_1,
  pnumber = 7,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Keith Ryan (8)
local Keith_Ryan = J({
  name = "Keith_Ryan",
  pos = { x = 7, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_2,
  pnumber = 8,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Maximino Cruz (9)
local Maximino_Cruz = J({
  name = "Maximino_Cruz",
  pos = { x = 1, y = 19 },
  config = { extra = { xmult_base = 1, xmult_per_wind = 0.5 } },
  loc_vars = function(self, info, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    local wind_count = Pokerleven.get_type_count(C.Wind)
    local current_xmult = math.floor((ex.xmult_base + (wind_count * ex.xmult_per_wind)) * 100) / 100
    return { vars = { current_xmult, ex.xmult_per_wind } }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_2,
  pnumber = 9,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if Pokerleven.is_joker_turn(ctx) then
      local wind_count = Pokerleven.get_type_count(C.Wind)
      local xmult = card.ability.extra.xmult_base + (wind_count * card.ability.extra.xmult_per_wind)
      return Pokerleven.create_xmult_return(xmult)
    end
  end
})

-- Gareth Flare (10)
local Gareth_Flare = J({
  name = "Gareth_Flare",
  pos = { x = 9, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_2,
  pnumber = 10,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Drago Hill (11)
local Drago_Hill = J({
  name = "Drago_Hill",
  pos = { x = 10, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_2,
  pnumber = 11,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Keenan DiFortune (12)
local Keenan_DiFortune = J({
  name = "Keenan_DiFortune",
  pos = { x = 11, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_1,
  pnumber = 12,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jarell Mangrove (13)
local Jarell_Mangrove = J({
  name = "Jarell_Mangrove",
  pos = { x = 0, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_1,
  pnumber = 13,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Vic Vitrum (14)
local Vic_Vitrum = J({
  name = "Vic_Vitrum",
  pos = { x = 1, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_1,
  pnumber = 14,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Li Leung (15)
local Li_Leung = J({
  name = "Li_Leung",
  pos = { x = 2, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_1,
  pnumber = 15,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jazzy Hedgeer (16)
local Jazzy_Hedgeer = J({
  name = "Jazzy_Hedgeer",
  pos = { x = 3, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Little Giants"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.CONGO,
  pyear = C.YEAR_1,
  pnumber = 16,
  pteam = "ina_team_LittleGiants",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Little Giants",
  list = {
    Maximino_Cruz
  }
}
