-- Arion Sherwind
local Arion = J({
  name = "Arion",
  pos = { x = 0, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Raimon GO"] = true },
  cost = 7,
  atlas = "Jokers04",
  ptype = "Wind",
  pposition = "MF",
  pteam = "ina_team_RaimonGO",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Riccardo Di Rigo
local Riccardo = J({
  name = "Riccardo",
  pos = { x = 1, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Raimon GO"] = true },
  cost = 7,
  atlas = "Jokers04",
  ptype = "Forest",
  pposition = "MF",
  pteam = "ina_team_RaimonGO",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Victor Blade
local Victor = J({
  name = "Victor",
  pos = { x = 2, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Raimon GO"] = true },
  cost = 7,
  atlas = "Jokers04",
  ptype = "Fire",
  pposition = "FW",
  pteam = "ina_team_RaimonGO",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jean-Pierre Lapin
local JP = J({
  name = "JP",
  pos = { x = 3, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Raimon GO"] = true },
  cost = 5,
  atlas = "Jokers04",
  ptype = "Mountain",
  pposition = "GK",
  pteam = "ina_team_RaimonGO",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Raimon GO",
  list = { }
}