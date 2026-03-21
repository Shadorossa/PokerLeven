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
local Kenville = J({
  name = "Kenville",
  pos = { x = 1, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.individual and ctx.cardarea == G.play and not ctx.blueprint then
        local oc = ctx.other_card
        if not oc then return end
        local id = oc:get_id()
        if id == 2 or id == 3 or id == 4 then
            local b_c, b_xc, s_ctx = 0, 1, {cardarea=G.play, full_hand=ctx.full_hand, scoring_hand=ctx.scoring_hand, scoring_name=ctx.scoring_name, poker_hands=ctx.poker_hands, individual=true, other_card=oc}
            local q_l = G.E_MANAGER.queues.base and #G.E_MANAGER.queues.base or 0
            local o_ab = copy_table(oc.ability)
            local o_id, o_s, o_f, o_nom = oc.get_id, oc.is_suit, oc.is_face, oc.get_nominal
            local o_b_id, o_b_val = oc.base.id, oc.base.value
            
            for _, j in ipairs(G.jokers.cards) do
                if j ~= card and not j.debuff then
                    local j_ab = copy_table(j.ability)
                    local r_eval = j:calculate_joker(s_ctx); j.ability = copy_table(j_ab)
                    
                    oc.get_id = function() return 14 end; oc.is_suit = function() return true end; oc.is_face = function() return true end; oc.get_nominal = function() return 11 end
                    oc.base.id = 14; oc.base.value = 'Ace'
                    local f_eval1 = j:calculate_joker(s_ctx); j.ability = copy_table(j_ab)
                    
                    oc.get_id = function() return 13 end; oc.base.id = 13; oc.base.value = 'King'
                    local f_eval2 = j:calculate_joker(s_ctx); j.ability = copy_table(j_ab)
                    
                    oc.get_id = o_id; oc.is_suit = o_s; oc.is_face = o_f; oc.get_nominal = o_nom; oc.base.id = o_b_id; oc.base.value = o_b_val
                    
                    local max_c, max_xc = 0, 1
                    for _, e in ipairs({f_eval1, f_eval2}) do if type(e) == 'table' then
                        local c, xc = (e.chips or 0) + (e.chip_mod or 0), (e.xchips or 1) * (e.x_chips or 1) * (e.Xchip_mod or 1) * (e.Xchips_mod or 1)
                        if c > max_c then max_c = c end; if xc > max_xc then max_xc = xc end
                    end end
                    
                    local rc, rxc = 0, 1
                    if type(r_eval) == 'table' then rc = (r_eval.chips or 0) + (r_eval.chip_mod or 0); rxc = (r_eval.xchips or 1) * (r_eval.x_chips or 1) * (r_eval.Xchip_mod or 1) * (r_eval.Xchips_mod or 1) end
                    b_c, b_xc = b_c + math.max(0, max_c - rc), b_xc * math.max(1, max_xc / rxc)
                end
            end
            oc.ability = o_ab; while G.E_MANAGER.queues.base and #G.E_MANAGER.queues.base > q_l do table.remove(G.E_MANAGER.queues.base) end
            if b_c > 0 or b_xc > 1 then local ret = {card = card}; if b_c > 0 then ret.chips = b_c end; if b_xc > 1 then ret.xchips = b_xc; ret.x_chips = b_xc end; return ret end
        end
    end
  end
})

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
local Fedora = J({
  name = "Fedora",
  pos = { x = 5, y = 5 },
  config = { extra = { mult_per_discard = 10, discarded_this_blind = 0 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.mult_per_discard, ex.mult_per_discard * (ex.discarded_this_blind or 0) } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if (ctx.setting_blind or ctx.skip_blind) and not ctx.blueprint then
        if ctx.setting_blind then ex.discarded_this_blind = 0 end
        if G.fedora_void and G.fedora_void.cards then
            for i = #G.fedora_void.cards, 1, -1 do
                local c = G.fedora_void.cards[i]
                if c.fedora_void_timer then
                    c.fedora_void_timer = c.fedora_void_timer - 1
                    if c.fedora_void_timer <= 0 then
                        c.fedora_void_timer = nil; c.area:remove_card(c); G.deck:emplace(c)
                    end
                end
            end
        end
    elseif ctx.discard and not ctx.blueprint then
        ex.discarded_this_blind = (ex.discarded_this_blind or 0) + 1
        ctx.other_card.fedora_void_timer = 2
    elseif ctx.individual and ctx.cardarea == G.play then
        if ctx.other_card and ctx.other_card.config.center.key == 'm_ina_chaotic' then
            local base_card = ctx.blueprint and (get_joker_with_key('j_ina_Fedora') or card) or card
            local m = (base_card.ability.extra.mult_per_discard or 10) * (base_card.ability.extra.discarded_this_blind or 0)
            if m > 0 then return { mult = m, card = card } end
        end
    end
  end,
  update = function(self, card, dt)
      if G.discard and G.discard.cards then
          for i = #G.discard.cards, 1, -1 do
              local c = G.discard.cards[i]
              if c.fedora_void_timer then c.area:remove_card(c); if G.fedora_void then G.fedora_void:emplace(c) end; c:juice_up() end
          end
      end
  end,
  remove_from_deck = function(self, card, from_debuff)
      if not from_debuff then
          local h = false
          if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do if v ~= card and v.config.center_key == 'j_ina_Fedora' then h = true; break end end end
          if not h and G.fedora_void and G.fedora_void.cards then for i = #G.fedora_void.cards, 1, -1 do local c = G.fedora_void.cards[i]; c.fedora_void_timer = nil; c.area:remove_card(c); G.deck:emplace(c) end end
      end
  end
})

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
local Mercury = J({
  name = "Mercury",
  pos = { x = 8, y = 5 },
  config = { extra = { required_stones = 2, stone_hands = {["Pair"] = true} } },
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.m_stone
    info_queue[#info_queue+1] = G.P_CENTERS.c_mercury
    return { vars = { center.ability.extra.required_stones } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.pre_discard and ctx.full_hand and #ctx.full_hand == 2 and not ctx.blueprint then
        if ctx.full_hand[1]:get_id() == ctx.full_hand[2]:get_id() then
            convert_cards_to(ctx.full_hand, {mod_conv = "m_stone"})
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize("ina_convert"), colour = G.C.DARK_EDITION})
        end
    elseif Pokerleven.is_joker_turn(ctx) then
        local stone_count = 0
        for _, v in ipairs(ctx.scoring_hand) do if SMODS.has_enhancement(v, 'm_stone') then stone_count = stone_count + 1 end end
        if stone_count >= card.ability.extra.required_stones then
            if Pokerleven.has_enough_consumables_space() then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({func = function() local _c = create_card('Planet', G.consumeables, nil, nil, nil, nil, 'c_mercury'); Pokerleven.add_card_to_consumables(_c); G.GAME.consumeable_buffer = 0; return true end}))
                return { message = localize("k_plus_planet"), colour = G.C.SECONDARY_SET.Planet }
            end
        end
    end
  end
})

-- Metron
local Metron = J({
  name = "Metron",
  pos = { x = 9, y = 5 },
  config = { extra = { exp_gain = 0.015, current_exp = 1, required_id = nil, required_val = nil } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    local rank_str = ex.required_val and localize(ex.required_val, 'ranks') or localize('k_none')
    info_queue[#info_queue+1] = {set = 'Other', key = 'ConsecutiveCards', vars = {'de igual rango'}}
    return { vars = { ex.exp_gain, ex.current_exp, rank_str } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.before and not ctx.blueprint then
        local lowest_id, lowest_val, required_met = 15, nil, false
        for _, c in ipairs(ctx.full_hand) do
            local id = c:get_id()
            if id < lowest_id then lowest_id, lowest_val = id, c.base.value end
            if ex.required_id and id == ex.required_id then required_met = true end
        end
        
        if not ex.required_id or required_met then
            ex.current_exp, ex.required_id, ex.required_val = ex.current_exp + ex.exp_gain, lowest_id, lowest_val
            return {message = localize('k_upgrade_ex'), colour = G.C.CHIPS}
        else
            ex.current_exp, ex.required_id, ex.required_val = 1, lowest_id, lowest_val
            return {message = localize('k_reset'), colour = G.C.RED}
        end
    elseif Pokerleven.is_joker_turn(ctx) and ex.current_exp > 1 then
        local current_chips = G.GAME.current_round.current_hand.chips or 1
        local diff = math.floor((current_chips ^ ex.current_exp) - current_chips)
        return {message = "^" .. string.format("%.3f", ex.current_exp), chip_mod = diff, colour = G.C.CHIPS}
    end
  end
})

-- Zell
local Zell = J({
  name = "Zell",
  pos = { x = 10, y = 5 },
  config = { extra = { req_players = 3 } },
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue+1] = G.P_CENTERS.c_pluto
    return { vars = { center.ability.extra.req_players - 1 } }
  end,
  rarity = 3, -- Rare
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if Pokerleven.is_joker_turn(ctx) and ctx.scoring_name == "High Card" then
        if #find_player_team("Epsilon") >= card.ability.extra.req_players then
            if Pokerleven.has_enough_consumables_space() then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({func = function() local _c = create_card('Planet', G.consumeables, nil, nil, nil, nil, 'c_pluto'); Pokerleven.add_card_to_consumables(_c); G.GAME.consumeable_buffer = 0; return true end}))
                return { message = localize("k_plus_planet"), colour = G.C.SECONDARY_SET.Planet }
            end
        end
    end
  end
})

return {
  name = "Epsilon",
  list = { Dvalin, Dvalin_Plus, Kenville, Fedora, Sworm, Mercury, Metron, Zell }
}
