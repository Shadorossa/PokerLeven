local benchers = {
    object_type = "SmallBlind",
    key = "benchers",
    pos = { x = 0, y = 0 },
    discovered = false,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 0 },
}

local baseball = B({
    object_type = "SmallBlind",
    key = "baseball_all_stars",
    pos = { x = 0, y = 1 },
    discovered = false,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 2 },
    set_blind = function(self)
        local target_hands = 4
        G.GAME.blind.hands_sub = G.GAME.round_resets.hands - target_hands
        ease_hands_played(-G.GAME.blind.hands_sub)
    end
})

local strange = B({
    object_type = "SmallBlind",
    key = "strange_guys",
    pos = { x = 0, y = 2 },
    discovered = false,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 2 },
    calculate = function(self, blind, context)
        if context.cardarea == G.play and context.other_card == context.scoring_hand[1]
            and context.individual and G.GAME.current_round.hands_played == 0 then
            local rank = { "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14" }
            local selected_rank = pseudorandom_element(rank, pseudoseed('rank'))
            local suit = { "Hearts", "Clubs", "Spades", "Diamonds" }
            local selected_suit = pseudorandom_element(suit, pseudoseed('suit'))
            convert_cards_to(context.other_card, { set_rank = selected_rank, suit_conv = selected_suit })
            return {
                message = localize("ina_convert"),
                colour = G.C.XMULT,
                card = context.other_card,
            }
        end
    end
})

local inazuma08 = B({
    object_type = "SmallBlind",
    key = "inazuma08",
    pos = { x = 0, y = 3 },
    discovered = false,
    mult = 1.25,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 8,
    small = { min = 2 },
})

local inazuma_town = B({
    object_type = "SmallBlind",
    key = "inazuma_town",
    pos = { x = 0, y = 4 },
    config = { extra = { discards = 1, max_hand_types = 6 } },
    collection_loc_vars = function(self)
        return {
            vars = {
                self.config.extra.max_hand_types,
                self.config.extra.discards
            },
            key = self.key
        }
    end,
    loc_vars = function(self)
        return {
            vars = {
                self.config.extra.max_hand_types,
                self.config.extra.discards
            },
            key = self.key
        }
    end,
    discovered = false,
    mult = 1,
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 2 },
    set_blind = function(self)
        local count = 0
        for _, hand in ipairs(G.GAME.hands) do
            if hand.played and hand.played > 0 then
                count = count + 1
            end
        end

        if count > self.config.extra.max_hand_types then
            G.GAME.round_resets.discards = G.GAME.round_resets.discards - self.config.extra.discards
            ease_discard(-1)
        end
    end
})

local glasses = B({
    object_type = "SmallBlind",
    key = "glasses",
    pos = { x = 0, y = 5 },
    discovered = false,
    mult = 1.25,
    config = { extra = { retriggers = 1, times_triggered = 0 } },
    atlas = "smallBlinds01",
    boss_colour = HEX("5EC2E8"),
    dollars = 3,
    small = { min = 3 },
    set_blind = function(self)
        self.config.extra.times_triggered = 0
    end,
    calculate = function(self, blind, context)
        if context.repetition and context.cardarea == G.play and context.other_card then
            if SMODS.has_enhancement(context.other_card, "m_glass")
                and self.config.extra.times_triggered < 2 then
                self.config.extra.times_triggered = self.config.extra.times_triggered + 1
                return {
                    message = localize('k_again_ex'),
                    repetitions = self.config.extra.retriggers,
                    card = context.other_card
                }
            end
        end
    end
})

return {
    name = "SmallBlinds01",
    list = { benchers, baseball, strange, inazuma08, inazuma_town, glasses }
}
