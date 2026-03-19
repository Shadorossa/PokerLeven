-- David Samford
local SamfordR = J({
  name = "SamfordR",
  pos = { x = 6, y = 7 },
  config = { extra = { xmult_mod = 1, current_xmult = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.xmult_mod, center.ability.extra.current_xmult } }
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 8,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        local discards = G.GAME.current_round.discards_left
        if discards > 0 then
            card.ability.extra.current_xmult = discards * card.ability.extra.xmult_mod
            G.E_MANAGER:add_event(Event({func = function()
                ease_discard(-discards, nil, true)
                return true 
            end }))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "X" .. card.ability.extra.current_xmult .. " Mult!", colour = G.C.MULT})
        else
            card.ability.extra.current_xmult = 1
        end
    end
    if context.joker_main and context.scoring_hand then
        if card.ability.extra.current_xmult > 1 then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.current_xmult}},
                Xmult_mod = card.ability.extra.current_xmult
            }
        end
    end
  end
})

return {
    name = "Royal Redux",
    list = { SamfordR }
}
