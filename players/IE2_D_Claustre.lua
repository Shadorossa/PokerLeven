
-- Scotty
local Scotty = J({
  name = "Scotty",
  pos = { x = 6, y = 4 },
  config = { extra = { chips = 50, odds = 4 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chips, G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Claustro Sagrado"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Claustro Sagrado",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if Pokerleven.is_joker_turn(ctx) then
        return {message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}, chip_mod = card.ability.extra.chips, colour = G.C.CHIPS}
    elseif ctx.setting_blind and not ctx.blueprint then
        if pseudorandom('scotty') < G.GAME.probabilities.normal / card.ability.extra.odds then
            ina_evolve(card, 'j_ina_Scotty_Angry')
        end
    end
  end
})

local Scotty_Angry = J({
  name = "Scotty_Angry",
  pos = { x = 6, y = 4 },
  soul_pos = { x = 7, y = 4 },
  config = { extra = { chips = 100 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chips } }
  end,
  rarity = 2,
  pools = { ["Claustro Sagrado"] = false },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Claustro Sagrado",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if Pokerleven.is_joker_turn(ctx) then
        return {message = localize{type='variable',key='a_chips',vars={card.ability.extra.chips}}, chip_mod = card.ability.extra.chips, colour = G.C.CHIPS}
    elseif ctx.after and not ctx.blueprint then
        local lowest, lowest_id = nil, 15
        for _, c in ipairs(ctx.scoring_hand) do
            if c:get_id() < lowest_id and not c.destroyed then lowest, lowest_id = c, c:get_id() end
        end
        if lowest then
            if lowest.ability.name == 'Glass Card' then lowest.shattered = true; lowest:shatter()
            else lowest.destroyed = true; lowest:start_dissolve() end
            return {message = localize('ina_destroy'), colour = G.C.RED}
        end
    elseif Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
        ina_evolve(card, 'j_ina_Scotty')
    end
  end,
  custom_pool_func = true,
  in_pool = function() return false end
})

return {
    name = "Claustro Sagrado",
    list = { Scotty, Scotty_Angry }
}
