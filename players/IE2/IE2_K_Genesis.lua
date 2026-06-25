-- Nelson_Rockwell (Nero)
local Nelson_Rockwell = J({
  name = "Nelson_Rockwell",
  pos = { x = 0, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.GK,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Gail_Baker (Gele)
local Gail_Baker = J({
  name = "Gail_Baker",
  pos = { x = 1, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Kim_Powell (Kiburn)
local Kim_Powell = J({
  name = "Kim_Powell",
  pos = { x = 2, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Zack_Cummings (Zohen)
local Zack_Cummings = J({
  name = "Zack_Cummings",
  pos = { x = 3, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Hunt_Mercer (Hauser)
local Hunt_Mercer = J({
  name = "Hunt_Mercer",
  pos = { x = 4, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Connor_Murray (Kormer)
local Connor_Murray = J({
  name = "Connor_Murray",
  pos = { x = 5, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Katie_Brown (Kiwill)
local Katie_Brown = J({
  name = "Katie_Brown",
  pos = { x = 6, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Ashton_Malone (Ark)
local Ashton_Malone = J({
  name = "Ashton_Malone",
  pos = { x = 7, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Wilbur_Watkins (Wittz)
local Wilbur_Watkins = J({
  name = "Wilbur_Watkins",
  pos = { x = 8, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Isabelle_Trick (Bellatrix)
local Isabelle_Trick = J({
  name = "Isabelle_Trick",
  pos = { x = 9, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Xavier_Foster (Xene)
local Xavier_Foster = J({
  name = "Xavier_Foster",
  pos = { x = 10, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "Genesis",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
  name = "Genesis",
  list = {}
  -- list = { Nelson_Rockwell, Gail_Baker, Kim_Powell, Zack_Cummings, Hunt_Mercer, Connor_Murray, Katie_Brown, Ashton_Malone, Wilbur_Watkins, Isabelle_Trick, Xavier_Foster }
}
