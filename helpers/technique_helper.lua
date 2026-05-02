---@diagnostic disable: assign-type-mismatch
-- Multipliers for  technique upgrades
technique_values = {
    -- Economía
    money = .6,
    sell_mod = .6,       -- es de Seller
    sell_potential = .6, -- es de Seller
    sell_value = .2,     -- es de Finn Geld

    -- Puntuación (Aditivo)
    mult_mod = .2,
    mult_mod_low = 1,    -- es de Arion / Ryoma
    chip_mod = .2,       -- es de Island / Arion / Mark Evans (IJ)
    chip_mod_normal = .2,
    chip_mod_chaos = .2,
    current_chips = .2,  -- es de Eisei Gakuen / Perseus
    current_mult = .2,   -- es de Eisei Gakuen / Perseus
    mult_gain = 0.2667,  -- es de King / Perseus
    common_mult = .2,    -- es de Martin
    uncommon_mult = .2,  -- es de Martin
    alt_chips_mod = .2,  -- es de Mando

    -- Puntuación (Multiplicativo)
    Xmult_mod = .2,      -- es de Jude / Byron (MF) / General
    Xchip_mod = .2,      -- es de Jack (IJ)
    xmult = .2,
    xmult_gain = .2,     -- es de King / Eisei Gakuen
    current_Xmult = .2,  -- es de Jude / Thor / General / Prominence
    rare_xmult = .1,     -- es de Martin

    -- Probabilidades
    odds = -.05,         -- es de Shadow / General
    odds2 = -0.1,        -- es de Ian Flappable / Triumvir
    odds4 = -0.1499,     -- es de Ian Flappable
    threshold = -0.0625,
    threshold_upper = 0.05,

    -- Evolución y Niveles
    perish_tally = 1,    -- Cloak
    extra_back_size = 1, -- Mark Evans
    evolving_retriggers = 1, -- es de Kevin
    levels_per_card = .2,-- es de Jack
    levels_to_add = 0.5, -- es de Majin Pegasus?
    cards_rescued = 1,
    retriggers = 1,      -- es de Suffolk / Arion

    -- Específicos de Personaje/Equipo
    byron_mult_fw = .2,  -- es de Byron (FW)
    byron_mult_mf = .2,  -- es de Byron (MF)
    card_count1 = 1,     -- es de Soundtown
    cooldown_base = -0.2,-- es de Arion
    current_cooldown = -0.2, -- es de Arion
    new_glass_denom = .2,-- es de Diamond Dust / Kirkwood
    drain = .2,          -- es de Bellatrix / Dvalin
    copies_number = .25, -- es de Hattori
    stone_bonus = .05,   -- es de Hauser
    stat_boost = 0.0075,    -- es de Thaddeus

    -- Espíritus (normales)
    stat_mult = 0.02,     -- es de Majin Pegasus (Espíritu)
    max_charges = 0.2,   -- es de Espíritus normales
    stat_gain = 1,       -- es de Surtur (Espíritu)
    reduction_gain = 0.2, -- es de Gigante / Eris (Espíritu)
    max_devoured = 0.2,
}

-- Multiplicative technique values: each level multiplies the field by this factor.
-- E.g. factor = 2 means each level doubles the value (2 -> 4 -> 8 -> 16...).
multiplicative_technique_values = {
    max_charges_plasma = 2, -- es de las Sombras de Plasma (*2 por nivel)
}

-- Finds max_charges from any naming convention (max_charges, max_charges_plasma, etc.)
-- so helpers don't need a chain of 'or' checks.
get_max_charges = function(ex)
    if not ex then return nil end
    if ex.max_charges then return ex.max_charges end
    for k, v in pairs(ex) do
        if type(k) == 'string' and k:sub(1, 11) == 'max_charges' and type(v) == 'number' then
            return v
        end
    end
    return nil
end

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
    elseif tech_level > 1 then
        -- El nivel 1 es base (sin sticker), el nivel 2 usa el sticker 1, etc.
        local clamped_index = math.max(1, math.min(tech_level - 1, #sticker_list))
        final_sticker = sticker_list[clamped_index]
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
        local old_level = card.ability.extra.tech_level or 1
        local new_level = old_level + 1
        
        -- Salto directo al CAP+ para no_training (Nivel 1 -> 7)
        if card.ability.extra.no_training and old_level == 1 then
            new_level = 7
        end
        
        card.ability.extra.tech_level = new_level

        -- Aplicar flags de CAP y efectos (Niveles 7 y 8 exclusivos para veteranos)
        if new_level == 7 then
            card.ability.extra.cap_plus = true
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Cap+", colour = G.C.DARK_EDITION})
            play_sound('tarot1')
        elseif new_level == 8 then
            card.ability.extra.cap_plus_max = true
            card:set_edition({negative = true}, true, true)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "Cap+ max", colour = G.C.DARK_EDITION})
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

    local ex = card.ability.extra
    if not ex then return end
    local tech_level = ex.tech_level or 1

    -- Additive scaling
    -- Nueva lógica: Calculamos desde la base cada vez para aplicar el CAP correctamente
    -- Fórmula: base * (1 + (nivel-1) * incremento) * multiplicador_CAP
    for name, addition in pairs(technique_values) do
        local center = G.P_CENTERS[card.config.center.key] or card.config.center
        local base_val = center.config.extra and center.config.extra[name] or 1
        
        if type(ex[name]) == "number" then
            -- Fórmula final: Base + (Base * (Lvl-1) * Incremento * Mult_CAP)
            -- El Mult_CAP solo afecta al incremento, no a la base.
            local bonus = base_val * (tech_level - 1) * addition * mult
            ex[name] = base_val + bonus
            
            if roundable_fields[name] then
                ex[name] = math.floor(ex[name] + 0.5)
            end
        end
    end

    -- Multiplicative scaling
    for name, factor in pairs(multiplicative_technique_values) do
        local base_val = card.config.center.config.extra[name]
        if type(ex[name]) == "number" and type(base_val) == "number" then
            -- Para multiplicativos, el CAP multiplica el exponente o el factor según se prefiera
            -- Aquí mantenemos la lógica de potencia sobre el nivel
            ex[name] = base_val * (factor ^ ((tech_level - 1) * mult))
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
    local ex = card.ability.extra
    local current_level = ex.tech_level or 1

    -- Bloqueos según tipo de jugador
    if not ex.no_training then
        -- Jugadores estándar: máximo nivel 6 (GO), nunca pueden llegar al 7+
        if current_level >= 6 then return false end
    else
        -- Jugadores veteranos: no pueden subir a niveles intermedios (2-6)
        -- Si están en nivel 1, pueden subir (porque saltarán al 7)
        -- Si están en nivel 7, pueden subir (al 8/MAX)
        if current_level > 1 and current_level < 7 then return false end
        if current_level >= 8 then return false end -- Nivel 8 es el CAP+ MAX
    end

    local max_lvl = 8
    if Pokerleven.is_spirit(card) then max_lvl = 6 end -- Espíritus suelen tener un nivel menos o diferente escala

    if type and position then
        return is_type(card, type) and is_position(card, position) and
            current_level < max_lvl
    else
        return current_level < max_lvl
    end
end
