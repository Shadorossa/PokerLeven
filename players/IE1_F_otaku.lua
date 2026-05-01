-- Idol
local Idol = J({
    name = "Idol",
    pos = { x = 3, y = 6 },
    config = { extra = { odds2 = 2, retrigger_count = 1, triggered = false } },
    loc_vars = function(self, info_queue, center)
        return { vars = { G.GAME.probabilities.normal, center.ability.extra.odds2 } }
    end,
    rarity = 1,
    pools = { ["ina_team_Otaku"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Mountain,
    pposition = C.GK,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 1,
    pteam = "ina_team_Otaku",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.repetition and context.scoring_hand and context.other_card then
            if context.other_card:get_id() == 4
                and pseudorandom('Idol') < G.GAME.probabilities.normal / card.ability.extra.odds2 then
                card.ability.extra.triggered = true
                return {
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.retrigger_count,
                    card = context.other_card
                }
            end
        end
    end,
    ina_credits = {
        idea = { 'LegendaryAd' }
    }
})

-- Train
local Train = J({
  name = "Train",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 2,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Novel
local Novel = J({
  name = "Novel",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 3,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Hero
local Hero = J({
    name = "Hero",
    pos = { x = 6, y = 6 },
    config = { extra = { triggered = false } },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 1,
    pools = { ["ina_team_Otaku"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Fire,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 4,
    pteam = "ina_team_Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.play and context.individual and context.other_card then
            if context.other_card:get_id() == 11 or context.other_card:get_id() == 12 or context.other_card:get_id() == 13 then
                card.ability.extra.triggered = true
                convert_cards_to(context.other_card, { set_rank = "4" }, false, false)
                return {
                    message = localize("ina_convert"),
                    colour = G.C.XMULT,
                    card = context.other_card,
                }
            end
        end
    end,
    ina_credits = {
        idea = { "LegendaryAd" }
    }
})

-- Cosplay
local Cosplay = J({
  name = "Cosplay",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 5,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Online
local Online = J({
  name = "Online",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 6,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Custom
local Custom = J({
    name = "Custom",
    pos = { x = 9, y = 6 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["ina_team_Otaku"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 7,
    pteam = "ina_team_Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
    end
})

-- Robot
local Robot = J({
    name = "Robot",
    pos = { x = 10, y = 6 },
    config = { extra = { retrigger_count = 1, triggered = false } },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 2,
    pools = { ["ina_team_Otaku"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.MF,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_1,
    pdorsal = 8,
    pteam = "ina_team_Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and next(context.poker_hands['Straight']) then
            for pos, joker in ipairs(G.jokers.cards) do
                if is_position(joker, "MF") then
                    if context.other_card == context.scoring_hand[pos]
                        and SMODS.has_enhancement(context.other_card, 'm_lucky') then
                        joker.ability.extra.triggered = true
                        return {
                            message = localize('k_again_ex'),
                            repetitions = card.ability.extra.retrigger_count,
                            card = context.other_card
                        }
                    end
                end
            end
        end
    end
})

-- Gamer
local Gamer = J({
    name = "Gamer",
    pos = { x = 11, y = 6 },
    config = { extra = { triggered = false } },
    loc_vars = function(self, info_queue, center)
    local otaku_count = #find_player_team("ina_team_Otaku")
        local fps = love.timer.getFPS()
        if fps > 144 then
            fps = 144
        end
        return { vars = { otaku_count > 1 and fps or fps / 2 } }
    end,
    rarity = 1,
    pools = { ["ina_team_Otaku"] = true },
    cost = 5,
    atlas = "Jokers01",
    ptype = C.Fire,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 9,
    pteam = "ina_team_Otaku",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.scoring_hand and context.joker_main then
            local fps = love.timer.getFPS()
      local otaku_count = #find_player_team("ina_team_Otaku")
            card.ability.extra.triggered = true

            if fps > 144 then
                fps = 144
            end
            return {
                message = fps .. " FPS!",
                chip_mod = otaku_count > 1 and fps or fps / 2,
                colour = G.C.DARK_EDITION,
            }
        end
    end
})

-- Artist
local Artist = J({
    name = "Artist",
    pos = { x = 12, y = 6 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        return {}
    end,
    rarity = 3,
    pools = { ["ina_team_Otaku"] = true },
    cost = 8,
    atlas = "Jokers01",
    ptype = C.Wind,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_2,
    pdorsal = 10,
    pcaptain = C.CAPTAIN,
    pteam = "ina_team_Otaku",
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            local hasQueen = false
            local hasKing = false
            for i, c in ipairs(context.scoring_hand) do
                if c:get_id() == 12 then
                    hasQueen = true
                end
                if c:get_id() == 13 then
                    hasKing = true
                end
            end

            if (hasQueen and hasKing) then
                convert_cards_to(context.scoring_hand, { mod_conv = "m_lucky" })
                card.ability.extra.triggered = true
                return {
                    message = localize("ina_convert"),
                    colour = G.C.XMULT,
                }
            end
        end
    end,
    ina_credits = {
        idea = { "Shadorossa" }
    }
})

-- Arcade
local Arcade = J({
    name = "Arcade",
    pos = { x = 0, y = 7 },
    config = { extra = { new_lucky = 5, minus_dollars = -2, triggered = false } },
    loc_vars = function(self, info_queue, center)
        return { vars = { G.GAME.probabilities.new_lucky or center.ability.extra.new_lucky, center.ability.extra.minus_dollars } }
    end,
    rarity = 2,
    pools = { ["ina_team_Otaku"] = true },
    cost = 7,
    atlas = "Jokers01",
    ptype = C.Forest,
    pposition = C.FW,
    pgender = C.M,
    pnation = C.JAPAN,
    pyear = C.YEAR_3,
    pdorsal = 11,
    pteam = "ina_team_Otaku",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return {
                    dollars = card.ability.extra.minus_dollars,
                    colour = G.C.MONEY
                }
            end
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.probabilities.new_lucky = (G.GAME.probabilities.new_lucky or 0) + card.ability.extra.new_lucky
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.probabilities.new_lucky = nil
    end,
    ina_credits = {
        idea = { "Shadorossa" }
    }
})

-- Eldorado
local Eldorado = J({
  name = "Eldorado",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 12,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Signalman
local Signalman = J({
  name = "Signalman",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 13,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Formby
local Formby = J({
  name = "Formby",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 14,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Vox
local Vox = J({
  name = "Vox",
  pos = { x = 4, y = 7 },
  config = { extra = { chip_mod = 30, triggered = false } },
  loc_vars = function(self, info_queue, center)
    table.insert(info_queue, { set = 'Other', key = 'Right_Footed' })
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 15,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.joker_main and context.scoring_hand and card:is_rightmost_joker() then
      local count = Pokerleven.get_jokers_to_the_left(card)
      if count > 0 then
        return {
          message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip_mod * count } },
          colour = G.C.CHIPS,
          chip_mod = card.ability.extra.chip_mod * count,
        }
      end
    end
  end,
  ina_credits = {
    idea = { "Lovahi" }
  }
})

-- Net
local Net = J({
  name = "Net",
  pos = { x = 0, y = 0 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_Otaku"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 16,
  pteam = "ina_team_Otaku",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
    name = "Otaku",
    list = { Idol, Hero, Robot, Gamer, Artist, Arcade, Vox }
}
