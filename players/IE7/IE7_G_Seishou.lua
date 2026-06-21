-- Ryohei Haizaki
local Haizaki = J({
  name = "Haizaki",
  pos = { x = 5, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Seishou Gakuen"] = true },
  cost = 7,
  atlas = "Jokers07",
  ptype = "Fire",
  pposition = "FW",
  pteam = "ina_team_Seishou",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Seiya Mizukamiya
local Mizukamiya = J({
  name = "Mizukamiya",
  pos = { x = 6, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Seishou Gakuen"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = "Forest",
  pposition = "DF",
  pteam = "ina_team_Seishou",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Seishou Gakuen",
  list = {  }
}