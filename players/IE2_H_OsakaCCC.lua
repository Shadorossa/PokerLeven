-- Daisy
local Daisy = J({
  name = "Daisy Fields",
  pos = { x = 5, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 1,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sand
local Sand = J({
  name = "Alexia Sand",
  pos = { x = 6, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 2,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Earth
local Earth = J({
  name = "Hellen Hearth",
  pos = { x = 7, y = 7 },
  config = { extra = { chance_per_female = 5 } },
  calculate = function(self, card, context)
    if context.using_consumeable and not context.blueprint then
      if context.consumeable.ability.set == 'Tarot' then
        local female_count = 0
        for _, j in ipairs(G.jokers.cards) do
          if j.config.center.pgender == C.F then female_count = female_count + 1 end
        end
        
        local total_chance = female_count * card.ability.extra.chance_per_female
        if pseudorandom('hellen_hearth') < total_chance / 100 then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    local new_card = copy_card(context.consumeable, nil)
                    new_card:add_to_deck()
                    G.consumeables:emplace(new_card)
                    return true
                end
            }))
            return {
                message = "¡Femme Fatale!",
                colour = G.C.PURPLE
            }
        end
      end
    end
  end,
  loc_vars = function(self, info_queue, card)
    local female_count = 0
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            if j.config.center.pgender == C.F then female_count = female_count + 1 end
        end
    end
    return { vars = { card.ability.extra.chance_per_female, female_count * card.ability.extra.chance_per_female } }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 3,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true
})

-- Pinkpetal
local Pinkpetal = J({
  name = "Rose Pinkpetal",
  pos = { x = 8, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 4,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Greenland
local Greenland = J({
  name = "Esther Greenland",
  pos = { x = 9, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 5,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bluebells
local Bluebells = J({
  name = "Bela Bluebells",
  pos = { x = 10, y = 7 },
  config = { extra = { chance = 6 } },
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.bluebells_triggered then
        G.GAME.bluebells_triggered = false
        return {
            message = "¡Sorpresa!",
            colour = G.C.FILTER
        }
    end
  end,
  loc_vars = function(self, info_queue, card)
    return { vars = { G.GAME.probabilities.normal or 1, card.ability.extra.chance } }
  end,
  rarity = 2,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 6,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true
})

-- Sunrise
local Sunrise = J({
  name = "Natalie Sunrise",
  pos = { x = 11, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 7,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bush
local Bush = J({
  name = "Hillary Bush",
  pos = { x = 12, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 8,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Moor
local Moor = J({
  name = "Mary Moor",
  pos = { x = 0, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 9,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sue
local Sue = J({
  name = "Suzette Hartland",
  pos = { x = 1, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 10,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Willow
local Willow = J({
  name = "Lily Willow",
  pos = { x = 2, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 11,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Closeout
local Closeout = J({
  name = "Dell Closeout",
  pos = { x = 3, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 12,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Spires
local Spires = J({
  name = "Amy Spires",
  pos = { x = 4, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 13,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Cash
local Cash = J({
  name = "Peony Cash",
  pos = { x = 5, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 14,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Revel
local Revel = J({
  name = "Gayle Revel",
  pos = { x = 6, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 15,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Brook
local Brook = J({
  name = "Janine Brook",
  pos = { x = 7, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Osaka CCC"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 16,
  pteam = "ina_team_OsakaCCC",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Osaka CCC",
  list = { Earth, Bluebells }
}
