-- VersiÃ³n 0.1

-- Dulce
---@param card Card
local select_random_cards_for_harvest = function(card)
    local count = (#find_player_type("Wind") + #find_player_position("MF")) * card.ability.extra.card_count1

    if count > 0 and G.deck and G.deck.cards and #G.deck.cards > 0 then
        table.unpack = table.unpack or unpack
        local candidates = { table.unpack(G.deck.cards) }

        for i = 1, count do
            if #candidates == 0 then break end

            local target = pseudorandom_element(candidates, pseudoseed("dulce_harvest_" .. i))
            if target then
                target:set_as_harvestable()

                for j, c in ipairs(candidates) do
                    if c == target then
                        table.remove(candidates, j)
                        break
                    end
                end
            end
        end
    end
end

local Dulce = J({
    name = "Dulce",
    pos = { x = 0, y = 0 },
    config = { extra = { card_count1 = 1 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.card_count1 } }
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = "DF",
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.blind_defeated and not context.blueprint then
            return select_random_cards_for_harvest(card)
        end
    end,
})

-- Ryoma
local Ryoma = J({
    name = "Ryoma",
    pos = { x = 1, y = 0 },
    config = { extra = { current_mult = 0, mult_mod_low = 2 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.mult_mod_low, center.ability.extra.current_mult } }
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Mountain,
    pposition = C.GK,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.post_trigger and
            context.other_card ~= card and
            context.other_card.ability and context.other_card.ability.extra and
            type(context.other_card.ability.extra) == "table" and
            context.other_card.ability.extra.pposition == C.GK then
            card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.mult_mod_low
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize("ina_evolve_level"),
                        colour = G.C.XMULT
                    })
                    return true
                end
            }))
            return {}
        end
        if Pokerleven.is_joker_turn(context) then
            return {
                mult = card.ability.extra.current_mult
            }
        end
    end
})

