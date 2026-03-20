-- DarkFeldt
local DarkFeldt = {
    name = "DarkFeldt",
    pos = { x = 10, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.GK,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- NightDark
local NightDark = {
    name = "NightDark",
    pos = { x = 11, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- SamDark
local SamDark = J({
    name = "SamDark",
    pos = { x = 12, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = false,
    calculate = function(self, card, context)
    end
})

-- JimDark
local JimDark = J({
    name = "JimDark",
    pos = { x = 0, y = 13 },
    config = { extra = { Xchip_mod = 0.1, current_Xchips = 1 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.Xchip_mod, ex.current_Xchips}} end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) then
            local curr = ex.current_Xchips
            if not ctx.blueprint then ex.current_Xchips = curr * (1 + ex.Xchip_mod) end
            return {message = localize{type='variable',key='a_xchips',vars={curr}}, Xchip_mod = curr, colour = G.C.CHIPS}
        end
    end
})

-- TodDark
local TodDark = {
    name = "TodDark",
    pos = { x = 1, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- SteveDark
local SteveDark = {
    name = "SteveDark",
    pos = { x = 2, y = 13 },
    soul_pos = { x = 0, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- TimmyDark
local TimmyDark = {
    name = "TimmyDark",
    pos = { x = 3, y = 13 },
    soul_pos = { x = 0, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- MaxDark
local MaxDark = {
    name = "MaxDark",
    pos = { x = 4, y = 13 },
    soul_pos = { x = 0, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- ShadowDark
local ShadowDark = {
    name = "ShadowDark",
    pos = { x = 6, y = 13 },
    soul_pos = { x = 0, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Nathan
local NathanDark = J({
    name = "NathanDark",
    pos = { x = 8, y = 0 },
    soul_pos = { x = 8, y = 1 },
    config = { extra = { absorbed_polychromes = 0, max_absorb = 10, poly_xmult = 1.5 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        return { vars = { ex.absorbed_polychromes, ex.max_absorb, ex.poly_xmult ^ ex.absorbed_polychromes } }
    end,
    rarity = "ina_top", -- Destacado
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "top",
    ptype = C.Wind,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex, r_joker = card.ability.extra, card:get_right_joker()
        if ctx.cardarea == G.jokers and ctx.before and not ctx.blueprint then
            local dep, abs, sim = false, false, {cardarea=G.play, full_hand=ctx.full_hand, scoring_hand=ctx.scoring_hand, scoring_name=ctx.scoring_name, poker_hands=ctx.poker_hands, individual=true}
            local h_trig = r_joker and (Pokerleven.simulates_trigger(r_joker, {cardarea=G.jokers, full_hand=ctx.full_hand, scoring_hand=ctx.scoring_hand, scoring_name=ctx.scoring_name, poker_hands=ctx.poker_hands, joker_main=true}) or Pokerleven.simulates_trigger(r_joker, {cardarea=G.jokers, full_hand=ctx.full_hand, scoring_hand=ctx.scoring_hand, scoring_name=ctx.scoring_name, poker_hands=ctx.poker_hands, before=true}))
            for _, s in ipairs(ctx.scoring_hand) do sim.other_card = s
                if ex.absorbed_polychromes > 0 and not s.edition and r_joker and (h_trig or Pokerleven.simulates_trigger(r_joker, sim)) then
                    ex.absorbed_polychromes, dep = ex.absorbed_polychromes - 1, true; Pokerleven.apply_card_property(s, 'edition', 'polychrome')
                elseif ex.absorbed_polychromes < ex.max_absorb and s.edition and s.edition.polychrome then
                    ex.absorbed_polychromes, abs = ex.absorbed_polychromes + 1, true; Pokerleven.remove_card_property(s, 'edition')
                end
            end
            if dep or abs then return {message = (dep and localize('ina_deploy') or "") .. (dep and abs and " & " or "") .. (abs and localize('ina_absorb') or ""), colour = G.C.DARK_EDITION} end
        elseif Pokerleven.is_joker_turn(ctx) and ex.absorbed_polychromes > 0 then
            local xm = ex.poly_xmult ^ ex.absorbed_polychromes
            return {message = localize{type='variable',key='a_xmult',vars={xm}}, Xmult_mod = xm, colour = G.C.DARK_EDITION}
        end
    end
})

-- KevinDark
local KevinDark = J({
    name = "KevinDark",
    pos = { x = 7, y = 13 },
    config = { extra = { retriggers = 2 } },
    loc_vars = function(self, info_queue, center) return {vars = {center.ability.extra.retriggers}} end,
    rarity = 2, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local r = card:get_right_joker()
        if ctx.retrigger_joker_check and not ctx.retrigger_joker and ctx.other_card == r then
            return {message = localize("k_again_ex"), repetitions = card.ability.extra.retriggers, card = card}
        elseif Pokerleven.is_joker_end_of_round(ctx) and G.GAME.blind.boss and not ctx.blueprint then
            Pokerleven.corrupt_joker(r)
        end
    end
})

return {
    name = "Emperadores Oscuros",
    list = { SamDark, JimDark, NathanDark, KevinDark }
}