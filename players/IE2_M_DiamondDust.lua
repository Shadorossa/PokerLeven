-- Beluga
local Beluga = J({
    name = "Beluga",
    pos = { x = 0, y = 17 },
    config = { extra = { new_glass_denom = 1 } },
    loc_vars = function(self, info_queue, center) return {vars = {G.GAME.probabilities.normal or 1, center.ability.extra.new_glass_denom}} end,
    rarity = 1,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
    add_to_deck = function(self, card, from_debuff) G.GAME.probabilities.new_glass_denom = card.ability.extra.new_glass_denom end,
    remove_from_deck = function(self, card, from_debuff) G.GAME.probabilities.new_glass_denom = nil end
})

-- Arkew
local Arkew = J({
    name = "Arkew",
    pos = { x = 1, y = 17 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Diamond Dust"] = true },
    cost = 6,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = false,
})

-- Hook para Arkew: Acumular cupones en la tienda
local G_FUNCS_check_for_buyable_vouchers_ref = G.FUNCS.check_for_buyable_vouchers
G.FUNCS.check_for_buyable_vouchers = function(args)
    local arkew = get_joker_with_key('j_ina_Arkew')
    G_FUNCS_check_for_buyable_vouchers_ref(args)
end

local round_resets_ref = Game.round_resets
function Game.round_resets(self)
    local old_voucher = G.GAME.current_round.voucher
    round_resets_ref(self)
    local arkew = get_joker_with_key('j_ina_Arkew')
    if arkew and not arkew.debuff and old_voucher then
        G.GAME.current_round.extra_vouchers = G.GAME.current_round.extra_vouchers or {}
        table.insert(G.GAME.current_round.extra_vouchers, old_voucher)
    end
end

-- Clear
local Clear = J({
    name = "Clear",
    pos = { x = 2, y = 17 },
    config = { extra = { odds = 2 } },
    loc_vars = function(self, info_queue, center) return {vars = {G.GAME.probabilities.normal or 1, center.ability.extra.odds}} end,
    rarity = 2,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.remove_playing_cards and not card.debuff and card.area == G.jokers then
            local tc = {}
            for _, v in ipairs(ctx.removed) do if v.shattered and card:odds_triggered('clear') then tc[#tc+1] = v.config.card end end
            if #tc > 0 then
                G.E_MANAGER:add_event(Event({func = function() for i, f in ipairs(tc) do create_playing_card({front = f}, G.deck, nil, i ~= 1, {G.C.SECONDARY_SET.Enhanced}) end; return true end}))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_safe_ex'), colour = G.C.GREEN})
            end
        end
    end
})

-- Gocker
local Gocker = J({
    name = "Gocker",
    pos = { x = 3, y = 17 },
    config = { extra = { x_mult_override = 1.5 } },
    loc_vars = function(self, info_queue, center) return {vars = {center.ability.extra.x_mult_override}} end,
    rarity = 2,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
})

-- Hook para Gocker: Modificar comportamiento del Vidrio
local calculate_individual_ref = Card.calculate_individual
function Card.calculate_individual(self, context)
    local res = calculate_individual_ref(self, context)
    if self.config.center.key == 'm_glass' then
        local gocker = get_joker_with_key('j_ina_Gocker')
        if gocker and not gocker.debuff then
            if res then res.x_mult = gocker.ability.extra.x_mult_override end
        end
    end
    return res
end

local shatter_ref = Card.shatter
function Card.shatter(self)
    local gocker = get_joker_with_key('j_ina_Gocker')
    if gocker and not gocker.debuff then return end
    return shatter_ref(self)
end

-- Icer
local Icer = J({
    name = "Icer",
    pos = { x = 4, y = 17 },
    config = { extra = { money = 2 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue+1] = {set = 'Other', key = 'Chaotic', vars = {localize("ina_team_Prominence", "teams") or "Prominence"}}
        local dd = find_player_team("ina_team_DiamondDust")
        local prom = find_player_team("ina_team_Prominence")
        local count = #dd
        if #prom > 0 then count = #dd + #prom end
        return {vars = {ex.money, count * ex.money, count}}
    end,
    rarity = 1,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition then
            local dd = find_player_team("ina_team_DiamondDust")
            local prom = find_player_team("ina_team_Prominence")
            local count = #dd
            if #prom > 0 then count = #dd + #prom end
            if count > 0 then
                local m = count * card.ability.extra.money
                ease_dollars(m)
                return { message = localize('$')..m, colour = G.C.MONEY }
            end
        end
    end
})

-- Balen
local Balen = J({
    name = "Balen",
    pos = { x = 5, y = 15 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
    calculate = function(self, card, context) end
})

-- Droll
local Droll = J({
    name = "Droll",
    pos = { x = 6, y = 15 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 2,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
    calculate = function(self, card, context) end
})

-- Rhine
local Rhine = J({
    name = "Rhine",
    pos = { x = 7, y = 15 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 2,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
    calculate = function(self, card, context) end
})

-- Blown
local Blown = J({
    name = "Blown",
    pos = { x = 8, y = 15 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
    calculate = function(self, card, context) end
})

-- Gazelle
local Gazelle = J({
    name = "Gazelle",
    pos = { x = 5, y = 17 },
    soul_pos = { x = 6, y = 1 },
    config = { extra = { xmult_gain = 0.2, charges = 0, max_charges = 10 } },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'Fire_Blizzard', vars = {'Torch'}}
        local ex = center.ability.extra; return {vars = {1 + (ex.charges * ex.xmult_gain), ex.xmult_gain, ex.charges, ex.max_charges}}
    end,
    rarity = "ina_top",
    pools = { ["Diamond Dust"] = true },
    cost = 15,
    atlas = "top",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.SOUTH_KOREA,
    pyear = C.YEAR_2,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_DiamondDust",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.remove_playing_cards and not card.debuff and card.area == G.jokers and not ctx.blueprint then
            local s_c = 0
            for _, v in ipairs(ctx.removed) do if v.shattered then s_c = s_c + 1 end end
            if s_c > 0 then
                local added = Pokerleven.modify_charges(card, s_c)
                if added > 0 then card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ina_absorb'), colour = G.C.DARK_EDITION}) end
            end
        elseif ctx.before and next(ctx.poker_hands['Four of a Kind']) and ex.charges > 0 and not ctx.blueprint then
            local c = 0
            local enhancement = (get_joker_with_key('j_ina_Torch') ~= nil) and 'm_ina_chaotic' or 'm_glass'
            for _, v in ipairs(ctx.scoring_hand) do 
                if c < ex.charges and v.config.center.key ~= enhancement then 
                    Pokerleven.apply_card_property(v, 'enhancement', enhancement); v:juice_up(); c = c + 1 
                end 
            end
            if c > 0 then 
                Pokerleven.modify_charges(card, -c)
                return {message = localize('ina_deploy'), colour = G.C.DARK_EDITION}
            end
        elseif Pokerleven.is_joker_turn(ctx) and ex.charges > 0 then
            local xm = 1 + (ex.charges * ex.xmult_gain)
            return {message = localize{type='variable',key='a_xmult',vars={xm}}, Xmult_mod = xm}
        end
    end
})

-- Frost
local Frost = J({
    name = "Frost",
    pos = { x = 6, y = 17 },
    config = { extra = { chip_mod_normal = 3, chip_mod_chaos = 10 } },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'Chaotic', vars = {localize("ina_team_Prominence", "teams") or "Prominence"}}
        return {vars = {center.ability.extra.chip_mod_normal, center.ability.extra.chip_mod_chaos, #find_player_team("ina_team_Prominence") > 0 and localize("ina_caos") or localize("ina_normal")}}
    end,
    rarity = 1,
    pools = { ["Diamond Dust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_DiamondDust",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local oc, ex = ctx.other_card, card.ability.extra
        if ctx.individual and ctx.cardarea == G.play and not ctx.blueprint and oc then
            local prom, is_c = #find_player_team("ina_team_Prominence") > 0, oc.config.center.key == 'm_ina_chaotic'
            if (prom and is_c) or (not prom and oc.config.center.key == 'c_base') then
                local mod = prom and ex.chip_mod_chaos or ex.chip_mod_normal
                oc.ability.perma_bonus = (oc.ability.perma_bonus or 0) + mod
                oc.ability.frost_bonus = (oc.ability.frost_bonus or 0) + mod
                return {message = localize('k_upgrade_ex'), colour = G.C.CHIPS, card = oc}
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if G.jokers and not G.jokers.cards then return end
        if not from_debuff then
            for _, v in ipairs(G.playing_cards or {}) do
                if v.ability and v.ability.frost_bonus and v.ability.frost_bonus > 0 then
                    v.ability.perma_bonus = math.max(0, (v.ability.perma_bonus or 0) - v.ability.frost_bonus); v.ability.frost_bonus = 0
                end
            end
        end
    end
})

return {
    name = "Diamond Dust",
    list = { Beluga, Arkew, Clear, Gocker, Icer, Gazelle, Frost }
}
