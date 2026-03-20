-- Inazuma Eleven 1

local ff_regional_a = {
    object_type = "Blind",
    name = "ina-ff_regional_a",
    key = "ff_regional_a",
    pos = { x = 0, y = 0 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 0 },
}

local ff_regional_b = {
    object_type = "Blind",
    name = "ina-ff_regional_b",
    key = "ff_regional_b",
    pos = { x = 0, y = 1 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 0 },
}

local ff_national_a = {
    object_type = "Blind",
    name = "ina-ff_national_a-guys",
    key = "ff_national_a",
    pos = { x = 0, y = 2 },
    discovered = false,
    mult = Pokerleven.config.middle_blinds_abilities and 1.55 or 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
}

local ff_national_b = {
    object_type = "Blind",
    name = "ina-ff_national_b",
    key = "ff_national_b",
    pos = { x = 0, y = 3 },
    discovered = false,
    mult = Pokerleven.config.middle_blinds_abilities and 1.55 or 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
}

local umbrella = {
    object_type = "Blind",
    name = "ina-umbrella",
    key = "umbrella",
    pos = { x = 0, y = 4 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    set_blind = function(self)
        G.GAME.blind.hands_sub = -1
        ease_hands_played(-1)
        G.GAME.blind.discards_sub = 1
        ease_discard(1)
    end,
}

local inazuma_kids = {
    object_type = "Blind",
    name = "ina-inazuma_kids",
    key = "inazuma_kids",
    pos = { x = 0, y = 5 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 10000 },
}

local sallys = {
    object_type = "Blind",
    name = "ina-sallys",
    key = "sallys",
    pos = { x = 0, y = 6 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 10000 },
}

local occult = B({
    object_type = "Blind",
    name = "Occult",
    key = "occult",
    pos = { x = 0, y = 7 },
    config = { extra = { retriggerCount = 1 } },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 3 },
    calculate = function(self, blind, context)
        if context.cardarea == G.play and context.repetition and context.other_card:get_id() == 6 then
            return {
                message = localize('k_again_ex'),
                repetitions = self.config.extra.retriggerCount,
                card = context.other_card
            }
        end
    end
})

local inazuma_eleven = {
    object_type = "Blind",
    name = "ina-inazuma_eleven",
    key = "inazuma_eleven",
    pos = { x = 0, y = 8 },
    config = { extra = { suit = "Hearts", chips_mod = 20 } },
    discovered = false,
    mult = 1.65,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 3 },
    calculate = function(self, blind, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(self.config.extra.suit) and context.scoring_hand then
            return {
                message = localize { type = 'variable', key = 'a_chips',
                    vars = { self.config.extra.chips_mod } },
                colour = G.C.CHIPS,
                chip_mod = self.config.extra.chips_mod,
                card = context.other_card
            }
        end
    end
}

local shun = B({
    object_type = "Blind",
    name = "ina-shun",
    key = "shun",
    pos = { x = 0, y = 9 },
    discovered = false,
    mult = 1.75,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    calculate = function(self, blind, context)
        if context.game_over then
            return {
                message = localize('k_saved_ex'),
                saved = 'ina_saved',
                colour = G.C.RED,
                ease_dollars(-G.GAME.dollars, true)
            }
        end
    end
})

local empress = {
    object_type = "Blind",
    name = "ina-empress",
    key = "empress",
    pos = { x = 0, y = 10 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },

    defeat = function(self)
        if not Pokerleven.has_enough_consumables_space() then
            return
        end

        local new_card = create_card("Tarot", G.consumeables, nil, nil, nil, nil, "c_emperor")
        Pokerleven.add_card_to_consumables(new_card)
    end,
}

-- Inazuma Eleven 2

local SPFixers = {
    object_type = "Blind",
    name = "ina-SPFixers",
    key = "spfixers",
    pos = { x = 0, y = 11 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    calculate = function(self, blind, context)
        -- TODO Add logic
    end
}

local Alpine = {
    object_type = "Blind",
    name = "ina-Alpine",
    key = "alpine",
    pos = { x = 0, y = 12 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    calculate = function(self, blind, context)
        -- TODO Add logic
    end
}

local Cloister = {
    object_type = "Blind",
    name = "ina-Cloister",
    key = "cloister",
    pos = { x = 0, y = 13 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    calculate = function(self, blind, context)
        -- TODO Add logic
    end
}

local OsakaCCC = {
    object_type = "Blind",
    name = "ina-OsakaCCC",
    key = "osakaccc",
    pos = { x = 0, y = 14 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    calculate = function(self, blind, context)
        -- TODO Add logic
    end
}

local Fauxshore = {
    object_type = "Blind",
    name = "ina-Fauxshore",
    key = "fauxshore",
    pos = { x = 0, y = 15 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    calculate = function(self, blind, context)
        -- TODO Add logic
    end
}

local MaryTimes = {
    object_type = "Blind",
    name = "ina-MaryTimes",
    key = "marytimes",
    pos = { x = 0, y = 16 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    calculate = function(self, blind, context)
        -- TODO Add logic
    end
}

local robotsg = {
    object_type = "Blind",
    name = "ina-Robotsg",
    key = "robotsg",
    pos = { x = 0, y = 17 },
    discovered = false,
    mult = 1.5,
    atlas = "bigBlinds01",
    order = 1,
    boss_colour = HEX("B7865B"),
    dollars = 4,
    big = { min = 2 },
    calculate = function(self, blind, context)
        -- TODO Add logic
    end
}

return {
    name = "bigBlinds01",
    list = { ff_regional_a, ff_regional_b, ff_national_a, ff_national_b,
        umbrella, inazuma_kids, sallys,
        occult, inazuma_eleven, shun, empress }
}

-- return {
--     name = "bigBlinds01",
--     list = { ff_regional_a, ff_regional_b, ff_national_a, ff_national_b,
--         umbrella, inazuma_kids, sallys,
--         occult, inazuma_eleven, shun, empress, SPFixers, Alpine, Cloister, OsakaCCC, Fauxshore, MaryTimes, robotsg }
-- }
