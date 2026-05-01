local Atlas = "Jokers02"
local team_id = "ina_team_Fauxshore"

-- Darren
local Darren = J({
  name = "Darren",
  pos = { x = 11, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 3,
  pools = { ["Fauxshore"] = true },
  cost = 8,
  atlas = Atlas,
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 1,
  pcaptain = C.CAPTAIN,
  pyear = C.YEAR_1,
  pteam = team_id,
  blueprint_compat = true,
  calculate = function(self, card, context) end
})

-- Fake
local Fake = J({
  name = "Fake",
  pos = { x = 6, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Fauxshore"] = true },
  cost = 6,
  atlas = Atlas,
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 2,
  pyear = C.YEAR_2,
  pteam = team_id,
  blueprint_compat = false,
  calculate = function(self, card, context)
    -- Regla de Oro
    if card.area ~= G.jokers then return end

    -- Lógica de eliminación de Fakes al final de la ronda
    if context.end_of_round and not context.blueprint and not context.repetition then
        for i = #G.jokers.cards, 1, -1 do
            local j = G.jokers.cards[i]
            if j.ability.is_fake_copy then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        j:start_dissolve()
                        return true
                    end
                }))
            end
        end
    end

    -- Detectar cuando se añade un Joker al deck
    if (context.buying_card or context.open_booster or context.skipping_blind) and context.card and context.card.ability and context.card.config.center.set == 'Joker' and context.card ~= card then
        if not context.card.ability.is_fake_copy then
            local card_to_copy = context.card
            G.E_MANAGER:add_event(Event({
                func = function()
                    local copy = copy_card(card_to_copy, nil, nil, nil, nil)
                    copy.ability.is_fake_copy = true
                    copy:set_edition('e_negative', true)
                    copy.ability.cannot_sell = true
                    copy:add_to_deck()
                    G.jokers:emplace(copy)
                    card:juice_up(0.6, 0.6)
                    return true
                end
            }))
        end
    end
  end
})

-- Mishap
local Mishap = J({
  name = "Mishap",
  pos = { x = 7, y = 9 },
  rarity = 1,
  pools = { ["Fauxshore"] = true },
  cost = 4,
  atlas = Atlas,
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 3,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Leave
local Leave = J({
  name = "Leave",
  pos = { x = 8, y = 9 },
  config = { extra = { count = 0 } },
  loc_vars = function(self, info_queue, center)
    local data = center.ability.extra
    return { vars = { (5 - data.count) } }
  end,
  rarity = 2,
  pools = { ["Fauxshore"] = true },
  cost = 6,
  atlas = Atlas,
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 4,
  pyear = C.YEAR_2,
  pteam = team_id,
  blueprint_compat = false,
  calculate = function(self, card, context)
    if card.area ~= G.jokers then return end
    
    local data = card.ability.extra
    
    if context.end_of_round and not context.blueprint and not context.repetition then
        -- Avanzar contadores de préstamos globales
        G.GAME.ina_louis_loans = G.GAME.ina_louis_loans or {}
        for i = #G.GAME.ina_louis_loans, 1, -1 do
            local loan = G.GAME.ina_louis_loans[i]
            loan.timer = loan.timer - 1
            
            local target = nil
            for _, j in ipairs(G.jokers.cards) do
                if j.unique_val == loan.target_id then target = j break end
            end
            
            if loan.timer <= 0 or not target then
                if target then
                    if loan.old_ed == 'none' then target.edition = nil else target:set_edition(loan.old_ed, true) end
                end
                table.remove(G.GAME.ina_louis_loans, i)
            end
        end

        -- Contador propio
        data.count = data.count + 1
        if data.count >= 5 then
            local targets = {}
            for _, j in ipairs(G.jokers.cards) do
                if j ~= card and not j.edition then table.insert(targets, j) end
            end
            if #targets == 0 then
                for _, j in ipairs(G.jokers.cards) do if j ~= card then table.insert(targets, j) end end
            end

            if #targets > 0 then
                local chosen = pseudorandom_element(targets, pseudoseed('louis_leave'))
                G.GAME.ina_louis_loans = G.GAME.ina_louis_loans or {}
                table.insert(G.GAME.ina_louis_loans, {
                    target_id = chosen.unique_val,
                    old_ed = (chosen.edition and chosen.edition.type) or 'none',
                    timer = 10
                })
                chosen:set_edition('e_negative', true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card_eval_status_text(card, 'extra', nil, nil, nil, {message = "¡Mi trabajo aquí ha terminado!", color = G.C.FILTER})
                        card:start_dissolve()
                        return true
                    end
                }))
            else
                data.count = 4
            end
        end
    end
  end
})

