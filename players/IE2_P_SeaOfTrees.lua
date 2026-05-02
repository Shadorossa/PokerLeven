local Atlas = "Jokers02"
local team_id = "ina_team_SeaOfTrees"

-- 1. Mando
local Mando = J({
  name = "Mando",
  pos = { x = 2, y = 15 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 1,
  pcaptain = C.CAPTAIN,
  pteam = team_id,
  config = { extra = { chips_per_element = 100, max_chips = 500 } },
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.hands_played == 0 then
      local elements = {}
      local count = 0
      for _, j in ipairs(G.jokers.cards) do
        if j.config.center.ptype and not elements[j.config.center.ptype] then
          elements[j.config.center.ptype] = true
          count = count + 1
        end
      end
      
      local total_chips = math.min(count * card.ability.extra.chips_per_element, card.ability.extra.max_chips)
      return {
        message = localize{type='variable',key='a_chips',vars={total_chips}},
        chip_mod = total_chips,
        colour = G.C.CHIPS
      }
    end
  end,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.chips_per_element, card.ability.extra.max_chips } }
  end
})

-- 2. Boufante
local Boufante = J({
  name = "Boufante",
  pos = { x = 3, y = 15 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 2,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 3. Stuhl
local Stuhl = J({
  name = "Stuhl",
  pos = { x = 4, y = 15 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 3,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 4. Blewit
local Blewit = J({
  name = "Blewit",
  pos = { x = 5, y = 15 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 4,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 5. Oregon
local Oregon = J({
  name = "Oregon",
  pos = { x = 6, y = 15 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 5,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 6. Cypress
local Cypress = J({
  name = "Cypress",
  pos = { x = 7, y = 15 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 6,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 7. Deathcap
local Deathcap = J({
  name = "Deathcap",
  pos = { x = 8, y = 15 },
  rarity = 2,
  pools = { ["Sea of Trees"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 7,
  pteam = team_id,
  config = { extra = { base_chips = 0, chips_per_club = 4 } },
  calculate = function(self, card, context)
    if context.joker_main then
        local mult = math.max(1, 2 ^ G.GAME.hands_played)
        local total_chips = card.ability.extra.base_chips * mult
        return {
            message = localize{type='variable',key='a_chips',vars={total_chips}},
            chip_mod = total_chips,
            colour = G.C.CHIPS
        }
    end
  end,
  loc_vars = function(self, info_queue, card)
    local mult = math.max(1, 2 ^ G.GAME.hands_played)
    return { vars = { card.ability.extra.base_chips, card.ability.extra.chips_per_club, mult } }
  end
})

-- 8. Faithfull
local Faithfull = J({
  name = "Faithfull",
  pos = { x = 9, y = 15 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 8,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 9. Ticker
local Ticker = J({
  name = "Ticker",
  pos = { x = 10, y = 15 },
  rarity = 2,
  pools = { ["Sea of Trees"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 9,
  pteam = team_id,
  config = { extra = { last_sum = 0 } },
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_hand then
      local current_sum = 0
      for _, c in ipairs(context.scoring_hand) do
        current_sum = current_sum + c:get_id()
      end
      
      local trigger = (card.ability.extra.last_sum > 0 and current_sum == card.ability.extra.last_sum)
      card.ability.extra.last_sum = current_sum
      
      if trigger and #G.consumeables.cards < G.consumeables.config.card_limit then
        return {
          message = "¡Sincronía!",
          card = SMODS.add_card{set = 'Tarot', area = G.consumeables}
        }
      end
    end
  end,
  loc_vars = function(self, info_queue, card)
    return { vars = { card.ability.extra.last_sum } }
  end
})

-- 10. Daring
local Daring = J({
  name = "Daring",
  pos = { x = 11, y = 15 },
  rarity = 1,
  pools = { ["Sea of Trees"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 10,
  pteam = team_id,
  calculate = function(self, card, context) end
})

-- 11. Enoki
local Enoki = J({
  name = "Enoki",
  pos = { x = 12, y = 15 },
  rarity = 3,
  pools = { ["Sea of Trees"] = true },
  cost = 10,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pdorsal = 11,
  pteam = team_id,
  config = { extra = { copied_key = nil } },
  calculate = function(self, card, context)
    -- Select random joker at start of blind
    if context.setting_blind and not context.blueprint then
        local pool = {}
        for k, v in pairs(G.P_CENTERS) do
            if v.set == 'Joker' and k ~= card.config.center.key then
                table.insert(pool, k)
            end
        end
        card.ability.extra.copied_key = pool[math.random(#pool)]
    end

    if card.ability.extra.copied_key then
        local other_joker = G.P_CENTERS[card.ability.extra.copied_key]
        if other_joker and other_joker.calculate then
            -- We temporarily set the ability to match the other joker for its logic
            -- This is a bit advanced but should work for many jokers
            local original_ability = card.ability
            card.ability = other_joker.config -- Mock ability
            local res = other_joker:calculate(card, context)
            card.ability = original_ability -- Restore
            if res then 
                res.message = "¡Metrónomo!"
                return res 
            end
        end
    end
  end,
  loc_vars = function(self, info_queue, card)
    local name = "Ninguno"
    if card.ability.extra.copied_key then
        local other = G.P_CENTERS[card.ability.extra.copied_key]
        if other then
            name = other.name
            info_queue[#info_queue + 1] = other
        end
    end
    return { vars = { name } }
  end
})

return {
  name = "Sea of Trees",
  list = { Mando, Deathcap, Ticker, Enoki }
}
