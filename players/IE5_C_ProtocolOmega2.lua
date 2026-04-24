local Kilo = J({
    name = "Kilo",
    pos = { x = 0, y = 11 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Protocol Omega 2"] = true },
    cost = 5,
    atlas = "Jokers05",
    ptype = C.Forest,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.UNKNOWN,
    pteam = "ina_team_ProtocolOmega2",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Foxtrot = J({
    name = "Foxtrot",
    pos = { x = 1, y = 11 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Protocol Omega 2"] = true },
    cost = 5,
    atlas = "Jokers05",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.UNKNOWN,
    pteam = "ina_team_ProtocolOmega2",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Noviembre = J({
    name = "Noviembre",
    pos = { x = 2, y = 11 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Protocol Omega 2"] = true },
    cost = 5,
    atlas = "Jokers05",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.F,
    pnation = C.UNKNOWN,
    pyear = C.UNKNOWN,
    pteam = "ina_team_ProtocolOmega2",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Beta = J({
    name = "Beta",
    pos = { x = 3, y = 11 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 2,
    pools = { ["Protocol Omega 2"] = true },
    cost = 5,
    atlas = "Jokers05",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.F,
    pnation = C.UNKNOWN,
    pyear = C.UNKNOWN,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_ProtocolOmega2",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

return {
    name = "Protocol Omega 2",
    list = {}
}
