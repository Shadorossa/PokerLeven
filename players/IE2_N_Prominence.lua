-- Grent
local Grent = {
    name = "Grent",
    pos = { x = 8, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["Prominence"] = true },
    cost = 15,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.GK,
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Baller
local Baller = {
    name = "Baller",
    pos = { x = 9, y = 13 },
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Balcke
local Balcke = {
    name = "Balcke",
    pos = { x = 10, y = 13 },
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Seats
local Seats = {
    name = "Seats",
    pos = { x = 11, y = 13 },
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Bomber
local Bomber = {
    name = "Bomber",
    pos = { x = 12, y = 13 },
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Heat
local Heat = {
    name = "Heat",
    pos = { x = 0, y = 14 },
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Lean
local Lean = {
    name = "Lean",
    pos = { x = 1, y = 14 },
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Bountine
local Lean = {
    name = "Lean",
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- Siden
local Siden = {
    name = "Siden",
    pos = { x = 3, y = 14 },
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

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
    techtype = C.UPGRADES.Plus,
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
local Neppten = {
    name = "Neppten",
    pos = { x = 5, y = 14 },
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
    techtype = C.UPGRADES.NumberType.A,
    pteam = "ina_team_Prominence",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

return {
    name = "Prominence",
    list = { Torch }
    -- list = { Torch },
}
