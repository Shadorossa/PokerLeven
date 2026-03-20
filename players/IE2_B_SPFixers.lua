-- ironwall
local ironwall = J({
  name = "ironwall",
  pos = { x = 12, y = 0 },
  config = { extra = { chip_mod = 30 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1, -- Common
  pools = { ["SPFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "Servicio Secreto",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      if G.GAME.current_round.barriers and G.GAME.current_round.barriers > 0 then
        return {
          message = localize{type='variable',key='a_chips',vars={card.ability.extra.chip_mod}},
          chip_mod = card.ability.extra.chip_mod,
          colour = G.C.CHIPS
        }
      end
    end
  end
})

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
local fielding = J({
  name = "fielding",
  pos = { x = 5, y = 1 },
  config = { extra = { scry_mod = 1, money = 2 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.scry_mod, center.ability.extra.money } }
  end,
  rarity = 1, -- Common
  pools = { ["SPFixers"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Servicio Secreto",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_hand then
      local has_ace = false
      for _, c in ipairs(context.scoring_hand) do
        if c:get_id() == 14 then
          has_ace = true
          break
        end
      end
      if has_ace then
        ease_dollars(card.ability.extra.money)
        return {
          message = localize('$') .. card.ability.extra.money,
          colour = G.C.MONEY
        }
      end
    end
  end,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) + card.ability.extra.scry_mod
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) - card.ability.extra.scry_mod
  end
})

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
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 3, -- Rare
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
  list = { ironwall, fielding }
}
