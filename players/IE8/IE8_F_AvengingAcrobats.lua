local Kungfu = J({
    name = "Kung Fuche",
    pos = { x = 0, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_1,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Tao = J({
    name = "Tao Lu",
    pos = { x = 1, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Xiao = J({
    name = "Xiao Lau",
    pos = { x = 2, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.F,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Minchi = J({
    name = "Min Yingqi",
    pos = { x = 3, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_1,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Lin = J({
    name = "Che Lin",
    pos = { x = 4, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Tanmin = J({
    name = "Tan Tanmin",
    pos = { x = 5, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Wulong = J({
    name = "Wu Longchi",
    pos = { x = 6, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Zhou = J({
    name = "Zhou Xing",
    pos = { x = 7, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 2,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Hao = J({
    name = "Li Hao",
    pos = { x = 8, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Wantan = J({
    name = "Wan Tanmeo",
    pos = { x = 9, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Xiuna = J({
    name = "Xiu Chuna",
    pos = { x = 10, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Chao = J({
    name = "Chao Mao",
    pos = { x = 11, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Chinsu = J({
    name = "Chi Chinsu",
    pos = { x = 12, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Avenging Acrobats"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_AvengingAcrobats",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

return {
    name = "Avenging Acrobats",
    list = {}
}
