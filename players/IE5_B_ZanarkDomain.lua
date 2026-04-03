-- Zanark Avalonic
local Zanark = J({
  name = "Zanark",
  pos = { x = 3, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Zanark Domain"] = true },
  cost = 8,
  atlas = "Jokers05",
  ptype = "Fire",
  pposition = "FW",
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Shuten
local Shuten = J({
  name = "Shuten",
  pos = { x = 4, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Zanark Domain"] = true },
  cost = 5,
  atlas = "Jokers05",
  ptype = "Mountain",
  pposition = "GK",
  pteam = "ina_team_ZanarkDomain",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Zanark Domain",
  list = {  }
}