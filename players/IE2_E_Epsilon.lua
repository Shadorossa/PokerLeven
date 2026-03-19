-- Dvalin
local Dvalin = {
  name = "Dvalin",
  pos = { x = 4, y = 0 },
  soul_pos = { x = 4, y = 1 },
  config = { extra = { pposition = "GK", chip_mod = 150, barriers_added = 1, xmult_mod = 0.5, barriers_consumed = 1 } },
  loc_vars = function(self, info_queue, center)
      local is_gk = center.ability.extra.pposition == "GK"
      local barriers = G.GAME.current_round and G.GAME.current_round.barriers or 0
      local current_xmult = 1 + (barriers * center.ability.extra.xmult_mod)
      return { vars = { 
          center.ability.extra.chip_mod, 
          center.ability.extra.barriers_added, 
          center.ability.extra.xmult_mod, 
          center.ability.extra.barriers_consumed,
          current_xmult,
          is_gk and "GK" or "FW"
      } }
  end,
  rarity = "ina_top", -- Destacado
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "top",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_hand then
        if card.ability.extra.pposition == "GK" then
            Pokerleven.ease_barriers(card.ability.extra.barriers_added)
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chip_mod}},
                chip_mod = card.ability.extra.chip_mod,
                colour = G.C.CHIPS
            }
        elseif card.ability.extra.pposition == "FW" then
            local barriers = G.GAME.current_round.barriers or 0
            local cost = card.ability.extra.barriers_consumed
            if barriers >= cost then
                Pokerleven.ease_barriers(-cost)
                local xmult = 1 + (barriers * card.ability.extra.xmult_mod)
                return {
                    message = localize{type='variable',key='a_xmult',vars={xmult}},
                    Xmult_mod = xmult,
                    colour = G.C.MULT
                }
            end
        end
    end
  end,
  update = function(self, card, dt)
      if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
          local target_pos = Pokerleven.is_in_left_half(card) and "GK" or "FW"
          if card.ability.extra.pposition ~= target_pos then
             apply_property_sticker(card, target_pos, "position")
          end
      end
  end
}

-- Kenville
local Kenville = {
  name = "Kenville",
  pos = { x = 1, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Mole
local Mole = {
  name = "Mole",
  pos = { x = 2, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Kayson
local Kayson = {
  name = "Kayson",
  pos = { x = 3, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Tytan
local Tytan = {
  name = "Tytan",
  pos = { x = 4, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Fedora
local Fedora = {
  name = "Fedora",
  pos = { x = 5, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Krypto
local Krypto = {
  name = "Krypto",
  pos = { x = 6, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Sworm
local Sworm = {
  name = "Sworm",
  pos = { x = 7, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Mercury
local Mercury = {
  name = "Mercury",
  pos = { x = 8, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Metron
local Metron = {
  name = "Metron",
  pos = { x = 9, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Zell
local Zell = {
  name = "Zell",
  pos = { x = 10, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

return {
  name = "Epsilon",
  list = {}
  -- list = { Dvalin, Kenville, Mole, Kayson, Tytan, Fedora, Krypto, Sworm, Mercury, Metron, Zell },
}
