local old_add_tag = add_tag
function add_tag(_tag)
    old_add_tag(_tag)
    if not _tag.ina_cesar_duped and G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do j:calculate_joker({ina_tag_added = true, tag = _tag}) end
    end
end

-- Sandra Fischer (Norika Umihara)
local Sandra_Fischer = J({
    name = "Sandra_Fischer",
    pos = { x = 0, y = 1 },
    config = { extra = { threshold = 0.8, cards_rescued = 1 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {math.floor(ex.threshold * 100), ex.cards_rescued}} end,
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
                local s = {}; for _, v in ipairs(ctx.full_hand) do if v.ability and v.ability.wind_sticker then s[#s+1] = v end end
                local rescued = {}
                for i=1, math.min(#s, card.ability.extra.cards_rescued) do rescued[#rescued+1] = s[i] end
                if Pokerleven.rescue_cards(rescued) then return {message = localize('k_safe_ex'), colour = G.C.GREEN} end
            end
        end
    end
})

-- Cesar Montalban
local Cesar = J({
    name = "Cesar",
    pos = { x = 3, y = 1 },
    config = { extra = { odds = 3 } },
    loc_vars = function(self, info_queue, center) return {vars = {G.GAME.probabilities.normal or 1, center.ability.extra.odds}} end,
    rarity = 2, -- Uncommon
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Forest,
    pposition = C.MF,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.ina_tag_added then
            if pseudorandom('cesar') < G.GAME.probabilities.normal / card.ability.extra.odds then
                local dup = Tag(ctx.tag.key); dup.ina_cesar_duped = true; add_tag(dup)
                return {message = localize('k_copied_ex'), colour = G.C.GREEN}
            end
        end
    end
})

-- Valentin Eisner
local Valentin = J({
    name = "Valentin",
    pos = { x = 6, y = 1 },
    config = { extra = { mult_mod_low = 1, chip_mod = 10 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.mult_mod_low, ex.chip_mod}} end,
    rarity = 2, -- Uncommon
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Wind,
    pposition = C.MF,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = false,
    calculate = function(self, card, ctx)
        if ctx.after and not ctx.blueprint and #ctx.full_hand == 3 then
            if Pokerleven.buff_joker_stats(card:get_right_joker(), card.ability.extra.mult_mod_low, card.ability.extra.chip_mod) then
                return {message = localize('k_upgrade_ex'), colour = G.C.DARK_EDITION}
            end
        end
    end
})

-- Adriano Donati
local Adriano_Donati = J({
    name = "Adriano_Donati",
    pos = { x = 8, y = 1 },
    config = { extra = { chips_mod = 25, mult_mod_low = 4, current_chips = 0, current_mult = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.chips_mod, ex.mult_mod_low, ex.current_chips, ex.current_mult}} end,
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
                ex.current_chips = ex.current_chips + ex.chips_mod
                return {message = localize('k_upgrade_ex'), colour = G.C.CHIPS}
            elseif blind_type == 'Boss' then
                ex.current_mult = ex.current_mult + ex.mult_mod_low
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
    config = { extra = { mult_mod_low = 1 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.mult_mod_low}} end,
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
                    c.ability.mult = (c.ability.mult or 0) + ex.mult_mod_low
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
    list = { Sandra_Fischer, Cesar, Valentin, Adriano_Donati, Sonny_Wright, Basile }
}