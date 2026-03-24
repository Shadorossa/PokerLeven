-- Sandra Fischer (Norika Umihara)
local Sandra_Fischer = J({
    name = "Sandra_Fischer",
    pos = { x = 0, y = 1 },
    config = { extra = { threshold = 0.75 } },
    loc_vars = function(self, info_queue, center) return {vars = {center.ability.extra.threshold * 100}} end,
    rarity = 1, -- Common
    pools = { ["Inakuni Raimon"] = true },
    cost = 5,
    atlas = "Jokers07",
    ptype = C.Wind,
    pposition = C.GK,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = false,
    calculate = function(self, card, ctx)
        if ctx.after and not ctx.blueprint then
            local scored = (G.GAME.current_round.current_hand.chips or 0) * (G.GAME.current_round.current_hand.mult or 1)
            if scored >= (G.GAME.blind.chips * card.ability.extra.threshold) then
                local s = {}
                for _, v in ipairs(ctx.full_hand) do
                    if not v.shattered and not v.destroyed and v.ability and v.ability.wind_sticker then
                        v.destroyed, v.shattered = true, true; s[#s+1] = v
                    end
                end
                if #s > 0 then
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.1, func = function() for i, v in ipairs(s) do v.destroyed, v.shattered = nil, nil; if v.area == G.play then draw_card(G.play, G.deck, i*100/#s, 'up', false, v) end end; return true end}))
                    return {message = localize('k_safe_ex'), colour = G.C.GREEN}
                end
            end
        end
    end
})

-- Adriano Donati
local Adriano_Donati = J({
    name = "Adriano_Donati",
    pos = { x = 8, y = 1 },
    config = { extra = { chips_gain = 25, mult_gain = 4, current_chips = 0, current_mult = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.chips_gain, ex.mult_gain, ex.current_chips, ex.current_mult}} end,
    rarity = 2, -- Uncommon
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.FW,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) then
            if ex.current_chips > 0 or ex.current_mult > 0 then
                local ret = {}
                if ex.current_chips > 0 then ret.chip_mod = ex.current_chips; ret.message = localize{type='variable',key='a_chips',vars={ex.current_chips}} end
                if ex.current_mult > 0 then ret.mult_mod = ex.current_mult; ret.message = localize{type='variable',key='a_mult',vars={ex.current_mult}}; ret.colour = G.C.MULT end
                if not ret.colour then ret.colour = G.C.CHIPS end
                return ret
            end
        elseif ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition and not ctx.game_over then
            local blind_type = G.GAME.blind:get_type()
            if blind_type == 'Small' or blind_type == 'Big' then
                ex.current_chips = ex.current_chips + ex.chips_gain
                return {message = localize('k_upgrade_ex'), colour = G.C.CHIPS}
            elseif blind_type == 'Boss' then
                ex.current_mult = ex.current_mult + ex.mult_gain
                return {message = localize('k_upgrade_ex'), colour = G.C.MULT}
            end
        end
    end
})

-- Sonny Wright
local Sonny_Wright = J({
    name = "Sonny_Wright",
    pos = { x = 9, y = 1 },
    config = { extra = { xmult_gain = 0.5, current_xmult = 1 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.xmult_gain, ex.current_xmult}} end,
    rarity = 3, -- Rare
    pools = { ["Inakuni Raimon"] = true },
    cost = 8,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.FW,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) and ex.current_xmult > 1 then
            return {message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}, Xmult_mod = ex.current_xmult, colour = G.C.XMULT}
        elseif ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition and not ctx.game_over then
            if G.GAME.current_round.hands_left == 0 then
                ex.current_xmult = ex.current_xmult + ex.xmult_gain
                return {message = localize('k_upgrade_ex'), colour = G.C.XMULT}
            end
        end
    end
})

-- Basile
local Basile = J({
    name = "Basile",
    pos = { x = 10, y = 1 },
    config = { extra = { mult_bonus = 1 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.mult_bonus}} end,
    rarity = 2, -- Uncommon
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.FW,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.before and ctx.cardarea == G.jokers and not ctx.blueprint then
            if ctx.scoring_name == 'Two Pair' then
                local transformed = false
                for _, c in ipairs(ctx.scoring_hand) do
                    if not c.ability.fire_sticker then
                        apply_property_sticker(c, 'Fire', 'type')
                        c:juice_up()
                        transformed = true
                    end
                    c.ability.mult = (c.ability.mult or 0) + ex.mult_bonus
                end
                if transformed then
                    return {message = localize("ina_convert"), colour = G.C.RED}
                else
                    return {message = localize("k_upgrade_ex"), colour = G.C.RED}
                end
            end
        end
    end
})

return {
    name = "Inakuni Raimon",
    list = { Sandra_Fischer, Adriano_Donati, Sonny_Wright, Basile }
}