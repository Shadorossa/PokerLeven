local Atlas = "Jokers02"
local team_id = "ina_team_SeaOfTrees"

-- 1. Mando
local Mando = J({
  name = "Mando",
  pos = { x = 2, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = Atlas,
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 1,
  pcaptain = C.CAPTAIN,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 2. Boufante
local Boufante = J({
  name = "Boufante",
  pos = { x = 3, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = Atlas,
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 3. Stuhl
local Stuhl = J({
  name = "Stuhl",
  pos = { x = 4, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = Atlas,
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 3,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 4. Blewit
local Blewit = J({
  name = "Blewit",
  pos = { x = 5, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = Atlas,
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 4,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 5. Oregon
local Oregon = J({
  name = "Oregon",
  pos = { x = 6, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = Atlas,
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 5,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 6. Cypress
local Cypress = J({
  name = "Cypress",
  pos = { x = 7, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 5,
  atlas = Atlas,
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 6,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 7. Deathcap
local Deathcap = J({
  name = "Deathcap",
  pos = { x = 8, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 5,
  atlas = Atlas,
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 7,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 8. Faithfull
local Faithfull = J({
  name = "Faithfull",
  pos = { x = 9, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 5,
  atlas = Atlas,
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 8,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 9. Ticker
local Ticker = J({
  name = "Ticker",
  pos = { x = 10, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 6,
  atlas = Atlas,
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 9,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 10. Daring
local Daring = J({
  name = "Daring",
  pos = { x = 11, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 6,
  atlas = Atlas,
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 10,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 11. Enoki
local Enoki = J({
  name = "Enoki",
  pos = { x = 12, y = 16 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 6,
  atlas = Atlas,
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 11,
  pteam = team_id,
  calculate = function(self, card, context) end
})

return {
  name = "Sea of Trees",
  list = { } -- Vacío por ahora hasta tener lógica
}