-- Badgame
local Badgame = J({
  name = "Badgame",
  pos = { x = 0, y = 10 },
  rarity = 1,
  pools = { ["Fauxshore"] = true },
  cost = 4,
  atlas = Atlas,
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 5,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Random
local Random = J({
  name = "Random",
  pos = { x = 1, y = 10 },
  rarity = 1,
  pools = { ["Fauxshore"] = true },
  cost = 5,
  atlas = Atlas,
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 6,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Richmen
local Richmen = J({
  name = "Richmen",
  pos = { x = 2, y = 10 },
  rarity = 1,
  pools = { ["Fauxshore"] = true },
  cost = 5,
  atlas = Atlas,
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 7,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Fate
local Fate = J({
  name = "Fate",
  pos = { x = 12, y = 9 },
  rarity = 3,
  pools = { ["Fauxshore"] = true },
  cost = 8,
  atlas = Atlas,
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 8,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Destiny
local Destiny = J({
  name = "Destiny",
  pos = { x = 3, y = 10 },
  rarity = 2,
  pools = { ["Fauxshore"] = true },
  cost = 6,
  atlas = Atlas,
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 8,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Duskplay
local Duskplay = J({
  name = "Duskplay",
  pos = { x = 4, y = 10 },
  rarity = 2,
  pools = { ["Fauxshore"] = true },
  cost = 6,
  atlas = Atlas,
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 9,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Luckyman
local Luckyman = J({
  name = "Luckyman",
  pos = { x = 5, y = 10 },
  rarity = 3,
  pools = { ["Fauxshore"] = true },
  cost = 8,
  atlas = Atlas,
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 10,
  pcaptain = C.CAPTAIN,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Poker
local Poker = J({
  name = "Poker",
  pos = { x = 6, y = 10 },
  rarity = 2,
  pools = { ["Fauxshore"] = true },
  cost = 6,
  atlas = Atlas,
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 11,
  pyear = C.YEAR_2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- Cracker
local Cracker = J({ name = "Cracker", pos = { x = 7, y = 10 }, rarity = 1, pools = { ["Fauxshore"] = true }, cost = 4, atlas = Atlas, ptype = C.Fire, pposition = C.GK, pgender = C.M, pnation = C.JAPAN, pdorsal = 12, pyear = C.YEAR_2, pteam = team_id, calculate = function(self, card, context) end })
local Failing = J({ name = "Failing", pos = { x = 8, y = 10 }, rarity = 1, pools = { ["Fauxshore"] = true }, cost = 5, atlas = Atlas, ptype = C.Forest, pposition = C.FW, pgender = C.M, pnation = C.JAPAN, pdorsal = 13, pyear = C.YEAR_2, pteam = team_id, calculate = function(self, card, context) end })
local Cotts = J({ name = "Cotts", pos = { x = 9, y = 10 }, rarity = 1, pools = { ["Fauxshore"] = true }, cost = 5, atlas = Atlas, ptype = C.Mountain, pposition = C.MF, pgender = C.M, pnation = C.JAPAN, pdorsal = 14, pyear = C.YEAR_2, pteam = team_id, calculate = function(self, card, context) end })
local Passing = J({ name = "Passing", pos = { x = 10, y = 10 }, rarity = 1, pools = { ["Fauxshore"] = true }, cost = 5, atlas = Atlas, ptype = C.Wind, pposition = C.FW, pgender = C.M, pnation = C.JAPAN, pdorsal = 15, pyear = C.YEAR_2, pteam = team_id, calculate = function(self, card, context) end })
local Bathers = J({ name = "Bathers", pos = { x = 11, y = 10 }, rarity = 1, pools = { ["Fauxshore"] = true }, cost = 4, atlas = Atlas, ptype = C.Wind, pposition = C.GK, pgender = C.M, pnation = C.JAPAN, pdorsal = 16, pyear = C.YEAR_2, pteam = team_id, calculate = function(self, card, context) end })

return {
  name = "Fauxshore",
  list = {
    Fake, Leave
  }
}
