-- Caleb Stonewall
local CalebR = J({
  name = "CalebR",
  pos = { x = 5, y = 7 },
  config = { extra = { current_xmult = 1, xmult_gain = 0.5, buff_mod = 1.25 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.current_xmult, center.ability.extra.xmult_gain, (center.ability.extra.buff_mod - 1) * 100 } }
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 8,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        local destroyed_any = false
        local buffed_any = false
        
        if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
            for i = #Pokerleven.ina_bench_area.cards, 1, -1 do
                local bench_card = Pokerleven.ina_bench_area.cards[i]
                if is_team(bench_card, "Royal Academy") or is_team(bench_card, "Royal Redux") then
                    if bench_card.config.center_key == "j_ina_KingR" then
                        bench_card.ability.extra.chip_mod = math.floor((bench_card.ability.extra.chip_mod or 0) * card.ability.extra.buff_mod)
                        card_eval_status_text(bench_card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS})
                        buffed_any = true
                    elseif bench_card.config.center_key == "j_ina_SamfordR" then
                        bench_card.ability.extra.xmult_mod = (bench_card.ability.extra.xmult_mod or 0) * card.ability.extra.buff_mod
                        card_eval_status_text(bench_card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT})
                        buffed_any = true
                    else
                        card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.xmult_gain
                        bench_card:start_dissolve({G.C.RED}, nil, 1.6)
                        destroyed_any = true
                    end
                end
            end
        end
        
        if destroyed_any then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={card.ability.extra.current_xmult}}})
        elseif buffed_any then
            card:juice_up(0.5, 0.5)
        end
    end
    
    if context.joker_main and context.scoring_hand and card.ability.extra.current_xmult > 1 then
        return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.current_xmult}},
            Xmult_mod = card.ability.extra.current_xmult
        }
    end
  end
})

return {
    name = "Royal Redux",
    list = { CalebR }
}
