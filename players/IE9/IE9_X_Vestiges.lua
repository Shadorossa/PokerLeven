local Axel_Kirkwood = J({
    name = "Axel_Kirkwood",
    pos = { x = 1, y = 0 },
    soul_pos = { x = 1, y = 1 },
    config = { extra = { xmult = 2.5 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.xmult } }
    end,
    rarity = "ina_vestige",
    pools = { ["Vestiges"] = true },
    cost = 10,
    atlas = "JokersVestigio",
    ptype = C.Fire,
    pposition = C.FW,
    pteam = "ina_team_Kirkwood",
    techtype = C.UPGRADES.Plus,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.joker_main and ctx.scoring_hand then
            local is_flush = #ctx.scoring_hand > 0
            for _, c in ipairs(ctx.scoring_hand) do
                if not c:is_suit('Hearts') then is_flush = false; break end
            end
            if is_flush then
                return {
                    message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
                    Xmult_mod = card.ability.extra.xmult,
                    colour = G.C.XMULT
                }
            end
        elseif ctx.after and not ctx.blueprint then
            local lowest, lowest_id = nil, 15
            for _, c in ipairs(ctx.scoring_hand) do
                if c:get_id() < lowest_id and not c.destroyed and not c.shattered then lowest, lowest_id = c, c:get_id() end
            end
            if lowest then
                G.GAME.ina_cards_destroyed_this_hand = (G.GAME.ina_cards_destroyed_this_hand or 0) + 1
                if lowest:is_suit('Hearts') then
                    G.GAME.ina_hearts_destroyed_this_hand = true
                end
                if lowest:is_suit('Clubs') then
                    G.GAME.ina_clubs_destroyed_this_hand = (G.GAME.ina_clubs_destroyed_this_hand or 0) + 1
                end
                if lowest.ability.name == 'Glass Card' then lowest.shattered = true; lowest:shatter()
                else lowest.destroyed = true; lowest:start_dissolve() end
                return {message = localize('ina_destroy'), colour = G.C.RED}
            end
        end
    end
})

return {
    name = "Vestiges",
    list = { Axel_Kirkwood }
}