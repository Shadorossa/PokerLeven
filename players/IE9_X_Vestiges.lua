local Axel_Kirkwood = J({
    name = "Axel_Kirkwood",
    pos = { x = 1, y = 0 },
    soul_pos = { x = 1, y = 1 },
    config = { extra = { xmult = 4 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.xmult } }
    end,
    rarity = "ina_vestige",
    pools = { ["Kirkwood"] = true },
    cost = 10,
    atlas = "JokersVestigio",
    ptype = C.Fire,
    pposition = C.FW,
    techtype = C.UPGRADES.Number,
    pteam = "ina_team_Kirkwood",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if Pokerleven.is_joker_turn(ctx) then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
                Xmult_mod = card.ability.extra.xmult,
                colour = G.C.MULT
            }
        elseif ctx.after and not ctx.blueprint and ctx.scoring_hand then
            local lowest_card, lowest_id = nil, 100
            for _, c in ipairs(ctx.scoring_hand) do
                if not c.destroyed and not c.shattered and c:get_id() < lowest_id then
                    lowest_card, lowest_id = c, c:get_id()
                end
            end
            
            if lowest_card then
                if lowest_card.ability.name == 'Glass Card' then lowest_card.shattered = true; lowest_card:shatter()
                else lowest_card.destroyed = true; lowest_card:start_dissolve() end
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('ina_destroy'), colour = G.C.RED})
            end
        end
    end
})

return {
    name = "Vestiges",
    list = { Axel_Kirkwood }
}