-- Blazer
local Blazer = J({
    name = "Blazer",
    pos = { x = 2, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Fire,
    pposition = C.GK,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    no_training = true,
    allow_element_application = true,
    calculate = function(self, card, context)
        if Pokerleven.is_active_elemental(card) then apply_element("Fire", "ina_onfire", G.ARGS.LOC_COLOURS['fire']) end
    end,
    remove_from_deck = function(self, card, from_debuff)
        restore_types_for_area()
    end
})

-- Weathervane
local Weathervane = J({
    name = "Weathervane",
    pos = { x = 3, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = "DF",
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    no_training = true,
    allow_element_application = true,
    calculate = function(self, card, context)
        if Pokerleven.is_active_elemental(card) then apply_element("Wind", "ina_onwind", G.ARGS.LOC_COLOURS['wind']) end
    end,
    remove_from_deck = function(self, card, from_debuff)
        restore_types_for_area()
    end
})

-- Noggin
local Noggin = J({
    name = "Noggin",
    pos = { x = 4, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Forest,
    pposition = "MF",
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    no_training = true,
    allow_element_application = true,
    calculate = function(self, card, context)
        if Pokerleven.is_active_elemental(card) then apply_element("Forest", "ina_onforest", G.ARGS.LOC_COLOURS['forest']) end
    end,
    remove_from_deck = function(self, card, from_debuff)
        restore_types_for_area()
    end
})

-- Montayne
local Montayne = J({
    name = "Montayne",
    pos = { x = 5, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Mountain,
    pposition = C.FW,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    no_training = true,
    allow_element_application = true,
    calculate = function(self, card, context)
        if Pokerleven.is_active_elemental(card) then apply_element("Mountain", "ina_onmountain", G.ARGS.LOC_COLOURS['mountain']) end
    end,
    remove_from_deck = function(self, card, from_debuff)
        restore_types_for_area()
    end
})

-- Chester
local Chester = J({
    name = "Chester",
    pos = { x = 6, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Forest,
    pposition = "MF",
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Mach
local Mach = J({
    name = "Mach",
    pos = { x = 7, y = 0 },
    config = { extra = { current_Xmult = 1, Xmult_mod = 0.15 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.Xmult_mod, center.ability.extra.current_Xmult } }
    end,
    rarity = 3,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Fire,
    pposition = C.FW,
    techtype = C.UPGRADES.Plus,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.selling_card and
            context.card.ability.set == "Joker" and
            context.card ~= card then
            card.ability.extra.current_Xmult = card.ability.extra.current_Xmult + card.ability.extra.Xmult_mod
            G.E_MANAGER:add_event(Event({
                func = function()
                    card_eval_status_text(card, 'extra', nil, nil, nil, {
                        message = localize("ina_evolve_level"),
                        colour = G.C.XMULT
                    })
                    return true
                end
            }))
            return {}
        end

        if Pokerleven.is_joker_turn(context) then
            return {
                Xmult = card.ability.extra.current_Xmult
            }
        end
    end
})

-- Miles
local Miles = J({
    name = "Miles",
    pos = { x = 8, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = "DF",
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Ace Server
local Ace_Server = J({
    name = "Ace_Server",
    pos = { x = 9, y = 0 },
    config = { extra = { odds4 = 4, hand_level_up = 1, ammount_needed = 2, rank_played = 14, } },
    loc_vars = function(self, info_queue, center)
        return {
            vars = { center.ability.extra.odds4, center.ability.extra.hand_level_up, center.ability.extra.ammount_needed, center.ability.extra.rank_played }
        }
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.GK,
    techtype = C.UPGRADES.Number,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if Pokerleven.after_scoring_phase(context) and
            card:odds_triggered('AceServer') and
            Pokerleven.has_enough_cards_of_rank(context.scoring_hand, card.ability.extra.rank_played, card.ability.extra.ammount_needed) then
            return Pokerleven.level_up_hand(card.ability.extra.hand_level_up)
        end
    end,
    ina_credits = {
        idea = { "Shadorossa" },
    }
})

-- Rex George
local Rex_George = J({
    name = "Rex_George",
    pos = { x = 10, y = 0 },
    config = { extra = { needed_rank = { 2, 3, 4 }, converted_rank = 9 } },
    loc_vars = function(self, info_queue, center)
        local needed_ranks_str = table.concat(center.ability.extra.needed_rank, ", ")
        return {
            vars = { needed_ranks_str, tostring(center.ability.extra.converted_rank) }
        }
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.GK,
    techtype = C.UPGRADES.Number,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local card_value = context.other_card:get_id()
            for _, target_rank in ipairs(card.ability.extra.needed_rank) do
                if card_value == target_rank then
                    convert_cards_to(context.other_card, {
                        set_rank = tostring(card.ability.extra.converted_rank)
                    })
                    return {
                        message = localize("ina_convert"),
                        colour = G.C.XMULT,
                    }
                end
            end
        end
    end,
    ina_credits = {
        idea = { "Shadorossa" },
    }
})

-- George
local George = J({
    name = "George",
    pos = { x = 11, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Forest,
    pposition = C.FW,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Spring
local Spring = J({
    name = "Spring",
    pos = { x = 12, y = 0 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Fire,
    pposition = C.MF,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Summer
local Summer = J({
    name = "Summer",
    pos = { x = 0, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Mountain,
    pposition = C.DF,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Autumn
local Autumn = J({
    name = "Autumn",
    pos = { x = 1, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.GK,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Heart
local Heart = J({
    name = "Heart",
    pos = { x = 2, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Fire,
    pposition = C.GK,
    pteam = "ina_team_Scout",
    no_training = true,
        blueprint_compat = false,
        update = function(self, card, dt) if card.area ~= G.jokers then return end; if not Pokerleven.is_state_changed(card, {G.playing_cards}) then return end; Pokerleven.suit_element_aura(card, 'Hearts', 'Fire') end,
        remove_from_deck = function(self, card, from_debuff) if not from_debuff then Pokerleven.suit_element_aura(card, 'Hearts', 'Fire', true) end end
})

-- Clover
local Clover = J({
    name = "Clover",
    pos = { x = 3, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Forest,
    pposition = C.DF,
    pteam = "ina_team_Scout",
    no_training = true,
        blueprint_compat = false,
        update = function(self, card, dt) if card.area ~= G.jokers then return end; if not Pokerleven.is_state_changed(card, {G.playing_cards}) then return end; Pokerleven.suit_element_aura(card, 'Clubs', 'Forest') end,
        remove_from_deck = function(self, card, from_debuff) if not from_debuff then Pokerleven.suit_element_aura(card, 'Clubs', 'Forest', true) end end
})

-- Diamond
local Diamond = J({
    name = "Diamond",
    pos = { x = 4, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Mountain,
    pposition = C.MF,
    pteam = "ina_team_Scout",
    no_training = true,
        blueprint_compat = false,
        update = function(self, card, dt) if card.area ~= G.jokers then return end; if not Pokerleven.is_state_changed(card, {G.playing_cards}) then return end; Pokerleven.suit_element_aura(card, 'Diamonds', 'Mountain') end,
        remove_from_deck = function(self, card, from_debuff) if not from_debuff then Pokerleven.suit_element_aura(card, 'Diamonds', 'Mountain', true) end end
})

-- Spade
local Spade = J({
    name = "Spade",
    pos = { x = 5, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.FW,
    pteam = "ina_team_Scout",
    no_training = true,
        blueprint_compat = false,
        update = function(self, card, dt) if card.area ~= G.jokers then return end; if not Pokerleven.is_state_changed(card, {G.playing_cards}) then return end; Pokerleven.suit_element_aura(card, 'Spades', 'Wind') end,
        remove_from_deck = function(self, card, from_debuff) if not from_debuff then Pokerleven.suit_element_aura(card, 'Spades', 'Wind', true) end end
})

-- Tom Skipper
local Tom_Skipper = J({
    name = "Tom Skipper",
    pos = { x = 6, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Ian Flappable
local Ian_Flappable = J({
    name = "Ian Flappable",
    pos = { x = 7, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.UNKNOWN,
    pyear = C.YEAR_3,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Finn Geld
local Gold = J({
    name = "Gold",
    pos = { x = 8, y = 1 },
    config = { extra = { loss = 3 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.loss } }
    end,
    rarity = 2,
    pools = { ["Scout"] = true },
    cost = 80,
    atlas = "Jokers10",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    no_training = true,
    calculate = function(self, card, context)
        if context.end_of_round and context.main_eval and not context.blueprint and not context.repetition then
            card.ability.extra_value = (card.ability.extra_value or 0) - card.ability.extra.loss
            card:set_cost()
            return {
                message = "-" .. card.ability.extra.loss .. "$",
                colour = G.C.MONEY
            }
        end
    end
})

-- Trixy Wonder
local Trixy_Wonder = J({
    name = "Trixy_Wonder",
    pos = { x = 9, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.F,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Dave Lung
local Dave_Lung = J({
    name = "Dave Lung",
    pos = { x = 10, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.GK,
    pgender = C.M,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Argento Salvage
local Argento_Salvage = J({
    name = "Argento Salvage",
    pos = { x = 11, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Fire,
    pposition = C.DF,
    pgender = C.M,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Canon Evans
local Canon_Evans = J({
    name = "Canon Evans",
    pos = { x = 12, y = 1 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pyear = C.UNKNOWN,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Bob Daruma
local Bob_Daruma = J({
    name = "Bob Daruma",
    pos = { x = 0, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Mountain,
    pposition = "MF",
    pgender = C.M,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Kaya Haskell
local Kaya_Haskell = J({
    name = "Kaya Haskell",
    pos = { x = 1, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.F,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Virginia "Virgo" Goldstein
local Virginia_Goldstein = J({
    name = "Virginia Goldstein",
    pos = { x = 2, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.F,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Isla Pullens
local Isla_Pullens = J({
    name = "Isla Pullens",
    pos = { x = 3, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Mountain,
    pposition = C.GK,
    pgender = C.F,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Chloe Glazier
local Chloe_Glazier = J({
    name = "Chloe Glazier",
    pos = { x = 4, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Wind,
    pposition = "DF",
    pgender = C.F,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Shay Diebold
local Shay_Diebold = J({
    name = "Shay Diebold",
    pos = { x = 5, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

-- Bruce Barkley
local Bruce_Barkley = J({
    name = "Bruce Barkley",
    pos = { x = 6, y = 2 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["Scout"] = true },
    cost = 5,
    atlas = "Jokers10",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pyear = C.YEAR_2,
    pteam = "ina_team_Scout",
    blueprint_compat = true,
    calculate = function(self, card, context)
        -- TODO Add logic
    end
})

local list = { Blazer, Weathervane, Noggin, Montayne, Mach, Ace_Server, Rex_George, Heart, Clover, Diamond, Spade, Gold, Trixy_Wonder }
if Pokerleven and Pokerleven.config and Pokerleven.config.oc_jokers then
    table.insert(list, 1, Dulce)
    table.insert(list, 2, Ryoma)
end

return {
    name = "Scout",
    list = list
}

