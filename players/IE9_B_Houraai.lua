-- Haruma Kunisaki
local Haruma = J({
  name = "Haruma",
  pos = { x = 2, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Houraai"] = true },
  cost = 7,
  atlas = "Jokers10",
  ptype = "Mountain",
  pposition = "FW",
  pteam = "ina_team_Houraai",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tsukasa Fushimi
local Tsukasa = J({
  name = "Tsukasa",
  pos = { x = 3, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Houraai"] = true },
  cost = 5,
  atlas = "Jokers10",
  ptype = "Wind",
  pposition = "DF",
  pteam = "ina_team_Houraai",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Houraai",
  list = {  }
}