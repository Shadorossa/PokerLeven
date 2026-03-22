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
  pteam = "ina_team_ServicioSecreto",
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
local Western = J({
  name = "Western",
  pos = { x = 0, y = 1 },
  config = { extra = { levels_per_card = 2, pending_cards = 0 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.levels_per_card, ex.pending_cards } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["SpFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_ServicioSecreto",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    
    if ctx.discard and not ctx.blueprint and ctx.other_card and ctx.other_card.ability.wind_sticker then
      ex.pending_cards = ex.pending_cards + 1
    elseif Pokerleven.is_joker_turn(ctx) and ex.pending_cards > 0 and ctx.scoring_name == "Pair" then
      local hand_type = ctx.scoring_name
      if G.GAME.hands[hand_type] then
        local lvls = ex.pending_cards * ex.levels_per_card
        
        local ret = {
          message = localize('ina_protocol'),
          mult_mod = lvls * G.GAME.hands[hand_type].l_mult,
          chip_mod = lvls * G.GAME.hands[hand_type].l_chips,
          colour = G.C.RED
        }
        
        if not ctx.blueprint then ex.pending_cards = 0 end
        return ret
      end
    elseif ctx.end_of_round and not ctx.blueprint then
      ex.pending_cards = 0
    end
  end
})

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
  pteam = "ina_team_ServicioSecreto",
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
  pteam = "ina_team_ServicioSecreto",
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
  pteam = "ina_team_ServicioSecreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Firepool
local Firepool = J({
  name = "Firepool",
  pos = { x = 4, y = 1 },
  config = { extra = { retriggers = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.retriggers } }
  end,
  rarity = 1, -- Common
  pools = { ["SpFixers"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_ServicioSecreto",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    
    if ctx.repetition and ctx.cardarea == G.play then
      if ctx.scoring_hand and ctx.scoring_hand[1] == ctx.other_card then
        local wind_cover = 0
        for _, c in ipairs(ctx.full_hand) do
          local scored = false
          for _, sc in ipairs(ctx.scoring_hand) do
            if c == sc then scored = true; break end
          end
          if not scored and c.ability.wind_sticker then wind_cover = wind_cover + 1 end
        end
        
        if wind_cover > 0 then
          return { message = localize('k_again_ex'), repetitions = wind_cover * ex.retriggers, card = ctx.other_card }
        end
      end
    end
  end
})

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
  pteam = "ina_team_ServicioSecreto",
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

local function restore_firsthand_hands(ex)
  if ex.hands_lost and ex.hands_lost > 0 then
    if G.GAME and G.GAME.round_resets then
      G.GAME.round_resets.hands = G.GAME.round_resets.hands + ex.hands_lost
      if G.STAGE == G.STAGES.RUN and G.STATE ~= G.STATES.BLIND_SELECT and G.GAME.current_round then ease_hands_played(ex.hands_lost) end
    end
    ex.hands_lost = 0
  end
end

-- Firsthand
local firsthand = J({
  name = "Firsthand",
  pos = { x = 6, y = 1 },
  config = { extra = { stat_mult = 2.5, hands_lost = 0 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { (center.ability.extra.stat_mult - 1) * 100 } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["SPFixers"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_ServicioSecreto",
  blueprint_compat = false,
  update = function(self, card, dt)
    if G.jokers and G.jokers.cards and card.area == G.jokers then
      local ex = card.ability.extra
      if not card.debuff then
        if G.GAME and G.GAME.round_resets and math.floor(G.GAME.round_resets.hands) > 1 then
          local diff = math.floor(G.GAME.round_resets.hands) - 1
          ex.hands_lost = (ex.hands_lost or 0) + diff
          G.GAME.round_resets.hands = 1
          if G.STAGE == G.STAGES.RUN and G.STATE ~= G.STATES.BLIND_SELECT and G.GAME.current_round then ease_hands_played(-diff) end
        end
      else
        restore_firsthand_hands(ex)
      end
      for _, v in ipairs(G.jokers.cards) do
        if v ~= card then
          if not card.debuff then
            Pokerleven.apply_stat_multiplier(v, 'firsthand', ex.stat_mult)
          else
            Pokerleven.remove_stat_multiplier(v, 'firsthand')
          end
        end
      end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and not G.jokers.cards then return end
    restore_firsthand_hands(card.ability.extra)

    if G.jokers and G.jokers.cards then
      for _, v in ipairs(G.jokers.cards) do
        Pokerleven.remove_stat_multiplier(v, 'firsthand')
      end
    end
  end
})

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
  pteam = "ina_team_ServicioSecreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Tori
local Tori = J({
  name = "Tori",
  pos = { x = 8, y = 1 },
  config = { extra = { stone_bonus = 0.05, accumulation = 0, counted_stones = 0 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.stone_bonus * 100, math.floor((ex.accumulation or 0) * 100 + 0.5), ex.counted_stones } }
  end,
  rarity = 3, -- Rare
  pools = { ["SpFixers"] = true },
  cost = 8,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_ServicioSecreto",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = false,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    
    if (Pokerleven.is_joker_end_of_round(ctx) or ctx.ending_shop) and not ctx.blueprint then
      local current_stones = 0
      if G.playing_cards then
        for _, v in ipairs(G.playing_cards) do
          if SMODS.has_enhancement(v, 'm_stone') then current_stones = current_stones + 1 end
        end
      end
      
      if current_stones > (ex.counted_stones or 0) then
        local new_stones = current_stones - (ex.counted_stones or 0)
        ex.accumulation = (ex.accumulation or 0) + (new_stones * ex.stone_bonus)
        ex.counted_stones = current_stones
      end
    end
    
    if ctx.ending_shop and not ctx.blueprint then
      local r_joker = card:get_right_joker()
      if r_joker and (ex.accumulation or 0) > 0 and type(r_joker.ability.extra) == 'table' and not r_joker.debuff then
        local upgraded = false
        for k, _ in pairs(technique_values) do
          if type(r_joker.ability.extra[k]) == 'number' then
            local val = r_joker.ability.extra[k] * (1 + ex.accumulation)
            local r, f = round_value(val, k)
            r_joker.ability.extra[k] = r
            if f then set_frac(r_joker, f, k) end
            upgraded = true
          end
        end
        
        if upgraded then
          ex.accumulation = 0
          G.E_MANAGER:add_event(Event({ func = function() r_joker:juice_up(0.5, 0.5); return true end }))
          return { message = localize('k_upgrade_ex'), colour = G.C.DARK_EDITION }
        end
      end
    end
  end
})

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
  pteam = "ina_team_ServicioSecreto",
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
  pteam = "ina_team_ServicioSecreto",
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
  pteam = "ina_team_ServicioSecreto",
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
  pteam = "ina_team_ServicioSecreto",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

return {
  name = "SPFixers",
  list = { ironwall, Western, Firepool, fielding, firsthand, Tori }
}
