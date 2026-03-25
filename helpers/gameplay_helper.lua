-- Lógica centralizada para los partidos 1v1
Pokerleven.play_1v1_turn = function(blind, ctx, team_config)
    if ctx.after and not ctx.blueprint then
        if not blind.ai_jokers then
            blind.ai_jokers = {}
            local t_members, captain, max_r = {}, nil, -1
            if team_config.team_name then
                for k, v in pairs(G.P_CENTERS) do
                    if v.set == 'Joker' and v.pteam == team_config.team_name then
                        table.insert(t_members, v)
                        local r = type(v.rarity) == "number" and v.rarity or (v.rarity == "ina_top" and 4) or (v.rarity == "ina_winner" and 4) or 1
                        if r > max_r then max_r = r; captain = v end
                    end
                end
            end
            local p_count = G.jokers and G.jokers.cards and #G.jokers.cards or 0
            if captain and p_count > 0 then table.insert(blind.ai_jokers, captain) end
            local avail = {}
            for _, v in ipairs(t_members) do if not captain or v.key ~= captain.key then table.insert(avail, v) end end
            pseudoshuffle(avail, pseudoseed("ai_jokers"))
            while #blind.ai_jokers < p_count and #avail > 0 do table.insert(blind.ai_jokers, avail[1]); table.remove(avail, 1) end
        end

        local ai_hands = {
            {hand = "High Card", weight = 15}, {hand = "Pair", weight = 35}, {hand = "Two Pair", weight = 20},
            {hand = "Three of a Kind", weight = 15}, {hand = "Straight", weight = 8}, {hand = "Flush", weight = 5}, {hand = "Full House", weight = 2}
        }
        local tw = 0
        for _, v in ipairs(ai_hands) do tw = tw + v.weight end
        local roll, s_hand = pseudorandom(pseudoseed("ai_hand")) * tw, "Pair"
        for _, v in ipairs(ai_hands) do if roll <= v.weight then s_hand = v.hand; break end; roll = roll - v.weight end
        
        local h_chips, h_mult = G.GAME.hands[s_hand].chips or 10, G.GAME.hands[s_hand].mult or 2
        local c_chips = math.floor(pseudorandom(pseudoseed("ai_cards")) * 30) + 15
        
        local ai_chips, ai_mult, ai_xmult, techs = 0, 0, 1, {}
        if blind.ai_jokers and #blind.ai_jokers > 0 then
            for _, v in ipairs(blind.ai_jokers) do
                local r = type(v.rarity) == "number" and v.rarity or (v.rarity == "ina_top" and 4) or (v.rarity == "ina_winner" and 4) or 1
                ai_chips = ai_chips + (r * 25); ai_mult = ai_mult + (r * 4); if r >= 3 then ai_xmult = ai_xmult + (r == 3 and 0.5 or 1) end
                table.insert(techs, localize{type='name_text', set='Joker', key=v.key})
            end
        else ai_chips, ai_mult, ai_xmult, techs = team_config.base_chips or 0, team_config.base_mult or 0, team_config.xmult or 1, team_config.techniques or {"¡Ataque!"} end

        local score = math.floor((h_chips + c_chips + ai_chips) * (h_mult + ai_mult) * ai_xmult)
        blind.ai_score = (blind.ai_score or 0) + score
        
        local tech = pseudorandom_element(techs, pseudoseed("ai_tech"))
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.0, func = function()
            play_sound('gong', 0.9, 1.2)
            local box = G.HUD_blind and G.HUD_blind:get_UIE_by_ID('HUD_blind_count') and G.HUD_blind:get_UIE_by_ID('HUD_blind_count').parent.parent or G.HUD_blind
            attention_text({text = "Rival:\n" .. localize(s_hand, 'poker_hands'), scale = 0.4, hold = 1.8, cover = box, cover_colour = G.C.ORANGE, align = 'cm', maxw = 2.8})
            return true
        end}))
        
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 1.6, func = function()
            play_sound('gong', 1.1, 1.3)
            local box = G.HUD_blind and G.HUD_blind:get_UIE_by_ID('HUD_blind_count') and G.HUD_blind:get_UIE_by_ID('HUD_blind_count').parent.parent or G.HUD_blind
            attention_text({text = tech .. "\n+" .. number_format(score), scale = 0.4, hold = 2.5, cover = box, cover_colour = G.C.RED, align = 'cm', maxw = 2.8})
            blind.chip_text = number_format(blind.ai_score); blind:wiggle()
            return true
        end}))

        if G.GAME.current_round.hands_left == 0 then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 2.5, func = function()
                if G.GAME.chips >= blind.ai_score then blind.chips, blind.chip_text = 0, "0" else blind.chips = 1e300 end
                return true
            end}))
        end
    end
end

