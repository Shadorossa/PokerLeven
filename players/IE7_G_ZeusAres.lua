-- Hades
local Hades = J({
    name = "Hades",
    pos = { x = 7, y = 4 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common / Uncommon
    pools = { ["Zeus_Ares"] = true },
    cost = 5,
    atlas = "Jokers07",
    ptype = C.Wind,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_Zeus_Ares",
    blueprint_compat = false,
    calculate = function(self, card, ctx)
        if ctx.before and ctx.cardarea == G.jokers and not ctx.blueprint then
            if ctx.scoring_name == 'Pair' and #ctx.scoring_hand == 2 and #ctx.full_hand > 2 then
                local pair_rank = ctx.scoring_hand[1]:get_id()
                local all_higher, cards_to_convert = true, {}
                
                for _, c in ipairs(ctx.full_hand) do
                    local is_scoring = false
                    for _, sc in ipairs(ctx.scoring_hand) do if c == sc then is_scoring = true; break end end
                    
                    if not is_scoring then
                        if c:get_id() <= pair_rank then all_higher = false; break end
                        cards_to_convert[#cards_to_convert+1] = c
                    end
                end
                
                if all_higher and #cards_to_convert > 0 then
                    Pokerleven.convert_cards_to(cards_to_convert, {set_rank = tostring(ctx.scoring_hand[1].base.value)})
                    return {message = localize("ina_crush"), colour = G.C.RED}
                end
            end
        end
    end
})

local function get_perseus_stats(center)
    local tl = center.ability.extra.tech_level or 0
    local decay_percent = math.max(0.1, 0.3 - 0.05 * tl)
    local hands_limit = (tl >= 5) and 3 or 2
    local mult_gain = math.min(7, center.ability.extra.mult_gain)
    return decay_percent, hands_limit, mult_gain
end

-- Perseus
local Perseus = J({
    name = "Perseus",
    pos = { x = 9, y = 4 },
    config = { extra = { mult_gain = 3, current_mult = 0, hands_since = 0 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        local decay_percent, hands_limit, mult_gain = get_perseus_stats(center)
        
        return {
            vars = {
                mult_gain,
                hands_limit,
                math.floor(0.5 + decay_percent * 100),
                ex.current_mult,
                ex.hands_since
            }
        }
    end,
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
        local ex = card.ability.extra
        local oc = ctx.other_card
        local decay_percent, hands_limit, mult_gain = get_perseus_stats(card)

        if ctx.individual and ctx.cardarea == G.play and not ctx.blueprint then
            if oc and (oc:is_suit('Hearts') or oc.ability.fire_sticker) then
                ex.current_mult = ex.current_mult + mult_gain
                card.ability.triggered_this_hand = true
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        elseif Pokerleven.is_joker_turn(ctx) then
            if ex.current_mult > 0 then
                return {
                    message = localize{type='variable', key='a_mult', vars={ex.current_mult}},
                    mult_mod = ex.current_mult,
                    colour = G.C.MULT
                }
            end
        elseif Pokerleven.after_scoring_phase(ctx) and not ctx.blueprint then
            if card.ability.triggered_this_hand then
                ex.hands_since = 0
                card.ability.triggered_this_hand = false
            else
                ex.hands_since = (ex.hands_since or 0) + 1
                if ex.hands_since >= hands_limit then
                    local decay_amt = math.floor(ex.current_mult * decay_percent * 10) / 10
                    ex.hands_since = 0
                    if decay_amt > 0 then
                        ex.current_mult = math.max(0, ex.current_mult - decay_amt)
                        return {
                            message = localize{type='variable', key='a_mult_minus', vars={decay_amt}},
                            colour = G.C.RED
                        }
                    end
                end
            end
        end
    end
})

return {
    name = "Zeus_Ares",
    list = { Hades, Perseus }
}
