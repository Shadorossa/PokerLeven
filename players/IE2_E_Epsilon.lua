-- Dvalin
local Dvalin = J({
  name = "Dvalin",
  pos = { x = 3, y = 0 },
  soul_pos = { x = 3, y = 1 },
  config = { extra = { pposition = "GK", pos_left = "GK", pos_right = "FW", chip_mod = 150, barriers_added = 1 } },
  loc_vars = function(self, info_queue, center)
      local ex = center.ability.extra
      info_queue[#info_queue+1] = { set = "Other", key = "RolChange", vars = {ex.pos_left, ex.pos_right} }
      return { vars = { ex.chip_mod, ex.barriers_added } }
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
  calculate = function(self, card, ctx)
      local ex = card.ability.extra
      if Pokerleven.is_joker_turn(ctx) then
          Pokerleven.ease_barriers(ex.barriers_added); return {message = localize{type='variable',key='a_chips',vars={ex.chip_mod}}, chip_mod = ex.chip_mod, colour = G.C.CHIPS}
      end
  end,
  update = function(self, card, dt)
      if G.STAGE == G.STAGES.RUN and card.area == G.jokers and not Pokerleven.is_in_left_half(card) then ina_backend_evolve(card, 'j_ina_Dvalin_Plus') end
  end
})

local Dvalin_Plus = J({
  name = "Dvalin_Plus",
  pos = { x = 4, y = 0 },
  soul_pos = { x = 4, y = 1 },
  config = { extra = { pposition = "FW", pos_left = "GK", pos_right = "FW", xmult_mod = 0.5, barriers_consumed = 1 } },
  loc_vars = function(self, info_queue, center)
      local ex = center.ability.extra
      info_queue[#info_queue+1] = { set = "Other", key = "RolChange", vars = {ex.pos_left, ex.pos_right} }
      return { vars = { 1 + ((G.GAME and G.GAME.current_round and G.GAME.current_round.barriers or 0) * ex.xmult_mod), ex.barriers_consumed, ex.xmult_mod } }
  end,
  rarity = "ina_top",
  pools = { ["Epsilon"] = false }, -- Not in the normal pool, only obtainable through Dvalin
  cost = 7,
  atlas = "top",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
      local ex = card.ability.extra
      if Pokerleven.is_joker_turn(ctx) then
          local b = G.GAME.current_round.barriers or 0
          if b >= ex.barriers_consumed then
              Pokerleven.ease_barriers(-ex.barriers_consumed)
              local v = 1 + b * ex.xmult_mod
              return {message = localize{type='variable',key='a_xmult',vars={v}}, Xmult_mod = v, colour = G.C.MULT}
          end
      end
  end,
  update = function(self, card, dt)
      if G.STAGE == G.STAGES.RUN and card.area == G.jokers and Pokerleven.is_in_left_half(card) then ina_backend_evolve(card, 'j_ina_Dvalin') end
  end,
  custom_pool_func = true,
  in_pool = function() return false end
})

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
local Sworm = J({
  name = "Sworm",
  pos = { x = 7, y = 5 },
  config = { extra = { odds = 3 } },
  loc_vars = function(self, info_queue, center) return {vars = {G.GAME.probabilities.normal or 1, center.ability.extra.odds}} end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.after and ctx.cardarea == G.jokers and not card.debuff and card.area == G.jokers and not ctx.blueprint then
        local s = {}
        for _, v in ipairs(ctx.full_hand) do if not v.shattered and not v.destroyed and card:odds_triggered('sworm') then
            v.destroyed, v.shattered = true, true; s[#s+1] = v
        end end
        if #s > 0 then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function() for i, v in ipairs(s) do v.destroyed, v.shattered = nil, nil; if v.area == G.play then draw_card(G.play, G.deck, i*100/#s, 'up', false, v) end end; return true end}))
            return {message = localize('k_safe_ex'), colour = G.C.DARK_EDITION}
        end
    end
  end
})

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
  list = { Dvalin, Dvalin_Plus, Sworm }
}
