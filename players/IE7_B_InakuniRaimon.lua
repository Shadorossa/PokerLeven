local old_add_tag = add_tag
function add_tag(_tag)
    old_add_tag(_tag)
    if not _tag.ina_cesar_duped and G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do j:calculate_joker({ ina_tag_added = true, tag = _tag }) end
    end
end

-- Sandra Fischer (Norika Umihara)
local Sandra_Fischer = J({
    name = "Sandra_Fischer",
    pos = { x = 0, y = 1 },
    config = { extra = { threshold = 0.4 } },
    loc_vars = function(self, info_queue, center) return { vars = { math.floor(center.ability.extra.threshold * 100) } } end,
    rarity = 1, -- Common
    pools = { ["Inakuni Raimon"] = true },
    cost = 5,
    atlas = "Jokers07",
    ptype = C.Wind,
    pposition = C.GK,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = false,
    aux_ina = true,
    calculate = function(self, card, ctx)
        if ctx.after and not ctx.blueprint then
            local ex, scored = card.ability.extra,
                (G.GAME.current_round.current_hand.chips or 0) * (G.GAME.current_round.current_hand.mult or 1)
            if scored >= (G.GAME.blind.chips * ex.threshold) then
                local s = {}; for _, v in ipairs(ctx.scoring_hand) do if v.ability and v.ability.wind_sticker then s[#s + 1] =
                        v end end
                if #s > 0 and Pokerleven.rescue_cards(s) then return { message = localize('k_safe_ex'), colour = G.C.GREEN } end
            end
        end
    end
})

-- Kiko Calavento
local Kiko = {
    name = "Kiko",
    pos = { x = 1, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Inakuni Raimon"] = true },
    cost = 5,
    atlas = "Jokers07",
    ptype = C.Forest,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pteam = "ina_team_InakuniRaimon",
    blueprint_compat = true,
}

-- Trevor Cook
local Trevor = J({
    name = "Trevor",
    pos = { x = 1, y = 1 },
    config = { extra = { mult_mod = 3 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra; return { vars = { ex.mult_mod, ex.mult_mod * #find_player_team("ina_team_InakuniRaimon") } }
    end,
    rarity = 1, -- Common
    pools = { ["Inakuni Raimon"] = true },
    cost = 5,
    atlas = "Jokers07",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    aux_ina = true,
    calculate = function(self, card, ctx)
        if ctx.individual and ctx.cardarea == G.play and not ctx.blueprint then
            local id = ctx.other_card:get_id()
            if id == 2 or id == 4 or id == 6 or id == 8 then
                local count = #find_player_team("ina_team_InakuniRaimon")
                local m = count * card.ability.extra.mult_mod
                if m > 0 then return { mult = m, card = card } end
            end
        end
    end
})

-- Nino Nango
local Nino = {
    name = "Nino",
    pos = { x = 3, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Inakuni Raimon"] = true },
    cost = 5,
    atlas = "Jokers07",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pteam = "ina_team_InakuniRaimon",
    blueprint_compat = true,
}

-- Cliff Parker (GÃ³lem)
local Golem = {
    name = "Golem",
    pos = { x = 4, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Inakuni Raimon"] = true },
    cost = 5,
    atlas = "Jokers07",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pteam = "ina_team_InakuniRaimon",
    blueprint_compat = true,
}

-- Maxime Dassier
local Maxime = {
    name = "Maxime",
    pos = { x = 5, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 2,
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_InakuniRaimon",
    blueprint_compat = true,
}

-- Valentin Eisner
local Valentin = J({
    name = "Valentin",
    pos = { x = 2, y = 1 },
    config = { extra = { mult_mod_low = 1, chip_mod = 10 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra; return { vars = { ex.mult_mod_low, ex.chip_mod } }
    end,
    rarity = 2, -- Uncommon
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = false,
    aux_ina = true,
    calculate = function(self, card, ctx)
        if ctx.after and not ctx.blueprint and #ctx.full_hand == 3 then
            if Pokerleven.buff_joker_stats(card:get_right_joker(), card.ability.extra.mult_mod_low, card.ability.extra.chip_mod) then
                return { message = localize('k_upgrade_ex'), colour = G.C.DARK_EDITION }
            end
        end
    end
})

-- Cesar Montalban
local Cesar = J({
    name = "Cesar",
    pos = { x = 3, y = 1 },
    config = { extra = { odds = 3 } },
    loc_vars = function(self, info_queue, center) return { vars = { G.GAME.probabilities.normal or 1, center.ability.extra.odds } } end,
    rarity = 2, -- Uncommon
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    aux_ina = true,
    calculate = function(self, card, ctx)
        if ctx.ina_tag_added then
            if pseudorandom('cesar') < G.GAME.probabilities.normal / card.ability.extra.odds then
                local dup = Tag(ctx.tag.key); dup.ina_cesar_duped = true; add_tag(dup)
                return { message = localize('k_copied_ex'), colour = G.C.GREEN }
            end
        end
    end
})

-- Adriano Donati
local Adriano_Donati = J({
    name = "Adriano_Donati",
    pos = { x = 4, y = 1 },
    config = { extra = { chip_mod = 25, mult_mod_low = 4, current_chips = 0, current_mult = 0 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra; return { vars = { ex.chip_mod, ex.mult_mod_low, ex.current_chips, ex.current_mult } }
    end,
    rarity = 2, -- Uncommon
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    aux_ina = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) then
            if ex.current_chips > 0 or ex.current_mult > 0 then
                local ret = {}
                if ex.current_chips > 0 then
                    ret.chip_mod = ex.current_chips; ret.message = localize { type = 'variable', key = 'a_chips', vars = { ex.current_chips } }
                end
                if ex.current_mult > 0 then
                    ret.mult_mod = ex.current_mult; ret.message = localize { type = 'variable', key = 'a_mult', vars = { ex.current_mult } }; ret.colour =
                    G.C.MULT
                end
                if not ret.colour then ret.colour = G.C.CHIPS end
                return ret
            end
        elseif ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition and not ctx.game_over then
            local blind_type = G.GAME.blind:get_type()
            if blind_type == 'Small' or blind_type == 'Big' then
                ex.current_chips = ex.current_chips + ex.chip_mod
                return { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }
            elseif blind_type == 'Boss' then
                ex.current_mult = ex.current_mult + ex.mult_mod_low
                return { message = localize('k_upgrade_ex'), colour = G.C.MULT }
            end
        end
    end
})

-- Sonny Wright
local Sonny_Wright = J({
    name = "Sonny_Wright",
    pos = { x = 5, y = 1 },
    config = { extra = { xmult_gain = 0.5, current_Xmult = 1 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra; return { vars = { ex.xmult_gain, ex.current_Xmult } }
    end,
    rarity = 3, -- Rare
    pools = { ["Inakuni Raimon"] = true },
    cost = 8,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    aux_ina = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) and ex.current_Xmult > 1 then
            return { message = localize { type = 'variable', key = 'a_xmult', vars = { ex.current_Xmult } }, Xmult_mod =
            ex.current_Xmult, colour = G.C.XMULT }
        elseif ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition and not ctx.game_over then
            if G.GAME.current_round.hands_left == 0 then
                ex.current_Xmult = ex.current_Xmult + ex.xmult_gain
                return { message = localize('k_upgrade_ex'), colour = G.C.XMULT }
            end
        end
    end
})

-- Basile
local Basile = J({
    name = "Basile",
    pos = { x = 6, y = 1 },
    config = { extra = { mult_mod_low = 1 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra; return { vars = { ex.mult_mod_low } }
    end,
    rarity = 2, -- Uncommon
    pools = { ["Inakuni Raimon"] = true },
    cost = 6,
    atlas = "Jokers07",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pteam = "ina_team_InakuniRaimon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    aux_ina = true,
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
                    return { message = localize("ina_convert"), colour = G.C.RED }
                else
                    return { message = localize("k_upgrade_ex"), colour = G.C.RED }
                end
            end
        end
    end
})

return {
    name = "Inakuni Raimon",
    list = { Sandra_Fischer, Trevor, Cesar, Valentin, Adriano_Donati, Sonny_Wright, Basile }
}

