-- Hood
local Hood = J({
    name = "Hood",
    pos = { x = 9, y = 8 },
    config = {
        extra = {
            xmult_mod = 0.6,
            triggered = false,
            pposition = "GK"
        }
    },
    loc_vars = function(self, info_queue, center)
        local count = #find_player_position("GK")
        return { vars = { center.ability.extra.xmult_mod, count * (center.ability.extra.xmult_mod or 0) + 1 } }
    end,
    rarity = 2,
    pools = { ["ina_team_Shuriken"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Forest,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    pdorsal = 1,
    pteam = "ina_team_Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.cardarea == G.jokers and ctx.scoring_hand and ctx.joker_main then
            local count = #find_player_position("GK")
            local total_xmult = count * card.ability.extra.xmult_mod + 1
            card.ability.extra.triggered = true
            return {
                message = localize { type = 'variable', key = 'a_xmult', vars = { total_xmult } },
                colour = G.C.XMULT,
                Xmult_mod = total_xmult
            }
        end
    end
})

-- Crackshot
local Crackshot = J({
  name = "Crackshot",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 2,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Hillfort
local Hillfort = J({
    name = "Hillfort",
    pos = { x = 11, y = 8 },
    config = { extra = { triggered = false, chips_mod = 1, current_chips = 0, dollars_needed = 1 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.chips_mod, center.ability.extra.dollars_needed, center.ability.extra.current_chips } }
    end,
    rarity = 1,
    pools = { ["ina_team_Shuriken"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.DF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 3,
    pteam = "ina_team_Shuriken",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            local wind_players = find_player_type(C.Wind)
            if #wind_players > 0 then
                local chips_mod = card.ability.extra.chips_mod * Pokerleven.calculate_total_sell_cost(wind_players)
                card.ability.extra.current_chips = card.ability.extra.current_chips + chips_mod
                return {
                    message = localize('k_upgrade_ex'),
                    colour = G.C.CHIPS
                }
            end
        end
        if Pokerleven.is_joker_turn(context) and
            card.ability.extra.current_chips > 0 then
            return {
                chips = card.ability.extra.current_chips
            }
        end
    end
})

-- Thunder
local Thunder = J({
  name = "Thunder",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 4,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Bandit
local Bandit = J({
  name = "Bandit",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 5,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Code
local Code = J({
    name = "Code",
    pos = { x = 1, y = 9 },
    config = { extra = { { triggered = false } } },
    rarity = 2,
    pools = { ["ina_team_Shuriken"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Mountain,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 6,
    pteam = "ina_team_Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.hand
            and context.other_card
            and SMODS.has_enhancement(context.other_card, 'm_gold') then
            card.ability.extra.triggered = true
      local count = #find_player_team("ina_team_Shuriken")
            return {
                message = localize('k_again_ex'),
                repetitions = count,
                card = card
            }
        end
    end
})

-- Star
local Star = J({
    name = "Star",
    pos = { x = 2, y = 9 },
    config = { extra = { mult_mod_low = 1, money = 1, suit = "Diamonds", triggered = false } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.money, center.ability.extra.mult_mod_low } }
    end,
    rarity = 1,
    pools = { ["ina_team_Shuriken"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 7,
    pteam = "ina_team_Shuriken",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit(card.ability.extra.suit) then
            if context.scoring_hand then
                card.ability.extra.triggered = true
                return {
                    message = localize("ina_dribbling"),
                    colour = G.C.DARK_EDITION,
                    mult_mod = card.ability.extra.mult_mod_low,
                    dollars = card.ability.extra.money,
                    card = card
                }
            end
        end
    end
})

-- Cleats
local Cleats = J({
    name = "Cleats",
    pos = { x = 3, y = 9 },
    config = {},
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["ina_team_Shuriken"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pdorsal = 8,
    pteam = "ina_team_Shuriken",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            local right_joker = card:get_right_joker()
            if right_joker then
                local selected_joker =
                    get_random_joker_key("Cleats", right_joker.config.center.rarity, nil, nil, nil, false)
                return {
                    message = ina_evolve(right_joker, selected_joker)
                }
            end
        end
    end,
    ina_credits = {
        idea = { 'LegendaryAd' }
    }
})

-- Samurai
local Samurai = J({
  name = "Samurai",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 9,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Hattori
local Hattori = J({
  name = "Hattori",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 10,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Cloak
local Cloak = J({
    name = "Cloak",
    pos = { x = 6, y = 9 },
    atlas = "Jokers01",
    rarity = 3,
    cost = 8,
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 11,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_Shuriken",
    pools = { ["ina_team_Shuriken"] = true },
    blueprint_compat = true,
    config = {
        extra = {
            barriers = 5,
            perish_tally = 1
        }
    },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Frontal' }
        return {
            key = (center.ability.extra.tech_level or 0) < 5 and 'j_ina_Cloak' or 'j_ina_Cloak_inf',
            vars = { center.ability.extra.barriers, center.ability.extra.perish_tally }
        }
    end,
    calculate = function(self, card, context)
        if card:has_enough_barriers() and (function(c, ctx) return c:is_leftmost_joker() and ctx.setting_blind and #G.jokers.cards > 1 end)(card, context) then
            local function generate_cloak_card(perish_tally, tech_level)
                local joker_index = pseudorandom("Cloak", 2, #G.jokers.cards)
                local new_joker = copy_card(G.jokers.cards[joker_index])
                if tech_level ~= 5 then
                    new_joker.ability.perishable = true
                    new_joker.ability.perish_tally = perish_tally
                end
                new_joker:set_edition('e_negative')
                return new_joker
            end
            local new_joker = generate_cloak_card(
                card.ability.extra.perish_tally, card.ability.extra.tech_level or 0)
            Pokerleven.add_card_to_jokers(new_joker)
            Pokerleven.ease_barriers(-card.ability.extra.barriers)
        end
    end,
    ina_credits = {
        idea = { "Shadorossa" }
    }
})

-- Hattori (Original con lógica) - NOTA: El Hattori de dorsal 10 es placeholder, el original se llamaba Hattori en el archivo. 
-- El usuario dice Hattori dorsal 10. Pero el archivo tenía una lógica compleja para Hattori. 
-- Re-leyendo: Hattori es dorsal 10. Mantendré la lógica compleja para el dorsal 10.

-- Hattori
local Hattori_Logic = J({
    name = "Hattori",
    pos = { x = 5, y = 9 },
    config = { extra = { copies_number = 2 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.copies_number } }
    end,
    rarity = 2,
    pools = { ["ina_team_Shuriken"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Forest,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 10,
    pteam = "ina_team_Shuriken",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.GAME.joker_buffer = 0

                    for _ = 1, card.ability.extra.copies_number do
                        local create_args = {
                            set = 'Joker',
                            key = 'j_ina_Hattori',
                            edition = 'e_negative'
                        }
                        local _card = SMODS.create_card(create_args)
                        _card:add_to_deck()
                        _card.can_sell_card = function(self_inner, context_inner)
                            return false
                        end

                        _card.calculate_joker = function(self_inner, context_inner)
                            if context_inner.end_of_round and context_inner.main_eval then
                                self_inner:start_dissolve({ HEX("57ecab") }, nil, 1.6)
                                self_inner:remove_from_deck()
                            end
                        end
                        _card.can_calculate = function()
                            return true
                        end

                        G.jokers:emplace(_card)
                    end
                    return true
                end
            }))
        end
    end,
    ina_credits = {
        idea = { "LegendaryAd" }
    }
})

-- Castle
local Castle = J({
  name = "Castle",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 12,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Ronin
local Ronin = J({
  name = "Ronin",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 13,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Hopper
local Hopper = J({
  name = "Hopper",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 14,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Trops
local Trops = J({
  name = "Trops",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 15,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

-- Spook
local Spook = J({
  name = "Spook",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Shuriken"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 16,
  pteam = "ina_team_Shuriken",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

return {
    name = "Shuriken",
    list = { Hood, Hillfort, Code, Star, Cleats, Hattori_Logic, Cloak },
}
