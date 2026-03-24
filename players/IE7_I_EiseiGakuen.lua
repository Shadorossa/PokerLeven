-- Dave Quagmire (Ares)
local Quagmire_Ares = J({
    name = "Quagmire_Ares",
    pos = { x = 1, y = 5 },
    config = { extra = { chip_mod = 15, threshold_upper = 0.15, current_chips = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.chip_mod, math.floor(ex.threshold_upper * 100), ex.current_chips}} end,
    rarity = 1, -- Common
    pools = { ["Eisei Gakuen"] = true },
    cost = 5,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.MF,
    pteam = "ina_team_EiseiGakuen",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.before and ctx.cardarea == G.jokers and not ctx.blueprint then
            local scored = (G.GAME.current_round.current_hand.chips or 0) * (G.GAME.current_round.current_hand.mult or 1)
            if scored < (G.GAME.blind.chips * ex.threshold_upper) then
                ex.current_chips = ex.current_chips + ex.chip_mod
                return {message = localize('k_upgrade_ex'), colour = G.C.CHIPS}
            end
        elseif Pokerleven.is_joker_turn(ctx) and ex.current_chips > 0 then
            return {message = localize{type='variable',key='a_chips',vars={ex.current_chips}}, chip_mod = ex.current_chips, colour = G.C.CHIPS}
        end
    end
})

-- Hunter Foster (Ares)
local Hunter_Ares = J({
    name = "Hunter_Ares",
    pos = { x = 2, y = 5 },
    config = { extra = { mult_mod = 15, chip_mod = 50, val_up = 2 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.mult_mod, ex.chip_mod, ex.val_up}} end,
    rarity = 2, -- Uncommon
    pools = { ["Eisei Gakuen"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.FW,
    pteam = "ina_team_EiseiGakuen",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) then 
            return {message = localize('ina_mano'), mult_mod = ex.mult_mod, chip_mod = ex.chip_mod, colour = G.C.MULT}
        elseif ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition and card.area == G.jokers then
            local adj, has_x = get_adjacent_jokers(card), false
            for _, v in ipairs(adj) do if v.config.center_key == 'j_ina_Xavier_Ares' then has_x = true; break end end
            if has_x then
                if Pokerleven.modify_jokers_sell_value(ex.val_up, nil, card) then return {message = localize('k_val_up'), colour = G.C.MONEY} end
            end
        end
    end
})

-- Xavier Schiller (Ares)
local Xavier_Ares = J({
    name = "Xavier_Ares",
    pos = { x = 6, y = 4 },
    soul_pos = { x = 6, y = 5 },
    config = { extra = { drain_amt = 1, xmult_gain = 0.2, current_xmult = 1 } },
        loc_vars = function(self, info_queue, center) info_queue[#info_queue+1] = {set = 'Other', key = 'Dios_rematador'}; local ex = center.ability.extra; return {vars = {ex.drain_amt, ex.xmult_gain, ex.current_xmult}} end,
    rarity = "ina_top", -- Destacado
    pools = { ["Eisei Gakuen"] = true },
    cost = 10,
    atlas = "top",
    ptype = C.Forest,
    pposition = C.FW,
    pteam = "ina_team_EiseiGakuen",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) and ex.current_xmult > 1 then 
            return {message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}, Xmult_mod = ex.current_xmult, colour = G.C.XMULT}
        elseif ctx.after and not ctx.blueprint and card.area == G.jokers then
            local des, drained = false, 0
            if G.jokers and G.jokers.cards then 
                for _, v in ipairs(G.jokers.cards) do 
                    if v ~= card then
                        if v.sell_cost > 0 then 
                            local amt = math.min(ex.drain_amt, v.sell_cost)
                            drained = drained + amt
                            drain(card, v, ex.drain_amt, true) 
                        end
                        if v.sell_cost <= 0 and not v.ability.eternal then 
                            v:start_dissolve({G.C.RED}, nil, 1.6); des = true 
                        end
                    end 
                end 
            end
            if drained > 0 then
                ex.current_xmult = ex.current_xmult + (drained * ex.xmult_gain)
                return {message = localize('k_upgrade_ex'), colour = G.C.DARK_EDITION}
            end
        end
    end
})

return {
    name = "Eisei Gakuen",
    list = { Quagmire_Ares, Hunter_Ares, Xavier_Ares }
}