-- CUSTOM Small And Big Blinds
function get_new_small()
    G.GAME.perscribed_small = G.GAME.perscribed_small or {
    }
    if G.GAME.perscribed_small and G.GAME.perscribed_small[G.GAME.round_resets.ante] then
        local ret_boss = G.GAME.perscribed_small[G.GAME.round_resets.ante]
        G.GAME.perscribed_small[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_SMALL then return G.FORCE_SMALL end

    local eligible_bosses = { bl_small = true }
    local ante = math.max(1, G.GAME.round_resets.ante)
    for k, v in pairs(G.P_BLINDS) do
        if Pokerleven.Universe and Pokerleven.Universe.is_blind_allowed_in_slot(v, "Small", ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    for k, v in pairs(eligible_bosses) do
        local mod = G.P_BLINDS[k] and G.P_BLINDS[k].mod
        if Pokerleven.config.custom_middle_blinds == false then
            if mod and mod.id == 'Pokerleven' then
                eligible_bosses[k] = nil
            end
        else
            if not mod or mod.id ~= 'Pokerleven' then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))

    return boss
end

function get_new_big()
    G.GAME.perscribed_big = G.GAME.perscribed_big or {
    }
    if G.GAME.perscribed_big and G.GAME.perscribed_big[G.GAME.round_resets.ante] then
        local ret_boss = G.GAME.perscribed_big[G.GAME.round_resets.ante]
        G.GAME.perscribed_big[G.GAME.round_resets.ante] = nil
        return ret_boss
    end
    if G.FORCE_BIG then return G.FORCE_BIG end

    local eligible_bosses = { bl_big = true }
    local ante = math.max(1, G.GAME.round_resets.ante)
    for k, v in pairs(G.P_BLINDS) do
        if Pokerleven.Universe and Pokerleven.Universe.is_blind_allowed_in_slot(v, "Big", ante) then
            eligible_bosses[k] = true
        end
    end
    for k, v in pairs(G.GAME.banned_keys) do
        if eligible_bosses[k] then eligible_bosses[k] = nil end
    end

    for k, v in pairs(eligible_bosses) do
        local is_mod = G.P_BLINDS[k].mod and G.P_BLINDS[k].mod.id == 'Pokerleven'

        if Pokerleven.config.custom_middle_blinds == false then
            if is_mod then
                eligible_bosses[k] = nil
            end
        else
            if not is_mod then
                eligible_bosses[k] = nil
            end
        end
    end

    local _, boss = pseudorandom_element(eligible_bosses, pseudoseed('boss'))

    return boss
end

-- RERROLL BIG BLINDS
reroll_big = function(e)
    stop_use()
    G.GAME.round_resets.big_rerolled = true
    G.from_boss_tag = nil -- Por si quieres reutilizar el flag
    G.CONTROLLER.locks.big_reroll = true

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            play_sound('other1')
            G.blind_select_opts.big:set_role({ xy_bond = 'Weak' })
            G.blind_select_opts.big.alignment.offset.y = 20
            return true
        end
    }))

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.3,
        func = (function()
            local par = G.blind_select_opts.big.parent
            G.GAME.round_resets.blind_choices.Big = get_new_big()

            G.blind_select_opts.big:remove()
            G.blind_select_opts.big = UIBox {
                T = { par.T.x, 0, 0, 0 },
                definition = {
                    n = G.UIT.ROOT, config = { align = "cm", colour = G.C.CLEAR }, nodes = {
                    UIBox_dyn_container({ create_UIBox_blind_choice('Big') }, false, get_blind_main_colour('Big'), mix_colours(G.C.BLACK, get_blind_main_colour('Big'), 0.8))
                }
                },
                config = {
                    align = "bmi",
                    offset = { x = 0, y = G.ROOM.T.y + 9 },
                    major = par,
                    xy_bond = 'Weak'
                }
            }

            par.config.object = G.blind_select_opts.big
            par.config.object:recalculate()
            G.blind_select_opts.big.parent = par
            G.blind_select_opts.big.alignment.offset.y = 0

            G.E_MANAGER:add_event(Event({
                blocking = false,
                trigger = 'after',
                delay = 0.5,
                func = function()
                    G.CONTROLLER.locks.big_reroll = nil
                    return true
                end
            }))

            save_run()
            for i = 1, #G.GAME.tags do
                if G.GAME.tags[i]:apply_to_run({ type = 'new_blind_choice' }) then break end
            end

            return true
        end)
    }))
end

---Decreases blind size by a percent per member o blind team
---@param percent_per_member number Percent to decrease per player
function apply_team_discount_to_blind(percent_per_member)
    local team = find_player_team(G.GAME.blind.name)
    local count = #team

    if count > 0 then
        G.GAME.blind.chips = G.GAME.blind.chips * (1 - (percent_per_member * count / 100))
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
    end
end

local blind_get_type = Blind.get_type
function Blind:get_type()
    if self.small then
        return 'Small'
    elseif self.big then
        return 'Big'
    else
        return blind_get_type(self)
    end
end

local old_blind_save = Blind.save
function Blind:save()
    local save_table = old_blind_save(self)
    save_table.small = self.small
    save_table.big = self.big
    return save_table
end

local old_blind_load = Blind.load
function Blind:load(blindTable)
    old_blind_load(self, blindTable)
    self.small = blindTable.small
    self.big = blindTable.big
end

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
