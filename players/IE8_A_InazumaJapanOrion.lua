-- Nosaka Yuuma
local Nosaka = J({
  name = "Nosaka",
  pos = { x = 0, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Inazuma Japan Orion"] = true },
  cost = 8,
  atlas = "Jokers08",
  ptype = "Forest",
  pposition = "FW",
  pteam = "ina_team_InazumaJapanOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ichihoshi Hikaru
local Ichihoshi = J({
  name = "Ichihoshi",
  pos = { x = 1, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Inazuma Japan Orion"] = true },
  cost = 7,
  atlas = "Jokers08",
  ptype = "Wind",
  pposition = "MF",
  pteam = "ina_team_InazumaJapanOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Nishikage Seiya
local Nishikage = J({
  name = "Nishikage",
  pos = { x = 2, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Inazuma Japan Orion"] = true },
  cost = 5,
  atlas = "Jokers08",
  ptype = "Mountain",
  pposition = "GK",
  pteam = "ina_team_InazumaJapanOrion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Inazuma Japan Orion",
  list = {  }
}