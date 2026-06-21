local RaeWon = J({
    name = "Shin Rae-won",
    pos = { x = 12, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_2,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local DoDoon = J({
    name = "Hwang Do-yoon",
    pos = { x = 0, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_3,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local YoungWoo = J({
    name = "Kim Young-woo",
    pos = { x = 1, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_2,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local SeoAh = J({
    name = "Sung Seo-ah",
    pos = { x = 2, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.DF,
    pgender = C.F,
    pnation = C.KOREA,
    pyear = C.YEAR_2,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local YuHwan = J({
    name = "Park Yu-hwan",
    pos = { x = 3, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_3,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Younghoon = J({
    name = "Young Ji-hoon",
    pos = { x = 4, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_1,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local SeungJin = J({
    name = "Lee Seung-jin",
    pos = { x = 5, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_2,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Seok = J({
    name = "Seok Min-woo",
    pos = { x = 6, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 2,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_3,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local JiWon = J({
    name = "Park Ji-won",
    pos = { x = 7, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_3,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local Baek = J({
    name = "Baek Shi-woo",
    pos = { x = 8, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_3,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local DongHyuk = J({
    name = "Lee Dong-hyuk",
    pos = { x = 9, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_3,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local EunChang = J({
    name = "Heo Eun-chang",
    pos = { x = 10, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_1,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local MinSoo = J({
    name = "Sung Min-soo",
    pos = { x = 11, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_2,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

local JungPyo = J({
    name = "Ha Jung-pyo",
    pos = { x = 12, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return { vars = {} }
    end,
    rarity = 1,
    pools = { ["Red Bison"] = true },
    cost = 5,
    atlas = "Jokers08",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.KOREA,
    pyear = C.YEAR_3,
    pteam = "ina_team_RedBison",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

return {
    name = "Red Bison",
    list = {}
}
