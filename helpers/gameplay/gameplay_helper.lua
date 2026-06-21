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

-- Lógica centralizada para el minijuego de Penaltis
Pokerleven.start_penalty_shootout = function(blind, on_complete)
    Pokerleven.penalty_shootout = {
        goals = 0,
        attempts = 0,
        max_attempts = 5,
        on_complete = on_complete,
        gk_offset_x = 0
    }

    local blind_sprite = AnimatedSprite(0, 0, 2, 2, blind.children.animatedSprite.atlas, blind.children.animatedSprite.sprite_pos)
    blind_sprite:define_draw_steps({{shader = 'dissolve', shadow_height = 0.05}, {shader = 'dissolve'}})
    blind_sprite.states.drag.can = false; blind_sprite.states.hover.can = false
    Pokerleven.penalty_shootout.goalkeeper = blind_sprite

    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu({
        definition = Pokerleven.create_penalty_ui(),
        config = {no_esc = true}
    })

    local gk_node = G.OVERLAY_MENU:get_UIE_by_ID('gk_sprite')
    if gk_node and gk_node.config.object then
        gk_node.config.object.draw = function(self)
            local gk = Pokerleven.penalty_shootout.goalkeeper
            gk.T.x = self.T.x + (Pokerleven.penalty_shootout.gk_offset_x or 0)
            gk.T.y = self.T.y
            gk.VT.x = gk.T.x
            gk.VT.y = gk.T.y
            gk:draw()
        end
    end
end

Pokerleven.create_penalty_ui = function()
    return {n=G.UIT.ROOT, config = {align = 'cm', colour = G.C.CLEAR}, nodes={
        {n=G.UIT.C, config = {align = "cm", r = 0.1, padding = 0.2, colour = G.C.BLACK, minw = 10, minh = 6.5, outline = 2, outline_colour = G.C.WHITE}, nodes={
            {n=G.UIT.R, config = {align = "cm", padding = 0.2}, nodes={
                {n=G.UIT.T, config={text = "Tanda de Penaltis", scale = 0.7, colour = G.C.WHITE, shadow = true}}
            }},
            {n=G.UIT.R, config = {align = "cm", padding = 0.2}, nodes={
                {n=G.UIT.O, config={id = 'pen_score_text', object = DynaText({string = {"Goles: " .. Pokerleven.penalty_shootout.goals .. " / " .. Pokerleven.penalty_shootout.max_attempts}, colours = {G.C.GOLD}, scale = 0.5, shadow = true})}}
            }},
            {n=G.UIT.R, config = {align = "cm", minw = 8.5, minh = 3.5, colour = G.C.GREEN, r = 0.1, outline = 1, outline_colour = G.C.WHITE}, nodes={
                {n=G.UIT.C, config = {align = "cm", minw = 2.8, minh = 3.5}, nodes={}},
                {n=G.UIT.C, config = {align = "cm", minw = 0.05, minh = 3.5, colour = G.C.WHITE}, nodes={}},
                {n=G.UIT.C, config = {align = "cm", minw = 2.8, minh = 3.5}, nodes={
                    {n=G.UIT.O, config={id = 'gk_sprite', object = Moveable(0,0,2,2)}}
                }},
                {n=G.UIT.C, config = {align = "cm", minw = 0.05, minh = 3.5, colour = G.C.WHITE}, nodes={}},
                {n=G.UIT.C, config = {align = "cm", minw = 2.8, minh = 3.5}, nodes={}}
            }},
            {n=G.UIT.R, config = {align = "cm", padding = 0.4}, nodes={
                UIBox_button({id = 'pen_left', button = 'penalty_shoot', ref_table = {dir = 'left'}, label = {'Izquierda'}, minw = 2.2, minh = 1.2, colour = G.C.BLUE, scale = 0.4, col = true}),
                {n=G.UIT.C, config={minw = 0.5}, nodes={}},
                UIBox_button({id = 'pen_center', button = 'penalty_shoot', ref_table = {dir = 'center'}, label = {'Centro'}, minw = 2.2, minh = 1.2, colour = G.C.BLUE, scale = 0.4, col = true}),
                {n=G.UIT.C, config={minw = 0.5}, nodes={}},
                UIBox_button({id = 'pen_right', button = 'penalty_shoot', ref_table = {dir = 'right'}, label = {'Derecha'}, minw = 2.2, minh = 1.2, colour = G.C.BLUE, scale = 0.4, col = true}),
            }}
        }}
    }}
