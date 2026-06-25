-- Grant_Cook (Grent)
local Grant_Cook = J({
  name = "Grant_Cook",
  pos = { x = 5, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Bonnie_Sparks (Baller)
local Bonnie_Sparks = J({
  name = "Bonnie_Sparks",
  pos = { x = 6, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Val_Flamewood (Balcke)
local Val_Flamewood = J({
  name = "Val_Flamewood",
  pos = { x = 7, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Sean_Ashford (Seats)
local Sean_Ashford = J({
  name = "Sean_Ashford",
  pos = { x = 8, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Ben_Blowton (Bomber)
local Ben_Blowton = J({
  name = "Ben_Blowton",
  pos = { x = 9, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Ethan_Whitering (Heat)
local Ethan_Whitering = J({
  name = "Ethan_Whitering",
  pos = { x = 10, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Brenda_Firequest (Lean)
local Brenda_Firequest = J({
  name = "Brenda_Firequest",
  pos = { x = 11, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Sam_Bournes (Bountine)
local Sam_Bournes = J({
  name = "Sam_Bournes",
  pos = { x = 12, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Jim_Flareson (Sidern)
local Jim_Flareson = J({
  name = "Jim_Flareson",
  pos = { x = 0, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Claude_Beacons (Torch)
local Claude_Beacons = J({
  name = "Claude_Beacons",
  pos = { x = 6, y = 0 },
  soul_pos = { x = 6, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = "ina_top", -- Destacado
  pools = { ["Prominence"] = true },
  cost = 15,
  atlas = "top",
  ptype = C.Fire,
  pposition = C.FW,
  techtype = C.UPGRADES.NumberType.A,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Nigel_August (Neppten)
local Nigel_August = J({
  name = "Nigel_August",
  pos = { x = 1, y = 14 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Prominence"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Prominence",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
  name = "Prominence",
  list = {}
  -- list = { Grant_Cook, Bonnie_Sparks, Val_Flamewood, Sean_Ashford, Ben_Blowton, Ethan_Whitering, Brenda_Firequest, Sam_Bournes, Jim_Flareson, Claude_Beacons, Nigel_August }
}
