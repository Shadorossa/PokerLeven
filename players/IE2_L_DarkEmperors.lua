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
    atlas = "jokers02",
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
    atlas = "jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- SamDark
local SamDark = {
    name = "SamDark",
    pos = { x = 12, y = 12 },
    soul_pos = { x = 12, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- JimDark
local JimDark = {
    name = "JimDark",
    pos = { x = 0, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "jokers02",
    ptype = C.Forest,
    pposition = C.DF,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- TodDark
local TodDark = {
    name = "TodDark",
    pos = { x = 1, y = 13 },
    soul_pos = { x = 0, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "jokers02",
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
    atlas = "jokers02",
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
    atlas = "jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

-- ShadowDark
local ShadowDark = J({
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
    atlas = "jokers02",
    ptype = C.Forest,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = false,
    update = function(self, card, dt)
        if G.jokers and G.jokers.cards then
            local right_joker = nil
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                    right_joker = G.jokers.cards[i+1]
                    break
                end
            end
            
            for _, v in ipairs(G.jokers.cards) do
                if v ~= card then
                    local is_target = not card.debuff and (v == right_joker)
                    if is_target then
                        v.shadow_debuffed = true
                        if not v.debuff then v:set_debuff(true) end
                    elseif v.shadow_debuffed then
                        v.shadow_debuffed = nil
                        v:set_debuff(false)
                    end
                end
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if G.jokers and G.jokers.cards then
            for _, v in ipairs(G.jokers.cards) do
                if v.shadow_debuffed then v.shadow_debuffed = nil; v:set_debuff(false) end
            end
        end
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint then
            if not card.edition or not card.edition.negative then
                card.ability.extra.saved_edition = card.edition and { [card.edition.type] = true } or "none"
                card:set_edition({negative = true}, true, true)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_active_ex'), colour = G.C.DARK_EDITION})
            end
        end
        if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
            if card.ability.extra.saved_edition then
                local ed = card.ability.extra.saved_edition
                if ed == "none" then ed = nil end
                card:set_edition(ed, true, true)
                card.ability.extra.saved_edition = nil
            end
        end
    end
})

-- Nathan
local NathanDark = {
    name = "Nathan Swift",
    pos = { x = 8, y = 0 },
    soul_pos = { x = 8, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
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
    calculate = function(self, card, context)
    end
}

-- KevinDark
local KevinDark = {
    name = "KevinDark",
    pos = { x = 7, y = 13 },
    soul_pos = { x = 0, y = 13 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2, -- Common
    pools = { ["darkemperors"] = true },
    cost = 15,
    atlas = "jokers02",
    ptype = C.Forest,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

return {
    name = "Emperadores Oscuros",
    list = { ShadowDark }
}
