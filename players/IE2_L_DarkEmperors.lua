-- Feldt_DarkEmp
local Feldt_DarkEmp = J({
    name = "Feldt_DarkEmp",
    pos = { x = 0, y = 12 },
    config = { extra = { cost_tech = 3, cost_type_pos = 5, cost_any = 8 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.cost_tech, ex.cost_type_pos, ex.cost_any}} end,
    rarity = 3, -- Rare
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = false,
    calculate = function(self, card, ctx)
        if ctx.setting_blind and not ctx.blueprint and G.GAME.blind:get_type() == 'Boss' and not G.GAME.blind.disabled then
            local ex, n = card.ability.extra, G.GAME.blind.name
            local tp = n == 'ina-goalkeeper' or n == 'ina-forward' or n == 'ina-defense' or n == 'ina-midfielder' or n == 'ina-fire' or n == 'ina-forest' or n == 'ina-mountain' or n == 'ina-wind'
            local cost = n == 'ina-YoungInazuma' and ex.cost_tech or tp and ex.cost_type_pos or ex.cost_any
            if (G.GAME.current_round.barriers or 0) >= cost then
                Pokerleven.ease_barriers(-cost); G.GAME.blind:disable(); card:juice_up(); return {message = localize('ph_boss_disabled'), colour = G.C.RED}
            end
        end
    end
})

-- Night_DarkEmp
local Night_DarkEmp = J({
    name = "Night_DarkEmp",
    pos = { x = 1, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Sam_DarkEmp
local Sam_DarkEmp = J({
    name = "Sam_DarkEmp",
    pos = { x = 2, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = false,
    calculate = function(self, card, context)
    end
})

-- Jim_DarkEmp
local Jim_DarkEmp = J({
    name = "Jim_DarkEmp",
    pos = { x = 3, y = 12 },
    config = { extra = { Xchip_mod = 0.1, current_Xchips = 1 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.Xchip_mod, ex.current_Xchips}} end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) then
            local curr = ex.current_Xchips
            if not ctx.blueprint then ex.current_Xchips = curr * (1 + ex.Xchip_mod) end
            local current_chips = G.GAME.current_round.current_hand.chips or 1
            local diff = math.floor(current_chips * curr - current_chips)
            return {message = localize{type='variable',key='a_xchips',vars={curr}}, chip_mod = diff, colour = G.C.CHIPS}
        end
    end
})

-- Tod_DarkEmp
local Tod_DarkEmp = J({
    name = "Tod_DarkEmp",
    pos = { x = 4, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Steve_DarkEmp
local Steve_DarkEmp = J({
    name = "Steve_DarkEmp",
    pos = { x = 5, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Timmy_DarkEmp
local Timmy_DarkEmp = J({
    name = "Timmy_DarkEmp",
    pos = { x = 6, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Max_DarkEmp
local Max_DarkEmp = J({
    name = "Max_DarkEmp",
    pos = { x = 7, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Shadow_DarkEmp
local Shadow_DarkEmp = J({
    name = "Shadow_DarkEmp",
    pos = { x = 8, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Nathan_DarkEmp
local Nathan_DarkEmp = J({
    name = "Nathan_DarkEmp",
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    config = { extra = { charges = 0, max_charges = 10, poly_xmult = 1.5 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        return { vars = { ex.charges, ex.max_charges, ex.poly_xmult ^ ex.charges } }
    end,
    rarity = "ina_top", -- Destacado
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "top",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pcaptain = C.CAPTAIN,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex, r_joker = card.ability.extra, card:get_right_joker()
        if ctx.cardarea == G.jokers and ctx.before and not ctx.blueprint then
            local dep, abs, sim = false, false, {cardarea=G.play, full_hand=ctx.full_hand, scoring_hand=ctx.scoring_hand, scoring_name=ctx.scoring_name, poker_hands=ctx.poker_hands, individual=true}
            local h_trig = r_joker and (Pokerleven.simulates_trigger(r_joker, {cardarea=G.jokers, full_hand=ctx.full_hand, scoring_hand=ctx.scoring_hand, scoring_name=ctx.scoring_name, poker_hands=ctx.poker_hands, joker_main=true}) or Pokerleven.simulates_trigger(r_joker, {cardarea=G.jokers, full_hand=ctx.full_hand, scoring_hand=ctx.scoring_hand, scoring_name=ctx.scoring_name, poker_hands=ctx.poker_hands, before=true}))
            for _, s in ipairs(ctx.scoring_hand) do sim.other_card = s
                if ex.charges > 0 and not s.edition and r_joker and (h_trig or Pokerleven.simulates_trigger(r_joker, sim)) then
                    Pokerleven.modify_charges(card, -1); dep = true; Pokerleven.apply_card_property(s, 'edition', 'polychrome')
                elseif ex.charges < ex.max_charges and s.edition and s.edition.polychrome then
                    Pokerleven.modify_charges(card, 1); abs = true; Pokerleven.remove_card_property(s, 'edition')
                end
            end
            if dep or abs then return {message = (dep and localize('ina_deploy') or "") .. (dep and abs and " & " or "") .. (abs and localize('ina_absorb') or ""), colour = G.C.DARK_EDITION} end
        elseif Pokerleven.is_joker_turn(ctx) and ex.charges > 0 then
            local xm = ex.poly_xmult ^ ex.charges
            return {message = localize{type='variable',key='a_xmult',vars={xm}}, Xmult_mod = xm, colour = G.C.DARK_EDITION}
        end
    end
})

-- Kevin_DarkEmp
local Kevin_DarkEmp = J({
    name = "Kevin_DarkEmp",
    pos = { x = 9, y = 12 },
    config = { extra = { retriggers = 2, count = 0, limit = 3 } },
    loc_vars = function(self, info_queue, center) return {vars = {center.ability.extra.retriggers, center.ability.extra.count, center.ability.extra.limit}} end,
    rarity = 2, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_EmperadoresOscuros",
    aux_ina = true,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local r = card:get_right_joker()
        if ctx.retrigger_joker_check and not ctx.retrigger_joker and ctx.other_card == r then
            return {message = localize("k_again_ex"), repetitions = card.ability.extra.retriggers, card = card}
        end
        if ctx.after and not ctx.blueprint and r then
            card.ability.extra.count = card.ability.extra.count + 1
            if card.ability.extra.count >= card.ability.extra.limit then
                card.ability.extra.count = 0
                Pokerleven.corrupt_joker(r)
            end
        end
    end
})

return {
    name = "Emperadores Oscuros",
    list = { Feldt_DarkEmp, Night_DarkEmp, Sam_DarkEmp, Jim_DarkEmp, Tod_DarkEmp, Steve_DarkEmp, Timmy_DarkEmp, Max_DarkEmp, Shadow_DarkEmp, Nathan_DarkEmp, Kevin_DarkEmp }
}
