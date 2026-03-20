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
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then Pokerleven.ease_barriers(ex.barriers)
    elseif Pokerleven.is_joker_turn(ctx) then
        local c = ex.chip_mod * (G.GAME and G.GAME.round_resets and G.GAME.round_resets.hands or 1)
        return {message = localize{type='variable',key='a_chips',vars={c}}, chip_mod = c, colour = G.C.CHIPS}
    elseif Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
        ex.blind_count = (ex.blind_count or 0) + 1
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
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Blade
local Blade = J({
  name = "Blade",
  pos = { x = 11, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Argie
local Argie = J({
  name = "Argie",
  pos = { x = 12, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Bamboo
local Bamboo = J({
  name = "Bamboo",
  pos = { x = 0, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Messer
local Messer = J({
  name = "Messer",
  pos = { x = 1, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
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
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Sparrow
local Sparrow = J({
  name = "Sparrow",
  pos = { x = 3, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
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
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  update = function(self, card, dt)
    if card.area == G.jokers then for _, v in ipairs(G.jokers.cards) do if v ~= card then
        if not card.debuff and (is_type(v, C.Mountain) or is_type(v, C.Wind)) then v.jamm_debuffed = true; if not v.debuff then v:set_debuff(true) end
        elseif v.jamm_debuffed then v.jamm_debuffed = nil; v:set_debuff(false) end
    end end end
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
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then
        local des, ba = false, Pokerleven.ina_bench_area
        for i = ba and ba.cards and #ba.cards or 0, 1, -1 do local b = ba.cards[i]
            if is_team(b, "Royal Academy") or is_team(b, "Royal Redux") then
                ex.current_xmult, des = ex.current_xmult + ex.xmult_gain, true; b:start_dissolve({G.C.RED}, nil, 1.6)
            end
        end
        if des then card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}}) end
    elseif Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
        local k, s
        for _, v in ipairs(G.jokers.cards) do if v.config.center_key == 'j_ina_King' then k = v elseif v.config.center_key == 'j_ina_Samford' then s = v end end
        if k or s then
            ex.redux_turns = (ex.redux_turns or 0) + 1
            if ex.redux_turns >= ex.turns_needed then ex.redux_turns = 0; if k then ina_evolve(k, 'j_ina_KingR') end; if s then ina_evolve(s, 'j_ina_SamfordR') end
            else return {message = ex.redux_turns .. "/" .. ex.turns_needed, colour = G.C.DARK_EDITION} end
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
  pteam = "Royal Redux",
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
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.GK,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Zenn
local Zenn = J({
  name = "Zenn",
  pos = { x = 8, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Little
local Little = J({
  name = "Little",
  pos = { x = 9, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Cossimo
local Cossimo = J({
  name = "Cossimo",
  pos = { x = 10, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
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
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
    name = "Royal Redux",
    list = { KingR, Jamm, CalebR, SamfordR }
    -- list = { Beltzer, Blade, Argie, Bamboo, Messer, Spark, Sparrow, Cellar, Zenn, Little, Cosimo, Color },
}
