local Bigman = J({
    name = "Bigman",
    pos = { x = 0, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_1,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Gentleman = J({
    name = "Gentleman",
    pos = { x = 1, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Diver = J({
    name = "Diver",
    pos = { x = 2, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Smokey = J({
    name = "Smokey",
    pos = { x = 3, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Judge = J({
    name = "Judge",
    pos = { x = 4, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Hunter = J({
    name = "Hunter",
    pos = { x = 5, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Yoga = J({
    name = "Yoga",
    pos = { x = 6, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 2,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Cobra = J({
    name = "Cobra",
    pos = { x = 7, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Shakey = J({
    name = "Shakey",
    pos = { x = 8, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_1,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Convoy = J({
    name = "Convoy",
    pos = { x = 9, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Lion = J({
    name = "Lion",
    pos = { x = 10, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_1,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Horn = J({
    name = "Horn",
    pos = { x = 11, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Magician = J({
    name = "Magician",
    pos = { x = 12, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Jack = J({
    name = "Jack",
    pos = { x = 0, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Navy Invaders"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_NavyInvaders",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

return {
    name = "Navy Invaders",
    list = {}
}
