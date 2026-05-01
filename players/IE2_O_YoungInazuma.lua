local Atlas = "Jokers02"
local team_id = "ina_team_YoungInazuma"

-- 1. Hillman (Capitán)
local Hillman = J({
  name = "Hillman",
  pos = { x = 0, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 3,
  pools = { ["Young Inazuma"] = true },
  cost = 8,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 2. Island
local Island = J({
  name = "Island",
  pos = { x = 1, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 3. Hairtown
local Hairtown = J({
  name = "Hairtown",
  pos = { x = 2, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 4. Sweet
local Sweet = J({
  name = "Sweet",
  pos = { x = 3, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 5. Butler
local Butler = J({
  name = "Butler",
  pos = { x = 4, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 6. Nathaniel
local Nathaniel = J({
  name = "Nathaniel",
  pos = { x = 5, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 7. Gladstone
local Gladstone = J({
  name = "Gladstone",
  pos = { x = 6, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 8. Tailor
local Tailor = J({
  name = "Tailor",
  pos = { x = 7, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 9. Barista
local Barista = J({
  name = "Barista",
  pos = { x = 8, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Young Inazuma"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 10. Suffolk
local Suffolk = J({
  name = "Suffolk",
  pos = { x = 9, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Young Inazuma"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

-- 11. Builder
local Builder = J({
  name = "Builder",
  pos = { x = 10, y = 19 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center) return { vars = {} } end,
  rarity = 2,
  pools = { ["Young Inazuma"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_YoungInazuma",
  calculate = function(self, card, context) end
})

return {
  name = "Young Inazuma",
  list = { Hillman, Island, Hairtown, Sweet, Butler, Nathaniel, Gladstone, Tailor, Barista, Suffolk, Builder }
}
