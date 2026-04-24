-- Funciones auxiliares para Joseph King
-- Joseph King
local KingR = J({
  name = "KingR",
  pos = { x = 9, y = 6 },
  config = { extra = { barriers = 2, chip_mod = 100, hands_lost = 1, blind_count = 0, trigger_at = 3 } },
  loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.barriers, ex.chip_mod, ex.hands_lost, ex.chip_mod * (G.GAME and G.GAME.round_resets and G.GAME.round_resets.hands or 1), ex.trigger_at, ex.blind_count}} end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then Pokerleven.ease_barriers(ex.barriers)
    elseif Pokerleven.is_joker_turn(ctx) then
        local hands = (G.GAME and G.GAME.round_resets and G.GAME.round_resets.hands) or 1
        local c = ex.chip_mod * hands
        return {message = localize{type='variable',key='a_chips',vars={c}}, chip_mod = c, colour = G.C.CHIPS}
    elseif Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
        ex.blind_count = ex.blind_count + 1
        if ex.blind_count >= ex.trigger_at then
            ex.blind_count = 0; G.GAME.round_resets.hands = math.max(1, G.GAME.round_resets.hands - ex.hands_lost)
            return {message = localize{type='variable',key='a_handsize_minus',vars={ex.hands_lost}}, colour = G.C.RED}
        end
    end
  end
})

-- Beltzer
local Beltzer = J({
  name = "Beltzer",
  pos = { x = 10, y = 6 },
  config = { extra = { chip_gain = 15, current_chips = 0 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_gain, center.ability.extra.current_chips } }
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.discard and not ctx.blueprint then
        local oc = ctx.other_card
        if oc == ctx.full_hand[1] then -- Solo una vez por descarte (el primero)
            local lowest = ctx.full_hand[1]
            for _, v in ipairs(ctx.full_hand) do if v:get_id() < lowest:get_id() then lowest = v end end
            lowest:start_dissolve()
            card.ability.extra.current_chips = card.ability.extra.current_chips + card.ability.extra.chip_gain
            return { message = "+" .. card.ability.extra.chip_gain .. " Chips", colour = G.C.CHIPS }
        end
    elseif Pokerleven.is_joker_turn(ctx) and card.ability.extra.current_chips > 0 then
        return { chip_mod = card.ability.extra.current_chips, colour = G.C.CHIPS }
    end
  end
})

-- Blade
local Blade = J({
  name = "Blade",
  pos = { x = 11, y = 6 },
  config = { extra = { discards_gain = 3 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.discards_gain } }
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.discard and not ctx.blueprint then
        if ctx.scoring_name == 'Flush' then
            ease_discard(card.ability.extra.discards_gain)
            return { message = "+" .. card.ability.extra.discards_gain .. " Descartes", colour = G.C.RED }
        end
    end
  end
})

-- Argie
local Argie = J({
  name = "Argie",
  pos = { x = 12, y = 6 },
  config = { extra = { xmult = 1.2 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.xmult } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.joker_main then
        if G.GAME.current_round.barriers and G.GAME.current_round.barriers > 0 then
            return { x_mult = card.ability.extra.xmult }
        end
    end
  end
})

-- Bamboo
local Bamboo = J({
  name = "Bamboo",
  pos = { x = 0, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue + 1] = G.P_CENTERS.c_fool
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = false,
  -- La lógica de Bamboo se maneja en el hook de sobres
})

-- Messer
local Messer = J({
  name = "Messer",
  pos = { x = 1, y = 7 },
  config = { extra = { scry_mod = 2, play_limit_loss = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.scry_mod, center.ability.extra.play_limit_loss } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = false,
  add_to_deck = function(self, card, from_debuff)
    local ex = card.ability.extra
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) + ex.scry_mod
    if G.hand and G.hand.config then
      G.hand.config.highlighted_limit = math.max(1, G.hand.config.highlighted_limit - ex.play_limit_loss)
      if G.hand.highlighted and #G.hand.highlighted > G.hand.config.highlighted_limit then G.hand:unhighlight_all() end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    local ex = card.ability.extra
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) - ex.scry_mod
    if G.hand and G.hand.config then
      G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + ex.play_limit_loss
    end
  end
})

