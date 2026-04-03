-- Otomura Gakuya
local Otomura = J({
  name = "Otomura",
  pos = { x = 2, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Oumihara"] = true },
  cost = 7,
  atlas = "Jokers07",
  ptype = "Wind",
  pposition = "MF",
  pteam = "ina_team_Oumihara",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hiyami Nanami
local Nanami = J({
  name = "Nanami",
  pos = { x = 3, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Oumihara"] = true },
  cost = 5,
  atlas = "Jokers07",
  ptype = "Wind",
  pposition = "DF",
  pteam = "ina_team_Oumihara",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Oumihara",
  list = {  }
}