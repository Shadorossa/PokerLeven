-- Beluga
local Beluga = J({
    name = "Beluga",
    pos = { x = 6, y = 14 },
    config = { extra = { new_glass_denom = 1 } },
    loc_vars = function(self, info_queue, center) return {vars = {G.GAME.probabilities.normal or 1, center.ability.extra.new_glass_denom}} end,
    rarity = 1, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.GK,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    add_to_deck = function(self, card, from_debuff) G.GAME.probabilities.new_glass_denom = card.ability.extra.new_glass_denom end,
    remove_from_deck = function(self, card, from_debuff) G.GAME.probabilities.new_glass_denom = nil end
})

-- Arkew
local Arkew = {
    name = "Arkew",
    pos = { x = 7, y = 14 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Clear
local Clear = J({
    name = "Clear",
    pos = { x = 8, y = 14 },
    config = { extra = { odds = 2 } },
    loc_vars = function(self, info_queue, center) return {vars = {G.GAME.probabilities.normal or 1, center.ability.extra.odds}} end,
    rarity = 2, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.remove_playing_cards and not card.debuff and card.area == G.jokers then local rec = false
            for _, v in ipairs(ctx.removed) do if v.shattered and card:odds_triggered('clear') then
                rec = true; G.E_MANAGER:add_event(Event({func = function() create_playing_card({front = v.config.card}, G.deck, nil, nil, {G.C.SECONDARY_SET.Enhanced}); return true end}))
            end end
            if rec then card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_safe_ex'), colour = G.C.GREEN}) end
        end
    end
})

-- Gocker
local Gocker = {
    name = "Gocker",
    pos = { x = 9, y = 14 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Icer
local Icer = J({
    name = "Icer",
    pos = { x = 10, y = 14 },
    config = { extra = { money = 2 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.money, #find_player_team("Polvo de Diamantes") * ex.money}} end,
    rarity = 1, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.MF,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.remove_playing_cards and not card.debuff and card.area == G.jokers then local s_c = 0
            for _, v in ipairs(ctx.removed) do if v.shattered then s_c = s_c + 1 end end
            if s_c > 0 then local m = s_c * card.ability.extra.money * #find_player_team("Polvo de Diamantes"); ease_dollars(m); card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('$')..m, colour = G.C.MONEY}) end
        end
    end
})

-- Balen
local Balen = {
    name = "Balen",
    pos = { x = 11, y = 14 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Droll
local Droll = {
    name = "Droll",
    pos = { x = 12, y = 14 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.MF,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Rhine
local Rhine = {
    name = "Rhine",
    pos = { x = 0, y = 15 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Blown
local Blown = {
    name = "Blown",
    pos = { x = 1, y = 15 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Gazelle
local Gazelle = J({
    name = "Gazelle",
    pos = { x = 7, y = 0 },
    soul_pos = { x = 7, y = 1 },
    config = { extra = { xmult = 1, xmult_gain = 0.2, combo_bonus = 0.5, charges = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.xmult, ex.xmult_gain, ex.combo_bonus, ex.charges}} end,
    rarity = "ina_top", -- Destacado
    pools = { ["DiamondDust"] = true },
    cost = 15,
    atlas = "top",
    ptype = C.Wind,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.remove_playing_cards and not card.debuff and card.area == G.jokers and not ctx.blueprint then
            local s_c = 0
            for _, v in ipairs(ctx.removed) do if v.shattered then s_c = s_c + 1 end end
            if s_c > 0 then ex.charges, ex.xmult = ex.charges + s_c, ex.xmult + s_c * ex.xmult_gain + (s_c >= 5 and ex.combo_bonus or 0); card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ina_absorb'), colour = G.C.DARK_EDITION}) end
        elseif Pokerleven.is_joker_turn(ctx) and next(ctx.poker_hands['Four of a Kind']) and ex.charges > 0 then
            local xm, c = ex.xmult, 0
            if not ctx.blueprint then
                for _, v in ipairs(ctx.scoring_hand) do if c < ex.charges and v.config.center.key ~= 'm_glass' then Pokerleven.apply_card_property(v, 'enhancement', 'm_glass'); v:juice_up(); c = c + 1 end end
                ex.charges, ex.xmult = ex.charges - c, ex.charges == c and 1 or math.max(1, ex.xmult - c * ex.xmult_gain)
            end
            return {message = localize{type='variable',key='a_xmult',vars={xm}}, Xmult_mod = xm}
        end
    end
})

-- Frost
local Frost = J({
    name = "Frost",
    pos = { x = 3, y = 15 },
    config = { extra = { chips = 0, chip_gain = 10 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.chip_gain, ex.chips}} end,
    rarity = 1, --
    pools = { ["DiamondDust"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Polvo de Diamantes",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.individual and ctx.cardarea == G.play and not ctx.blueprint then
            if ctx.other_card.config.center.key == 'm_ina_chaotic' then
                ex.chips = ex.chips + ex.chip_gain; return {message = localize('k_upgrade_ex'), colour = G.C.CHIPS, card = card}
            end
        end
    end,
    chaotic_effect = function(joker, card, ctx, ret)
        local ex = joker.ability.extra
        if ctx.main_scoring and ex.chips > 0 then ret.chips = (ret.chips or 0) + ex.chips end
    end
})

return {
    name = "Diamond Dust",
    list = { Beluga, Clear, Icer, Gazelle, Frost }
}