-- Spark
local Spark = J({
  name = "Spark",
  pos = { x = 2, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = false,
})

-- Hooks de Tienda para Spark y Bamboo
local create_UIBox_booster_pack_ref = G.UIDEF.booster_pack_info
G.UIDEF.booster_pack_info = function(card)
    local res = create_UIBox_booster_pack_ref(card)
    local spark = get_joker_with_key('j_ina_Spark')
    if spark and not spark.debuff then
        if card.ability.extra_cards and card.ability.extra_cards[1] then
            -- Lógica para mostrar SOLO la primera carta en el tooltip o UI
        end
    end
    return res
end

-- Sparrow
local Sparrow = J({
  name = "Sparrow",
  pos = { x = 3, y = 7 },
  config = { extra = { money = 4 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.money } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = false,
  update = function(self, card, dt)
    if G.jokers and G.jokers.cards and card.area == G.jokers then
        if not Pokerleven.is_state_changed(card, {G.jokers}) then return end
        local l = card:get_left_joker()
        local r = card:get_right_joker()
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card then
                if not card.debuff and (v == l or v == r) then
                    v.sparrow_debuffed = true; if not v.debuff then v:set_debuff(true) end
                elseif v.sparrow_debuffed then
                    v.sparrow_debuffed = nil; v:set_debuff(false)
                end
            end
        end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do if v.sparrow_debuffed then v.sparrow_debuffed = nil; v:set_debuff(false) end end end
  end,
  calc_dollar_bonus = function(self, card)
    if card.debuff then return 0 end
    local count = 0
    if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do if v.sparrow_debuffed then count = count + 1 end end end
    if count > 0 then return count * card.ability.extra.money end
  end
})

-- Jamm
local Jamm = J({
  name = "Jamm",
  pos = { x = 4, y = 7 },
  config = { extra = { xmult = 1.25 } },
  loc_vars = function(self, info_queue, center) return {vars = {center.ability.extra.xmult}} end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  update = function(self, card, dt)
    if G.jokers and G.jokers.cards and card.area == G.jokers then 
        if not Pokerleven.is_state_changed(card, {Pokerleven.get_jokers_hash()}) then return end
        for _, v in ipairs(G.jokers.cards) do if v ~= card then
            if not card.debuff and (is_type(v, C.Mountain) or is_type(v, C.Wind)) then v.jamm_debuffed = true; if not v.debuff then v:set_debuff(true) end
            elseif v.jamm_debuffed then v.jamm_debuffed = nil; v:set_debuff(false) end
        end end 
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do if v.jamm_debuffed then v.jamm_debuffed = nil; v:set_debuff(false) end end end
  end,
  calculate = function(self, card, ctx)
    local oj, ex = ctx.other_joker, card.ability.extra
    if oj and oj ~= card and not card.debuff and not oj.debuff and (is_type(oj, C.Fire) or is_type(oj, C.Forest)) then
        G.E_MANAGER:add_event(Event({func = function() oj:juice_up(0.5, 0.5); return true end})); return {message = localize{type='variable',key='a_xmult',vars={ex.xmult}}, Xmult_mod = ex.xmult}
    end
  end
})

-- Caleb Stonewall
local CalebR = J({
  name = "CalebR",
  pos = { x = 5, y = 7 },
  config = { extra = { current_xmult = 1, xmult_gain = 0.5, redux_turns = 0, turns_needed = 4 } },
  loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.current_xmult, ex.xmult_gain, ex.turns_needed, ex.turns_needed - (ex.redux_turns or 0)}} end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 8,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then
        local ba = Pokerleven.ina_bench_area
        local des, delay_amt = false, 0
        local card_count = ba and ba.cards and #ba.cards or 0
        for i = card_count, 1, -1 do local b = ba.cards[i]
            if is_team(b, "ina_team_RoyalAcademy") or is_team(b, "ina_team_RoyalRedux") then
                ex.current_xmult = ex.current_xmult + ex.xmult_gain
                des = true
                b:start_dissolve({G.C.RED}, nil, 1.6)
                G.E_MANAGER:add_event(Event({ trigger = 'after', delay = delay_amt, func = function() b:start_dissolve({G.C.RED}, nil, 1.6); return true end }))
                delay_amt = delay_amt + 0.15
            end
        end
        if des then card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}}) end
    elseif Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
        local k, s
        if G.jokers and G.jokers.cards then
            for _, v in ipairs(G.jokers.cards) do
                if v.config.center_key == 'j_ina_King' then k = v
                elseif v.config.center_key == 'j_ina_Samford' then s = v end
            end
        end
        if k or s then
            ex.redux_turns = ex.redux_turns + 1
            if ex.redux_turns >= ex.turns_needed then
                ex.redux_turns = 0
                if k then ina_evolve(k, 'j_ina_KingR') end
                if s then ina_evolve(s, 'j_ina_SamfordR') end
            else
                return {message = ex.redux_turns .. "/" .. ex.turns_needed, colour = G.C.DARK_EDITION}
            end
        else ex.redux_turns = 0 end
    elseif Pokerleven.is_joker_turn(ctx) and ex.current_xmult > 1 then return {message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}, Xmult_mod = ex.current_xmult} end
  end
})

