-- Thomas_Feldt (Feldt)
local Thomas_Feldt = J({
  name = "Thomas_Feldt",
  pos = { x = 11, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.GK,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Malcolm_Night (Night)
local Malcolm_Night = J({
  name = "Malcolm_Night",
  pos = { x = 12, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Shadow_Cimmerian (Shadow)
local Shadow_Cimmerian = J({
  name = "Shadow_Cimmerian",
  pos = { x = 0, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Jim_Wraith (Jim)
local Jim_Wraith = J({
  name = "Jim_Wraith",
  pos = { x = 1, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Tod_Ironside (Tod)
local Tod_Ironside = J({
  name = "Tod_Ironside",
  pos = { x = 2, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Steve_Grim (Steve)
local Steve_Grim = J({
  name = "Steve_Grim",
  pos = { x = 3, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Tim_Saunders (Timmy)
local Tim_Saunders = J({
  name = "Tim_Saunders",
  pos = { x = 4, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Sam_Kincaid (Sam)
local Sam_Kincaid = J({
  name = "Sam_Kincaid",
  pos = { x = 5, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Maxwell_Carson (Max)
local Maxwell_Carson = J({
  name = "Maxwell_Carson",
  pos = { x = 6, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Nathan_Swift (Nathan)
local Nathan_Swift = J({
  name = "Nathan_Swift",
  pos = { x = 8, y = 0 },
  soul_pos = { x = 8, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = "ina_top", -- Destacado
  pools = { ["darkemperors"] = true },
  cost = 15,
  atlas = "top",
  ptype = C.Wind,
  pposition = C.FW,
  techtype = C.UPGRADES.Plus,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Kevin_Dragonfly (Kevin)
local Kevin_Dragonfly = J({
  name = "Kevin_Dragonfly",
  pos = { x = 7, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["darkemperors"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Emperadores Oscuros",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
  name = "Emperadores Oscuros",
  list = {}
  -- list = { Thomas_Feldt, Malcolm_Night, Shadow_Cimmerian, Jim_Wraith, Tod_Ironside, Steve_Grim, Tim_Saunders, Sam_Kincaid, Maxwell_Carson, Nathan_Swift, Kevin_Dragonfly }
}
