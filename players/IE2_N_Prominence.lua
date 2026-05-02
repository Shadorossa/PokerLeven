-- Grent
local Grent = J({
    name = "Grent",
    pos = { x = 7, y = 13 },
    config = { extra = { barriers_per_calcination = 1 } },
    loc_vars = function(self, info_queue, center) 
        info_queue[#info_queue+1] = {set = 'Other', key = 'Chaotic'}
        return {vars = {center.ability.extra.barriers_per_calcination}} 
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 6,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.Number,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        -- La lógica se activa mediante el hook de calcinación
    end
})

-- Hook para Grent: Generar barreras al calcinar
local apply_card_property_ref = Pokerleven.apply_card_property
function Pokerleven.apply_card_property(card, type, val, ...)
    local res = apply_card_property_ref(card, type, val, ...)
    if type == 'enhancement' and val == 'm_ina_chaotic' then
        local grent = get_joker_with_key('j_ina_Grent')
        if grent and not grent.debuff then
            Pokerleven.ease_barriers(grent.ability.extra.barriers_per_calcination)
            card_eval_status_text(grent, 'extra', nil, nil, nil, {message = localize('k_barrier'), colour = G.C.MOUNTAIN})
        end
    end
    return res
end

-- Baller
local Baller = J({
    name = "Baller",
    pos = { x = 8, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.DF,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Balcke
local Balcke = J({
    name = "Balcke",
    pos = { x = 9, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Seats
local Seats = J({
    name = "Seats",
    pos = { x = 10, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Bomber
local Bomber = J({
    name = "Bomber",
    pos = { x = 11, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Heat
local Heat = J({
    name = "Heat",
    pos = { x = 12, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Lean
local Lean = J({
    name = "Lean",
    pos = { x = 0, y = 14 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Bountine
local Bountine = J({
    name = "Bountine",
    pos = { x = 1, y = 14 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Sidern
local Sidern = J({
    name = "Sidern",
    pos = { x = 2, y = 14 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Torch
local Torch = J({
    name = "Torch",
    pos = { x = 5, y = 0 },
    soul_pos = { x = 5, y = 1 },
    config = { extra = { xmult_gain = 0.1, current_xmult = 1 } },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue+1] = {set = 'Other', key = 'Fire_Blizzard', vars = {'Gazelle'}}
        local ex = center.ability.extra; return {vars = {ex.xmult_gain, ex.current_xmult}}
    end,
    rarity = "ina_top", -- Destacado
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "top",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.SOUTH_KOREA,
    pyear = C.YEAR_2,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.after and not ctx.blueprint then
            local tr, gazelle = false, get_joker_with_key('j_ina_Gazelle')
            for _, v in ipairs(ctx.scoring_hand) do
                if not v.destroyed and not v.shattered and (v:is_suit('Hearts') or v.ability.fire_sticker) then
                    ex.current_xmult, tr = ex.current_xmult + ex.xmult_gain, true
                    if gazelle and not gazelle.debuff then Pokerleven.apply_card_property(v, 'enhancement', 'm_ina_chaotic'); v:juice_up()
                    else v.destroyed = true; v:start_dissolve() end
                end
            end
            if tr then return {message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}} end
        elseif Pokerleven.is_joker_turn(ctx) and ex.current_xmult > 1 then
            return {message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}, Xmult_mod = ex.current_xmult}
        end
    end
})

-- Neppten
local Neppten = J({
    name = "Neppten",
    pos = { x = 3, y = 14 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

return {
    name = "Prominence",
    list = { Torch }
}
