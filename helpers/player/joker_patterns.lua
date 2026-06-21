-- ══════════════════════════════════════════════════════════════════
-- Joker Pattern Helpers - Eliminates redundant code across jokers
-- ══════════════════════════════════════════════════════════════════

-- Context checks
Pokerleven.is_individual_play_card = function(context)
    return context and context.individual and context.cardarea == G.play
end

Pokerleven.is_other_joker_context = function(context)
    return context and context.other_joker and not context.debuff
end

-- Return structures
Pokerleven.create_xmult_return = function(value, msg_key)
    msg_key = msg_key or 'a_xmult'
    return {
        message = localize { type = 'variable', key = msg_key, vars = { value } },
        colour = G.C.XMULT,
        Xmult_mod = value
    }
end

Pokerleven.create_mult_return = function(value, msg_key)
    msg_key = msg_key or 'a_mult'
    return {
        message = localize { type = 'variable', key = msg_key, vars = { value } },
        colour = G.C.MULT,
        mult_mod = value
    }
end

Pokerleven.create_chips_return = function(value, msg_key)
    msg_key = msg_key or 'a_chips'
    return {
        message = localize { type = 'variable', key = msg_key, vars = { value } },
        colour = G.C.CHIPS,
        chip_mod = value
    }
end

-- Animation triggers
Pokerleven.trigger_other_joker_animation = function(context, duration_x, duration_y)
    duration_x = duration_x or 0.5
    duration_y = duration_y or 0.5
    if context and context.other_joker then
        Pokerleven.add_simple_event(function()
            context.other_joker:juice_up(duration_x, duration_y)
            return true
        end)
    end
end

-- Calculation helpers
Pokerleven.get_team_scaled_value = function(card, team_id, base_value, extra_key)
    local team = find_player_team(team_id)
    local count = #team
    if extra_key then
        return base_value * count + (card.ability.extra[extra_key] or 0)
    end
    return base_value * count
end

Pokerleven.get_position_count = function(position)
    return #find_player_position(position)
end

Pokerleven.get_type_count = function(joker_type)
    return #find_player_type(joker_type)
end

Pokerleven.get_team_count = function(team_id)
    return #find_player_team(team_id)
end

-- Rarity-based value lookup
Pokerleven.get_rarity_value = function(joker_center, rarity_table)
    if not joker_center or not rarity_table then return nil end
    local rarity = joker_center.config.center.rarity or 1
    return rarity_table[rarity]
end

return {}
