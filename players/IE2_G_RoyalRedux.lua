-- Joseph King
local KingR = {
  name = "KingR",
  pos = { x = 9, y = 6 },
  config = { extra = { barriers = 2, chip_mod = 100, hands_lost = 1 } },
  loc_vars = function(self, info_queue, center)
    local max_hands = G.GAME and G.GAME.round_resets and G.GAME.round_resets.hands or 1
    return { vars = { center.ability.extra.barriers, center.ability.extra.chip_mod, center.ability.extra.hands_lost, center.ability.extra.chip_mod * max_hands } }
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        Pokerleven.ease_barriers(card.ability.extra.barriers)
    end
    if context.joker_main and context.scoring_hand then
        local chips = card.ability.extra.chip_mod * G.GAME.round_resets.hands
        return {
            message = localize{type='variable',key='a_chips',vars={chips}},
            chip_mod = chips,
            colour = G.C.CHIPS
        }
    end
    if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
        if G.GAME.blind.boss then
            G.GAME.round_resets.hands = math.max(1, G.GAME.round_resets.hands - card.ability.extra.hands_lost)
            ease_hands_played(-card.ability.extra.hands_lost)
            return {
                message = "-" .. card.ability.extra.hands_lost .. " Mano" .. (card.ability.extra.hands_lost > 1 and "s" or ""),
                colour = G.C.RED
            }
        end
    end
  end
}

return {
    name = "Royal Redux",
    list = { KingR }
    -- list = { Beltzer, Blade, Argie, Bamboo, Messer, Spark, Sparrow, Jamm, CalebR, SamfordR, Cellar, Zenn, Little, Cosimo, Color },
}
