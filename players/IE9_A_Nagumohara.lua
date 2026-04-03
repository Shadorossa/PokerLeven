-- Unmei Sasanami
local Unmei = J({
  name = "Unmei",
  pos = { x = 0, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Nagumohara"] = true },
  cost = 7,
  atlas = "Jokers10",
  ptype = "Wind",
  pposition = "MF",
  pteam = "ina_team_Nagumohara",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jō Sakuraba
local Sakuraba = J({
  name = "Sakuraba",
  pos = { x = 1, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Nagumohara"] = true },
  cost = 7,
  atlas = "Jokers10",
  ptype = "Fire",
  pposition = "FW",
  pteam = "ina_team_Nagumohara",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Nagumohara",
  list = { }
}