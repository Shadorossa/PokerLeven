-- Nero
local Nero = J({
  name = "Nero",
  pos = { x = 0, y = 5 },
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
  pdorsal = 1,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gele
local Gele = J({
  name = "Gele",
  pos = { x = 1, y = 5 },
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
  pdorsal = 2,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kiburn
local Kiburn = J({
  name = "Kiburn",
  pos = { x = 2, y = 5 },
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
  pdorsal = 3,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zohen
local Zohen = J({
  name = "Zohen",
  pos = { x = 3, y = 5 },
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
  pdorsal = 4,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hauser
local Hauser = J({
  name = "Hauser",
  pos = { x = 4, y = 5 },
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
  pdorsal = 5,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.joker_main and not ctx.blueprint then
        local stones = {}
        for _, c in ipairs(ctx.scoring_hand) do
            if SMODS.has_enhancement(c, 'm_stone') then
                table.insert(stones, c)
            end
        end
        
        local count = #stones
        if count >= 2 then
            local barriers_to_add = math.floor(count / 2)
            local stones_to_destroy = barriers_to_add * 2
            
            Pokerleven.ease_barriers(barriers_to_add)
            
            for i = 1, stones_to_destroy do
                stones[i]:start_dissolve()
            end
            
            return {
                message = "+"..barriers_to_add.." Barreras",
                colour = G.C.MOUNTAIN
            }
        end
    end
  end
})

-- Kormer
local Kormer = J({
  name = "Kormer",
  pos = { x = 5, y = 5 },
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
  pdorsal = 6,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kiwill
local Kiwill = J({
  name = "Kiwill",
  pos = { x = 6, y = 5 },
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
  pdorsal = 7,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ark
local Ark = J({
  name = "Ark",
  pos = { x = 7, y = 5 },
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
  pdorsal = 8,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Wittz
local Wittz = J({
  name = "Wittz",
  pos = { x = 8, y = 5 },
  config = { extra = { min_cards = 5 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.min_cards } }
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
  pdorsal = 9,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.before and not ctx.blueprint and #ctx.scoring_hand >= 5 then
        for _, oc in ipairs(ctx.scoring_hand) do
            local enhancements = {'m_bonus', 'm_mult', 'm_wild', 'm_glass', 'm_steel', 'm_stone', 'm_gold', 'm_lucky'}
            local enh = pseudorandom_element(enhancements, pseudoseed('wittz_enh'))
            oc:set_ability(G.P_CENTERS[enh])
            
            local editions = {'foil', 'holo', 'polychrome'}
            local ed = pseudorandom_element(editions, pseudoseed('wittz_ed'))
            oc:set_edition({[ed] = true}, true)
            
            local seals = {'Gold', 'Red', 'Blue', 'Purple'}
            local sl = pseudorandom_element(seals, pseudoseed('wittz_seal'))
            oc:set_seal(sl, true)
            
            oc:juice_up()
        end
        return { message = localize('k_upgrade_ex'), colour = G.C.DARK_EDITION }
    elseif ctx.after and not ctx.blueprint and #ctx.scoring_hand >= 5 then
        local cards_to_destroy = {}
        for _, v in ipairs(ctx.scoring_hand) do table.insert(cards_to_destroy, v) end
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 2.0,
            func = function()
                for _, oc in ipairs(cards_to_destroy) do
                    oc.destroyed = true
                    oc:start_dissolve({G.C.RED}, nil, 1.2)
                end
                return true
            end
        }))
        return { message = localize('k_dest_ex'), colour = G.C.RED }
    end
  end
})

-- Bellatrix
local Bellatrix = J({
  name = "Bellatrix",
  pos = { x = 9, y = 5 },
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
  pdorsal = 10,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Xene
local Xene = J({
  name = "Xene",
  pos = { x = 10, y = 5 },
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
  pdorsal = 11,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Genesis",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Genesis",
  list = { Hauser, Wittz }
}
