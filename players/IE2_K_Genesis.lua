-- Nero
local Nero = J({
  name = "Nero",
  pos = { x = 12, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gele
local Gele = J({
  name = "Gele",
  pos = { x = 0, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kiburn
local Kiburn = J({
  name = "Kiburn",
  pos = { x = 1, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zohen
local Zohen = J({
  name = "Zohen",
  pos = { x = 2, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hauser
local Hauser = J({
  name = "Hauser",
  pos = { x = 3, y = 12 },
  config = { extra = { barriers_consumed = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.barriers_consumed } }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.joker_main and not ctx.blueprint then
        if (G.GAME.current_round.barriers or 0) >= card.ability.extra.barriers_consumed then
            local cards_in_hand = {}
            for _, c in ipairs(G.hand.cards) do if not c.highlighted and c.config.center == G.P_CENTERS.c_base then table.insert(cards_in_hand, c) end end
            
            if #cards_in_hand > 0 then
                Pokerleven.ease_barriers(-card.ability.extra.barriers_consumed)
                local target = cards_in_hand[math.random(#cards_in_hand)]
                target:set_ability(G.P_CENTERS.m_stone)
                target:juice_up()
                return { message = localize('k_stone'), colour = G.C.GREY }
            end
        end
    end
  end
})

-- Kormer
local Kormer = J({
  name = "Kormer",
  pos = { x = 4, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kiwill
local Kiwill = J({
  name = "Kiwill",
  pos = { x = 5, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ark
local Ark = J({
  name = "Ark",
  pos = { x = 6, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Wittz
local Wittz = J({
  name = "Wittz",
  pos = { x = 7, y = 12 },
  config = { extra = { min_cards = 5, odds = 3 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.min_cards, G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
  end,
  rarity = 2,
  pools = { ["Genesis"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.before and not ctx.blueprint and #ctx.scoring_hand >= card.ability.extra.min_cards then
        for _, oc in ipairs(ctx.scoring_hand) do
            local type = math.random(1, 2)
            if type == 1 then
                local eds = {'foil', 'holo', 'polychrome'}
                oc:set_edition({[eds[math.random(#eds)]] = true}, true)
            else
                local seals = {'Gold', 'Red', 'Blue', 'Purple'}
                oc:set_seal(seals[math.random(#seals)], true)
            end
        end
        return { message = localize('k_upgrade_ex'), colour = G.C.DARK_EDITION }
    elseif ctx.after and not ctx.blueprint and #ctx.scoring_hand >= card.ability.extra.min_cards then
        local destroyed_any = false
        for _, oc in ipairs(ctx.scoring_hand) do
            if card:odds_triggered('wittz') then
                oc:start_dissolve()
                destroyed_any = true
            end
        end
        if destroyed_any then return { message = localize('k_dest_ex'), colour = G.C.RED } end
    end
  end
})

-- Bellatrix
local Bellatrix = J({
  name = "Bellatrix",
  pos = { x = 8, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Xene
local Xene = J({
  name = "Xene",
  pos = { x = 9, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Genesis"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Genesis",
  list = { Hauser, Wittz }
}
