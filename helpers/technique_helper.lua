---@diagnostic disable: assign-type-mismatch
-- Multipliers for  technique upgrades
technique_values = {
    money = .6,
    mult_mod = .2,
    mult_mod_low = 1,
    chip_mod = .2,
    chips_mod = .2,
    Xmult_mod = .2,
    Xchip_mod = .2,
    Xchips_mod = .2,
    sell_mod = .6,       -- es de Seller
    sell_potential = .6, -- es de Seller
    current_Xmult = .2,
    current_xmult = .2,
    current_chips = .2,
    current_mult = .2,
    new_glass_denom = .2,
    xmult_mod = .2,
    xmult = .2,
    drain = .2,
    odds = -.05,
    sell_value = .2,
    common_mult = .2,    -- es de Martin
    uncommon_mult = .2,  -- es de Martin
    rare_xmult = .1,     -- es de Martin
    legendary_exp = .05, -- es de Martin
    copies_number = .25, -- es de Hattori
    alt_chips_mod = .2,
    byron_mult_fw = .2,
    byron_mult_mf = .2,
    perish_tally = 1,    -- Cloak
    extra_back_size = 1, -- Mark Evans
    cooldown_base = -0.2,
    current_cooldown = -0.2,
    evolving_retriggers = 1,
    card_count1 = 1,
    odds4 = -0.1499,
    odds2 = -0.1,
    mult_gain = 0.2667,
    xmult_gain = .2,
    chip_mod_normal = .2,
    chip_mod_chaos = .2,
    levels_per_card = .2,
    retriggers = 1,
    stone_bonus = .05,
    stat_mult = 0.1,
    max_charges = 0.2,
    stat_gain = 1,
    levels_to_add = 0.5,
    reduction_gain = 1,
    max_devoured = 0.2,
    threshold = -0.0625,
    threshold_upper = 0.05,
    cards_rescued = 1
}

local roundable_fields = {
    money = true,
    mult_mod = true,
    mult_mod_low = true,
    chip_mod = true,
    copies_number = true,
    cooldown_base = true,
    current_cooldown = true,
    mult_gain = true,
    chip_mod_normal = true,
    chip_mod_chaos = true,
    levels_per_card = true,
    retriggers = true,
    max_charges = true,
    levels_to_add = true,
    max_devoured = true,
    cards_rescued = true

}


-- List of stickers depending of technique type
plus_stickers = { "ina_tech_plus1_sticker", "ina_tech_plus2_sticker", "ina_tech_plus3_sticker", "ina_tech_plus4_sticker",
    "ina_tech_plus5_sticker" }

number_stickers = { "ina_tech_number2_sticker", "ina_tech_number3_sticker", "ina_tech_number4_sticker" }

grade_stickers = { "ina_tech_grade2_sticker", "ina_tech_grade3_sticker", "ina_tech_grade4_sticker",
    "ina_tech_grade5_sticker",
    "ina_tech_grade0_sticker" }

new_stickers = { "ina_tech_j_sticker", "ina_tech_q_sticker", "ina_tech_k_sticker", "ina_tech_a_sticker",
    "ina_tech_joker_sticker" }

spirit_stickers = { "ina_tech_spirit1_sticker", "ina_tech_spirit2_sticker", "ina_tech_spirit3_sticker", "ina_tech_spirit4_sticker", "ina_tech_spirit5_sticker" }


local function get_technique_sticker_list(card)
    if not card or not card.ability or type(card.ability) ~= "table" or not card.ability.extra then
        return new_stickers -- fallback seguro
    end

    local this_card_number_stickers = Pokerleven.clone_table(number_stickers)
    table.insert(this_card_number_stickers, card.ability.extra.numberTechType or C.UPGRADES.NumberType.A)
    table.insert(this_card_number_stickers, "ina_tech_numberinf_sticker")

    local sticker_map = {
        plus = plus_stickers,
        number = this_card_number_stickers,
        grade = grade_stickers,
        spirit = spirit_stickers
    }

    return sticker_map[card.ability.extra.techtype] or new_stickers
end