-- David Samford
local SamfordR = J({
  name = "SamfordR",
  pos = { x = 6, y = 7 },
  config = { extra = { xmult_mod = 1, current_xmult = 1 } },
  loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.xmult_mod, ex.current_xmult}} end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 8,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then
        Pokerleven.consume_all_for_stat(card, G.GAME.current_round.discards_left, function(a) ease_discard(-a, nil, true) end, 'current_xmult', ex.xmult_mod, 1, 'a_xmult', G.C.MULT)
    elseif Pokerleven.is_joker_turn(ctx) and ex.current_xmult > 1 then
        return {message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}, Xmult_mod = ex.current_xmult}
    end
  end
})

-- Cellar
local Cellar = J({
  name = "Cellar",
  pos = { x = 7, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.GK,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = false,
  -- La lógica de sacrificio se maneja globalmente
})

-- Zenn
local Zenn = J({
  name = "Zenn",
  pos = { x = 8, y = 7 },
  config = { extra = { mult = 40 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.mult } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.joker_main then
        if #ctx.scoring_hand == 1 then
            return { mult = card.ability.extra.mult, message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult}} }
        end
    end
  end
})

-- Cossimo
local Cossimo = J({
  name = "Cossimo",
  pos = { x = 10, y = 7 },
  config = { extra = { xmult_per_bench = 0.2 } },
  loc_vars = function(self, info_queue, center)
    local count = 0
    if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
        for _, v in ipairs(Pokerleven.ina_bench_area.cards) do
            if is_team(v, "ina_team_RoyalAcademy") or is_team(v, "ina_team_RoyalRedux") then count = count + 1 end
        end
    end
    return { vars = { center.ability.extra.xmult_per_bench, 1 + count * center.ability.extra.xmult_per_bench } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.joker_main then
        local count = 0
        if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
            for _, v in ipairs(Pokerleven.ina_bench_area.cards) do
                if is_team(v, "ina_team_RoyalAcademy") or is_team(v, "ina_team_RoyalRedux") then count = count + 1 end
            end
        end
        local total_xmult = 1 + count * card.ability.extra.xmult_per_bench
        if total_xmult > 1 then
            return { x_mult = total_xmult }
        end
    end
  end
})

-- Color
local Color = J({
  name = "Color",
  pos = { x = 11, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = false,
  calculate = function(self, card, ctx)
    if ctx.joker_main and ctx.scoring_name == 'Flush' then
        G.GAME.last_flush_suit = ctx.scoring_hand[1].base.suit
    end
  end
})

return {
    name = "Royal Redux",
    list = { KingR, Beltzer, Blade, Argie, Bamboo, Messer, Spark, Sparrow, Jamm, CalebR, SamfordR, Cellar, Zenn, Cossimo, Color }
}