end

G.FUNCS.penalty_shoot = function(e)
    local dir = e.config.ref_table.dir
    local dirs = {'left', 'center', 'right'}
    local gk_dir = dirs[math.random(1, 3)]

    local b_l = G.OVERLAY_MENU:get_UIE_by_ID('pen_left')
    local b_c = G.OVERLAY_MENU:get_UIE_by_ID('pen_center')
    local b_r = G.OVERLAY_MENU:get_UIE_by_ID('pen_right')
    if b_l then b_l.config.button = nil; b_l.config.colour = G.C.UI.BACKGROUND_INACTIVE end
    if b_c then b_c.config.button = nil; b_c.config.colour = G.C.UI.BACKGROUND_INACTIVE end
    if b_r then b_r.config.button = nil; b_r.config.colour = G.C.UI.BACKGROUND_INACTIVE end

    local gk_node = G.OVERLAY_MENU:get_UIE_by_ID('gk_sprite')

    local offset_x = (gk_dir == 'left' and -2.85) or (gk_dir == 'right' and 2.85) or 0
    G.E_MANAGER:add_event(Event({trigger = 'ease', ref_table = Pokerleven.penalty_shootout, ref_value = 'gk_offset_x', ease_to = offset_x, delay = 0.3, func = (function(t) return t end)}))

    G.E_MANAGER:add_event(Event({
        trigger = 'after', delay = 0.4, func = function()
            local scored = (dir ~= gk_dir)
            if scored then
                Pokerleven.penalty_shootout.goals = Pokerleven.penalty_shootout.goals + 1
                play_sound('coin1', 1.2); attention_text({text = "¡GOL!", scale = 0.8, hold = 1.0, cover = gk_node, cover_colour = G.C.GREEN, align = 'cm'})
            else
                play_sound('cancel', 0.8); attention_text({text = "¡PARADA!", scale = 0.8, hold = 1.0, cover = gk_node, cover_colour = G.C.RED, align = 'cm'})
            end
            Pokerleven.penalty_shootout.attempts = Pokerleven.penalty_shootout.attempts + 1
            local score_text = G.OVERLAY_MENU:get_UIE_by_ID('pen_score_text').config.object
            score_text:update_text({string = {"Goles: " .. Pokerleven.penalty_shootout.goals .. " / " .. Pokerleven.penalty_shootout.max_attempts}})
            score_text:pulse(0.5)
            return true
        end
    }))

    G.E_MANAGER:add_event(Event({
        trigger = 'after', delay = 1.2, func = function()
            if Pokerleven.penalty_shootout.attempts >= Pokerleven.penalty_shootout.max_attempts then
                G.FUNCS.exit_overlay_menu(); if Pokerleven.penalty_shootout.on_complete then Pokerleven.penalty_shootout.on_complete(Pokerleven.penalty_shootout.goals, Pokerleven.penalty_shootout.max_attempts) end
            else
                G.E_MANAGER:add_event(Event({trigger = 'ease', ref_table = Pokerleven.penalty_shootout, ref_value = 'gk_offset_x', ease_to = 0, delay = 0.2, func = (function(t) return t end)}))
                if b_l then b_l.config.button = 'penalty_shoot'; b_l.config.colour = G.C.BLUE end
                if b_c then b_c.config.button = 'penalty_shoot'; b_c.config.colour = G.C.BLUE end
                if b_r then b_r.config.button = 'penalty_shoot'; b_r.config.colour = G.C.BLUE end
            end
            return true
        end
    }))
end
