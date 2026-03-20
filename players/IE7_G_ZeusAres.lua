-- Perseus
local Perseus = J({
    name = "Perseus",
    pos = { x = 9, y = 4 },
    config = { extra = { mult_gain = 3, current_mult = 0, hands_limit = 2, decay_percent = 0.1, hands_since = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.mult_gain, ex.hands_limit, ex.decay_percent * 100, ex.current_mult, ex.hands_since}} end,
    rarity = 2, -- Uncommon
    pools = { ["Zeus_Ares"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Zeus",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex, oc = card.ability.extra, ctx.other_card
        if ctx.individual and ctx.cardarea == G.play and not ctx.blueprint and oc and (oc:is_suit('Hearts') or oc.ability.fire_sticker) then
            ex.current_mult, card.ability.triggered_this_hand = ex.current_mult + ex.mult_gain, true
            return {message = localize('k_upgrade_ex'), colour = G.C.MULT, card = card}
        elseif Pokerleven.is_joker_turn(ctx) and ex.current_mult > 0 then
            return {message = localize{type='variable',key='a_mult',vars={ex.current_mult}}, mult_mod = ex.current_mult, colour = G.C.MULT}
        elseif Pokerleven.after_scoring_phase(ctx) and not ctx.blueprint then
            if card.ability.triggered_this_hand then ex.hands_since, card.ability.triggered_this_hand = 0, false
            else ex.hands_since = (ex.hands_since or 0) + 1; if ex.hands_since >= ex.hands_limit then
                local d = math.floor(ex.current_mult * ex.decay_percent * 10) / 10; ex.hands_since = 0
                if d > 0 then ex.current_mult = math.max(0, ex.current_mult - d); return {message = localize{type='variable',key='a_mult_minus',vars={d}}, colour = G.C.RED} end
            end end
        end
    end
})

return {
    name = "Zeus_Ares",
    list = { Perseus }
}
