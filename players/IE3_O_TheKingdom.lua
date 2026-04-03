local Falcao = J({
  name = "Falcao Da Silva",
  pos = { x = 0, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Lagarto = J({
  name = "Lagarto Carlos",
  pos = { x = 1, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Bagre = J({
  name = "Bagre Antonio",
  pos = { x = 2, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Borboleta = J({
  name = "Borboleta",
  pos = { x = 3, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Formiga = J({
  name = "Formiga Clemens",
  pos = { x = 4, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Presa = J({
  name = "Presa",
  pos = { x = 5, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Leonardo = J({
  name = "Leonardo Almeida",
  pos = { x = 6, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Mac = J({
  name = "Mac Robingo",
  pos = { x = 7, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["The Kingdom"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gato = J({
  name = "Gato",
  pos = { x = 8, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Coruja = J({
  name = "Coruja",
  pos = { x = 9, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Cavalo = J({
  name = "Cavalo Oliveira",
  pos = { x = 10, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "The Kingdom",
  list = {}
}