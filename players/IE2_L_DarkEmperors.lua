-- DarkFeldt
local DarkFeldt = {
    name = "DarkFeldt",
    pos = { x = 10, y = 12 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1, -- Common
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
local JimDark = J({
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
})

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
    atlas = "jokers02",
    ptype = C.Forest,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "Emperadores Oscuros",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
}

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
    rarity = 1, -- Common
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
    list = {}
    -- list = { NathanDark },
}