function set_sticker(card)
    local tech_level = card.ability.extra and card.ability.extra.tech_level or 0
    local sticker_list = get_technique_sticker_list(card)
    local clamped_level = math.max(1, math.min(tech_level, #sticker_list))

    for _, sticker_key in ipairs(sticker_list) do
        if card.ability[sticker_key] then card.ability[sticker_key] = false end
    end
    if card.ability.ina_tech_cap_plus_sticker then card.ability.ina_tech_cap_plus_sticker = false end
    if card.ability.ina_tech_cap_plus_max_sticker then card.ability.ina_tech_cap_plus_max_sticker = false end
    
    local is_small = Pokerleven and (Pokerleven.is_spirit(card) or Pokerleven.is_manager(card))
    local ex = card.ability.extra

    local final_sticker = nil
    if ex and ex.cap_plus_max then
        final_sticker = "ina_tech_cap_plus_max_sticker"
    elseif ex and ex.cap_plus then
        final_sticker = "ina_tech_cap_plus_sticker"
    elseif tech_level >= 1 then
        final_sticker = sticker_list[clamped_level]
    end

    if final_sticker and card.ability then
        if is_small then
            card.ability.ina_small_sticker = final_sticker
        else
            card.ability[final_sticker] = true
        end
    end
end

function clear_stickers(card)
    local technique_sticker_list = get_technique_sticker_list(card)
    if not card or not card.ability or type(card.ability) ~= "table" then
        return
    end
    for _, sticker_key in ipairs(technique_sticker_list) do
        if card.ability[sticker_key] then
            card.ability[sticker_key] = false
        end
    end

    for _, sticker_key in ipairs(C.STICKERS.types) do
        if card.ability[sticker_key] then
            card.ability[sticker_key] = false
        end
    end

    for _, sticker_key in ipairs(C.STICKERS.positions) do
        if card.ability[sticker_key] then
            card.ability[sticker_key] = false
        end
    end
        if card.ability then card.ability.ina_small_sticker = nil end
        if card.ability.ina_tech_cap_plus_sticker then card.ability.ina_tech_cap_plus_sticker = false end
        if card.ability.ina_tech_cap_plus_max_sticker then card.ability.ina_tech_cap_plus_max_sticker = false end
end

-- Increments technique level of a joker and applies stat changes based on technique values
increment_technique = function(card)
    if card.ability.extra and type(card.ability.extra) == "table" then
        if card.ability.extra.tech_level then
            card.ability.extra.tech_level = card.ability.extra.tech_level + 1
        else
            card.ability.extra.tech_level = 1
        end
    end

    local ex = card.ability.extra
    if ex and ex.tech_level and G.GAME.modifiers.can_cap_plus then
        if ex.tech_level == G.GAME.max_tech_level + 1 and not ex.cap_plus then
            ex.cap_plus = true
            ex.cap_max_req = math.random(3, 7)
            for k, _ in pairs(technique_values) do
                if type(ex[k]) == 'number' and type(card.config.center.config.extra[k]) == 'number' then ex[k] = ex[k] * 2 end
            end
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "CAP+", colour = G.C.DARK_EDITION})
            play_sound('tarot1')
        end
        if ex.cap_plus and not ex.cap_plus_max and ex.tech_level == G.GAME.max_tech_level + 1 + (ex.cap_max_req or 4) then
            ex.cap_plus_max = true
            for k, _ in pairs(technique_values) do
                if type(ex[k]) == 'number' and type(card.config.center.config.extra[k]) == 'number' then ex[k] = ex[k] * 2 end
            end
            card:set_edition({negative = true}, true, true)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "CAP+ MAX", colour = G.C.DARK_EDITION})
            play_sound('foil1')
        end
    end

    modify_values(card)
    set_sticker(card)

    if card.ability.extra.tech_level == 4
        and G.STAGE == G.STAGES.RUN and
        not (Pokerleven.aux_tab_card_area and Pokerleven.aux_tab_card_area.cards) then
        check_for_unlock({ type = 'n4_upgraded' })
    end

    if card.ability.extra.extra_back_size and G.STAGE == G.STAGES.RUN
        and not (Pokerleven.aux_tab_card_area and Pokerleven.aux_tab_card_area.cards) then
        G.hand.config.card_limit = G.hand.config.card_limit + 1
    end
end

-- Applies value updates to a joker based on its center config and technique multipliers
modify_values = function(card)
    local mult = 1
    if card.ability.extra and card.ability.extra.cap_plus_max then mult = 4
    elseif card.ability.extra and card.ability.extra.cap_plus then mult = 2 end

    for name, _ in pairs(technique_values) do
        local data = card.ability.extra[name]
        local base_val = card.config.center.config.extra[name]
        if type(data) == "number" and type(base_val) == "number" then
            local addition = technique_values[name]

            card.ability.extra[name] = data + (base_val * addition * mult)

            local rounded, frac = round_value(card.ability.extra[name], name)
            card.ability.extra[name] = rounded

            if frac then
                set_frac(card, frac, name)
            end
        end
    end
end


-- Rounds a stat value based adn returns the integer part and fractional part (if applicable)
round_value = function(value, field)
    local frac
    local rounded

    if roundable_fields[field] then
        rounded, frac = math.modf(value)
    else
        rounded = value
    end

    return rounded, frac
end


-- Stores and manages fractional values for a joker's stat field
-- Converts to full stat point when fraction reaches 1.0+
set_frac = function(card, frac, field)
    local frac_name = field .. "_frac"
    if card.ability[frac_name] then
        card.ability[frac_name] = card.ability[frac_name] + frac
    else
        card.ability[frac_name] = frac
    end
    if card.ability[frac_name] >= 1 then
        local int_part, remaining_frac = math.modf(card.ability[frac_name])
        card.ability.extra[field] = card.ability.extra[field] + int_part
        card.ability[frac_name] = remaining_frac
    end
end

-- Returns true if the card matches the type and position and its technique level is below the max
can_upgrade_tech_level = function(card, type, position)
    local max_lvl = G.GAME.max_tech_level
    if G.GAME.modifiers.can_cap_plus then max_lvl = 9999 end

    if type and position then
        return is_type(card, type) and is_position(card, position) and
            (card.ability.extra.tech_level or 0) < max_lvl
    else
        return (card.ability.extra.tech_level or 0) < max_lvl
    end
end
