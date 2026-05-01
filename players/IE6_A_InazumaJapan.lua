-- Terry
local Terry = J({
    name = "Terry",
    pos = { x = 0, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 1,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 5,
    atlas = "Jokers06",
    ptype = C.Wind,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pnumber = 1,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Trina
local Trina = J({
    name = "Trina",
    pos = { x = 1, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 1,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 5,
    atlas = "Jokers06",
    ptype = C.Forest,
    pposition = C.DF,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pnumber = 2,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Keenan
local Keenan = J({
    name = "Keenan",
    pos = { x = 2, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 1,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 5,
    atlas = "Jokers06",
    ptype = C.Mountain,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pnumber = 3,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Zippy
local Zippy = J({
    name = "Zippy",
    pos = { x = 3, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 1,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 5,
    atlas = "Jokers06",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pnumber = 4,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Frank
local Frank = J({
    name = "Frank",
    pos = { x = 4, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 1,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 5,
    atlas = "Jokers06",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pnumber = 5,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Buddy
local Buddy = J({
    name = "Buddy",
    pos = { x = 5, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 1,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 5,
    atlas = "Jokers06",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    pnumber = 6,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Cerise
local Cerise = J({
    name = "Cerise",
    pos = { x = 6, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 1,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 5,
    atlas = "Jokers06",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.F,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pnumber = 7,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Arion
local Arion = J({
    name = "Arion_Galaxy",
    pos = { x = 7, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 3,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 8,
    atlas = "Jokers06",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pcaptain = C.CAPTAIN,
    pnumber = 8,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Riccardo
local Riccardo = J({
    name = "Riccardo_Galaxy",
    pos = { x = 8, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 2,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 7,
    atlas = "Jokers06",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pnumber = 9,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Victor
local Victor = J({
    name = "Victor_Galaxy",
    pos = { x = 9, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 2,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 7,
    atlas = "Jokers06",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pnumber = 10,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

-- Falco
local Falco = J({
    name = "Falco",
    pos = { x = 10, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = {} } end,
    rarity = 1,
    pools = { ["Inazuma Japón (Galaxy)"] = true },
    cost = 5,
    atlas = "Jokers06",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pnumber = 11,
    pteam = "ina_team_InazumaJaponGalaxy",
    blueprint_compat = true,
    calculate = function(self, card, ctx) end
})

return {
    name = "InazumaJapanGalaxy",
    list = {} -- No functional Jokers yet
}
