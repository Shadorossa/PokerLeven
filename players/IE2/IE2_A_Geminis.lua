-- Galileo
local Galileo = J({
  name = "Galileo",
  pos = { x = 0, y = 0 },
  config = { extra = { mult_gain = 2, mult = 0 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.mult_gain, center.ability.extra.mult } }
  end,
  rarity = 1,
  pools = { ["Geminis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 1,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.joker_main and not context.blueprint then
        if context.scoring_hand and #context.scoring_hand > 0 then
            local last_card = context.scoring_hand[#context.scoring_hand]
            G.E_MANAGER:add_event(Event({
                func = function()
                    last_card:start_dissolve()
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                    card:juice_up()
                    -- Trigger Pandora
                    local pandora = get_joker_with_key('j_ina_Pandora')
                    if pandora then pandora:calculate_joker({ina_destruction = true}) end
                    return true
                end
            }))
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.MULT
            }
        end
    end

    if context.joker_main and card.ability.extra.mult > 0 then
        return {
            mult_mod = card.ability.extra.mult,
            message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
        }
    end
  end
})

-- Coral
local Coral = J({
  name = "Coral",
  pos = { x = 1, y = 0 },
  config = { extra = { chips_per_special = 10 } },
  loc_vars = function(self, info_queue, center)
    local special_count = 0
    if G.playing_cards then
        for _, c in ipairs(G.playing_cards) do
            if c.edition or c.seal then special_count = special_count + 1 end
        end
    end
    return { vars = { center.ability.extra.chips_per_special, special_count * center.ability.extra.chips_per_special } }
  end,
  rarity = 2,
  pools = { ["Geminis"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 2,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.joker_main then
        local special_count = 0
        for _, c in ipairs(G.playing_cards) do
            if c.edition or c.seal then special_count = special_count + 1 end
        end
        if special_count > 0 then
            return {
                chip_mod = special_count * card.ability.extra.chips_per_special,
                message = localize { type = 'variable', key = 'a_chips', vars = { special_count * card.ability.extra.chips_per_special } }
            }
        end
    end
  end
})

-- Gigs
local Gigs = J({
  name = "Gigs",
  pos = { x = 2, y = 0 },
  config = { extra = { retriggers = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.retriggers } }
  end,
  rarity = 1,
  pools = { ["Geminis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 3,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.retrigger_joker and context.other_cardarea == G.play then
        local other_fire = nil
        for _, j in ipairs(G.jokers.cards) do
            if j ~= card and j.config.center.ptype == C.Fire then
                other_fire = j
                break
            end
        end

        if other_fire then
            if context.other_card == context.scoring_hand[1] then
                return {
                    repetitions = card.ability.extra.retriggers,
                    card = card
                }
            end
        end
    end
  end
})

-- Ganymede
local Ganymede = J({
  name = "Ganymede",
  pos = { x = 3, y = 0 },
  config = { extra = { chips = 150, chip_loss = 5 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_loss, center.ability.extra.chips } }
  end,
  rarity = 1,
  pools = { ["Geminis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 4,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.cardarea == G.jokers and context.before and not context.blueprint then
        card.ability.extra.chips = math.max(0, card.ability.extra.chips - card.ability.extra.chip_loss)
        if card.ability.extra.chips > 0 then
            return {
                message = localize('ina_val_down'),
                colour = G.C.CHIPS,
                card = card
            }
        end
    end

    if context.joker_main and card.ability.extra.chips > 0 then
        return {
            chip_mod = card.ability.extra.chips,
            message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
        }
    end
  end
})

-- Charon
local Charon = J({
  name = "Charon",
  pos = { x = 4, y = 0 },
  config = { extra = { mult = 15 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.mult } }
  end,
  rarity = 1,
  pools = { ["Geminis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 5,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.joker_main then
        if context.poker_hands and context.poker_hands['Flush'] then
            local last_card = context.scoring_hand[#context.scoring_hand]
            G.E_MANAGER:add_event(Event({
                func = function()
                    last_card:start_dissolve()
                    -- Trigger Pandora
                    local pandora = get_joker_with_key('j_ina_Pandora')
                    if pandora then pandora:calculate_joker({ina_destruction = true}) end
                    return true
                end
            }))
            return {
                mult_mod = card.ability.extra.mult,
                message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
            }
        end
    end
  end
})

-- Pandora
local Pandora = J({
  name = "Pandora",
  pos = { x = 5, y = 0 },
  config = { extra = { base_odds = 5 } },
  loc_vars = function(self, info_queue, center)
    local wind_count = 0
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            if j.config.center.ptype == C.Wind then wind_count = wind_count + 1 end
        end
    end
    local numerator = (G.GAME.probabilities.normal or 1) + wind_count
    return { vars = { numerator, center.ability.extra.base_odds, (numerator >= center.ability.extra.base_odds and localize('k_negative') or "") } }
  end,
  rarity = 2,
  pools = { ["Geminis"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 6,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.ina_destruction then
        local wind_count = 0
        for _, j in ipairs(G.jokers.cards) do
            if j.config.center.ptype == C.Wind then wind_count = wind_count + 1 end
        end
        local numerator = (G.GAME.probabilities.normal or 1) + wind_count
        
        if pseudorandom('pandora') < numerator / card.ability.extra.base_odds then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local planet = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'pandora')
                    if numerator >= card.ability.extra.base_odds then
                        planet:set_edition({negative = true})
                    end
                    planet:add_to_deck()
                    G.consumeables:emplace(planet)
                    card:juice_up()
                    return true
                end
            }))
        end
    end
  end
})

-- Grengo
local Grengo = J({
  name = "Grengo",
  pos = { x = 6, y = 0 },
  config = { extra = { chips_per_missing = 10 } },
  loc_vars = function(self, info_queue, center)
    local missing = math.max(0, 52 - #G.playing_cards)
    return { vars = { center.ability.extra.chips_per_missing, missing * center.ability.extra.chips_per_missing } }
  end,
  rarity = 2,
  pools = { ["Geminis"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 7,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.joker_main then
        local missing = math.max(0, 52 - #G.playing_cards)
        if missing > 0 then
            return {
                chip_mod = missing * card.ability.extra.chips_per_missing,
                message = localize { type = 'variable', key = 'a_chips', vars = { missing * card.ability.extra.chips_per_missing } }
            }
        end
    end
  end
})

-- Io
local Io = J({
  name = "Io",
  pos = { x = 7, y = 0 },
  config = { extra = { odds = 3 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
  end,
  rarity = 2,
  pools = { ["Geminis"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 8,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.joker_main and not context.blueprint then
        local hand_key = context.scoring_name
        if G.GAME.hands[hand_key] and G.GAME.hands[hand_key].config.cards_limit <= 4 then
            if pseudorandom('io') < G.GAME.probabilities.normal / card.ability.extra.odds then
                -- Destroy lowest card in deck
                local lowest_card = nil
                local min_rank = 15
                for _, c in ipairs(G.playing_cards) do
                    if c.base.id < min_rank then
                        min_rank = c.base.id
                        lowest_card = c
                    end
                end
                
                if lowest_card then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            lowest_card:start_dissolve()
                            -- Trigger Pandora/Rihm
                            local pandora = get_joker_with_key('j_ina_Pandora')
                            if pandora then pandora:calculate_joker({ina_destruction = true}) end
                            local rihm = get_joker_with_key('j_ina_Rihm')
                            if rihm then rihm:calculate_joker({ina_destruction = true}) end
                            
                            local planet = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'io')
                            planet:add_to_deck()
                            G.consumeables:emplace(planet)
                            return true
                        end
                    }))
                    return {
                        message = localize('k_plus_planet'),
                        colour = G.C.SECONDARY_SET.Planet
                    }
                end
            end
        end
    end
  end
})

-- Rihm
local Rihm = J({
  name = "Rihm",
  pos = { x = 8, y = 0 },
  config = { extra = { x_mult = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.x_mult } }
  end,
  rarity = 2,
  pools = { ["Geminis"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 9,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.end_of_round and not context.blueprint and not context.individual and not context.repetition then
        card.ability.extra.x_mult = (pseudorandom('rihm') * 3.9) + 0.1
        -- Round to 2 decimals
        card.ability.extra.x_mult = math.floor(card.ability.extra.x_mult * 10) / 10
        return {
            message = localize('k_val_up'),
            colour = G.C.MULT,
            card = card
        }
    end

    if context.joker_main then
        return {
            x_mult = card.ability.extra.x_mult
        }
    end
  end
})

-- Janus
local Janus = J({
  name = "Janus",
  pos = { x = 9, y = 0 },
  config = { extra = { x_mult_gain = 0.2, x_mult = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.x_mult_gain, center.ability.extra.x_mult } }
  end,
  rarity = 3,
  pools = { ["Geminis"] = true },
  cost = 10,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 10,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.using_consumeable and not context.blueprint then
        if context.consumeable.ability.set == 'Planet' then
            local hand_key = context.consumeable.ability.config.hand_type
            if G.GAME.hands[hand_key] and G.GAME.hands[hand_key].config.cards_limit <= 4 then
                card.ability.extra.x_mult = card.ability.extra.x_mult + card.ability.extra.x_mult_gain
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.MULT,
                    card = card
                }
            end
        end
    end

    if context.joker_main and card.ability.extra.x_mult > 1 then
        return {
            x_mult = card.ability.extra.x_mult
        }
    end
  end
})

-- Diam
local Diam = J({
  name = "Diam",
  pos = { x = 10, y = 0 },
  config = { extra = { chips_per_destroyed = 40 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chips_per_destroyed } }
  end,
  rarity = 1,
  pools = { ["Geminis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 11,
  pteam = "ina_team_TormentaDeGeminis",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.joker_main and not context.blueprint then
        local gemini_count = 0
        for _, j in ipairs(G.jokers.cards) do
            if j.config.center.pteam == "ina_team_TormentaDeGeminis" then gemini_count = gemini_count + 1 end
        end

        local destroyed_count = 0
        if G.hand and G.hand.cards then
            for i = math.min(#G.hand.cards, gemini_count), 1, -1 do
                local c = G.hand.cards[i]
                G.E_MANAGER:add_event(Event({
                    func = function()
                        c:start_dissolve()
                        -- Trigger Pandora
                        local pandora = get_joker_with_key('j_ina_Pandora')
                        if pandora then pandora:calculate_joker({ina_destruction = true}) end
                        return true
                    end
                }))
                destroyed_count = destroyed_count + 1
            end
        end

        if destroyed_count > 0 then
            return {
                chip_mod = destroyed_count * card.ability.extra.chips_per_destroyed,
                message = localize { type = 'variable', key = 'a_chips', vars = { destroyed_count * card.ability.extra.chips_per_destroyed } }
            }
        end
    end
  end
})

return {
  name = "Tormenta de Géminis",
  list = { Galileo, Coral, Gigs, Ganymede, Charon, Pandora, Io, Rihm, Janus, Diam }
}
