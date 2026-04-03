-- Isozaki Kenma
local Isozaki = J({
  name = "Isozaki",
  pos = { x = 4, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Mannouzaka"] = true },
  cost = 7,
  atlas = "Jokers04",
  ptype = "Forest",
  pposition = "FW",
  pteam = "ina_team_Mannouzaka",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mitsuyoshi Yozakura
local Mitsuyoshi = J({
  name = "Mitsuyoshi",
  pos = { x = 5, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Mannouzaka"] = true },
  cost = 5,
  atlas = "Jokers04",
  ptype = "Fire",
  pposition = "FW",
  pteam = "ina_team_Mannouzaka",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Mannouzaka",
  list = {  }
}