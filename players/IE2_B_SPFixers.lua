-- ironwall
local ironwall = {
  name = "ironwall",
  pos = { x = 12, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Western
local western = {
  name = "Western",
  pos = { x = 0, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Hammond
local hammond = {
  name = "Hammond",
  pos = { x = 1, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Stevens
local stevens = {
  name = "Stevens",
  pos = { x = 2, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Smith
local smith = {
  name = "Smith",
  pos = { x = 3, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Firepool
local firepool = {
  name = "Firepool",
  pos = { x = 4, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Fielding
local fielding = {
  name = "Fielding",
  pos = { x = 5, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Firsthand
local firsthand = {
  name = "Firsthand",
  pos = { x = 6, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Mirror
local mirror = {
  name = "Mirror",
  pos = { x = 7, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Tori
local tori = {
  name = "Tori",
  pos = { x = 8, y = 1 },
  config = { extra = { xmult_mod = 0.1 } },
  loc_vars = function(self, info_queue, center)
    local stone_count = 0
    if G.playing_cards then
        for k, v in ipairs(G.playing_cards) do
            if SMODS.has_enhancement(v, 'm_stone') then stone_count = stone_count + 1 end
        end
    end
    return { vars = { center.ability.extra.xmult_mod, 1 + (stone_count * center.ability.extra.xmult_mod) } }
  end,
  rarity = 3, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Servicio Secreto",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_hand then
        local stone_count = 0
        if G.playing_cards then
            for k, v in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(v, 'm_stone') then stone_count = stone_count + 1 end
            end
        end
        local mult = 1 + (stone_count * card.ability.extra.xmult_mod)
        if mult > 1 then
            return {
                message = localize{type='variable',key='a_xmult',vars={mult}},
                Xmult_mod = mult
            }
        end
    end
  end
}

-- Kennedy
local kennedy = {
  name = "Kennedy",
  pos = { x = 10, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Sights
local sights = {
  name = "Sights",
  pos = { x = 11, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- beray
local beray = {
  name = "Beray",
  pos = { x = 12, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- toppin
local toppin = {
  name = "Toppin",
  pos = { x = 0, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Servicio Secreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

return {
  name = "SPFixers",
  list = { tori }
  -- list = { ironwall, western, stevens, smith, firepool, fielding, firsthand, mirror, kennedy, sights },
}
