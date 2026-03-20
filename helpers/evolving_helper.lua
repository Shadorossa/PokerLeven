family = {
    { "Jude", "Jude_Raimon" },
    { "Feldt", "DarkFeldt" },
    { "Night", "NightDark" },
    { "Sam", "SamDark" },
    { "Jim", "JimDark" },
    { "Tod", "TodDark" },
    { "Steve", "SteveDark" },
    { "Timmy", "TimmyDark" },
    { "Max", "MaxDark" },
    { "Shadow", "ShadowDark" },
    { "Nathan", "NathanDark" },
    { "Kevin", "KevinDark" },
    { "King", "KingR" },
    { "Samford", "SamfordR" },
    { "Dvalin", "Dvalin_Plus" }
}

copy_scaled_values = function(card)
    local values = { mult = 0, chips = 0, Xmult = 0, money = 0 }
    if card.ability and card.ability.extra and type(card.ability.extra) == "table" then
        for l, v in pairs(values) do
            if card.ability.extra[l] and (card.ability.extra[l .. "_mod"] or card.ability.extra[string.sub(l, 1, -2) .. "_mod"]) then
                values[l] = card.ability.extra[l]
            end
        end
    end
    return values
end

ina_evolve = function(card, to_key, immediate)
    if immediate then
        ina_backend_evolve(card, to_key)
    else
        G.E_MANAGER:add_event(Event({
            func = function()
                if card.evolution_timer or G.P_CENTERS[to_key] == card.config.center then return true end
                card.evolution_timer = 0
                G.E_MANAGER:add_event(Event({
                    trigger = 'ease',
                    ref_table = card,
                    ref_value = 'evolution_timer',
                    ease_to = 1.5,
                    delay = 2.0,
                    func = (function(t) return t end)
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        ina_backend_evolve(card, to_key)
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    trigger = 'ease',
                    ref_table = card,
                    ref_value = 'evolution_timer',
                    ease_to = 2.25,
                    delay = 1.0,
                    func = (function(t) return t end)
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        card.evolution_timer = nil
                        play_sound('tarot1')
                        card_eval_status_text(card, 'extra', nil, nil, nil,
                            { message = localize("ina_evolve_success"), colour = G.C.FILTER, instant = true })
                        return true
                    end
                }))
                return true
            end
        }))
    end
end

ina_backend_evolve = function(card, to_key)
    local new_card = G.P_CENTERS[to_key]
    local tech_level = card.ability.extra.tech_level or 0
    if card.config.center == new_card then return end

    local old_key = card.config.center.key

    if card.ability.perishable and card.ability.perish_tally > 0 then
        card.ability.perish_tally = G.GAME.perishable_rounds
    end

    clear_stickers(card)

    local names_to_keep = { "targets", "rank", "id", "cards_scored", "upgrade", "mult", "mult_mod", "current_xmult",
        "tech_level", "xmult_mod" }
    local values_to_keep = copy_scaled_values(card)
    if type(card.ability.extra) == "table" then
        for _, k in pairs(names_to_keep) do
            values_to_keep[k] = card.ability.extra[k]
        end
    end

    card.children.center = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS[new_card.atlas], new_card.pos)
    card.children.center.states.hover = card.states.hover
    card.children.center.states.click = card.states.click
    card.children.center.states.drag = card.states.drag
    card.children.center.states.collide.can = false
    card.children.center:set_role({ major = card, role_type = 'Glued', draw_major = card })
    card:set_ability(new_card, true)
    card:set_cost()

    if type(card.ability.extra) == "table" then
        for k, v in pairs(values_to_keep) do
            if card.ability.extra[k] then
                if type(card.ability.extra[k]) ~= "number" or (type(v) == "number" and v > card.ability.extra[k]) then
                    card.ability.extra[k] = v
                end
            end
        end
    end

    if new_card.soul_pos then
        card.children.floating_sprite = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS[new_card.atlas],
            new_card.soul_pos)
        card.children.floating_sprite.role.draw_major = card
        card.children.floating_sprite.states.hover.can = false
        card.children.floating_sprite.states.click.can = false
    elseif card.children.floating_sprite then
        card.children.floating_sprite:remove()
        card.children.floating_sprite = nil
    end

    if tech_level ~= 0 then
        for level = 1, tech_level do
            increment_technique(card)
        end
    end

    if not card.edition then
        card:juice_up()
        play_sound('generic1')
    else
        card:juice_up(1, 0.5)
        if card.edition.foil then play_sound('foil1', 1.2, 0.4) end
        if card.edition.holo then play_sound('holo1', 1.2 * 1.58, 0.4) end
        if card.edition.polychrome then play_sound('polychrome1', 1.2, 0.7) end
        if card.edition.negative then play_sound('negative', 1.5, 0.4) end
    end

    local to_fix = {}
    for k, _ in pairs(G.GAME.used_jokers) do
        if not next(SMODS.find_card(k, true)) then
            table.insert(to_fix, k)
        end
    end
    for _, k in pairs(to_fix) do
        G.GAME.used_jokers[k] = nil
    end
end

can_evolve = function(self, card, context, forced_key, ignore_step, allow_level)
    if not G.P_CENTERS[forced_key] then return false end
    if not allow_level then return false end
    if ((not context.repetition and not context.individual and context.end_of_round) or ignore_step) and not context.blueprint and not card.gone then
        return true
    else
        return false
    end
end

level_evo = function(self, card, context, forced_key)
    if not card.ability.extra.rounds then return end
    if card.debuff then return end
    if can_evolve(self, card, context, forced_key, nil, true) then
        if card.ability.extra.rounds > 0 then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
        end
        if card.ability.extra.rounds <= 0 then
            return {
                message = ina_evolve(card, forced_key)
            }
        elseif card.ability.extra.rounds > 0 then
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                { message = localize("ina_evolve_level") })
        end
    elseif can_evolve(self, card, context, forced_key, nil, true) then
        if card.ability.extra.rounds > 0 then
            card.ability.extra.rounds = card.ability.extra.rounds - 1
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil,
                { message = localize("ina_evolve_level") })
        end
    end
    if can_evolve(self, card, context, forced_key, nil, true) and card.ability.extra.rounds <= 1 and not card.ability.extra.juiced then
        card.ability.extra.juiced = true
        local eval = function(card)
            return card.ability.extra.rounds and card.ability.extra.rounds <= 1 and
                not card.REMOVED
        end
        juice_card_until(card, eval, true)
    end
end

scaling_evo = function(self, card, context, forced_key, current, target)
    if can_evolve(self, card, context, forced_key) and current >= target then
        return {
            message = ina_evolve(card, forced_key)
        }
    end
    if can_evolve(self, card, context, forced_key, true) and current >= target then
        if not card.ability.extra.juiced then
            card.ability.extra.juiced = true
            local eval = function(card) return current >= target and not card.REMOVED and not G.RESET_JIGGLES end
            juice_card_until(card, eval, true)
        end
    end
end

get_family_keys = function(cardname, custom_prefix, card)
    local keys = {}
    local line = nil
    local extra = nil
    custom_prefix = custom_prefix and 'j_' .. custom_prefix .. '_' or 'j_ina_'
    for k, v in pairs(family) do
        for x, y in pairs(v) do
            if y == cardname or (type(y) == "table" and y.key == cardname) then
                line = v; break
            end
        end
    end
    if line then
        for i = 1, #line do
            if type(line[i]) == "table" then
                local new_table = {}
                new_table.key = custom_prefix .. line[i].key
                for k, v in pairs(line[i]) do
                    if k ~= 'key' then
                        new_table[k] = v
                    end
                end
                table.insert(keys, new_table)
            else
                table.insert(keys, custom_prefix .. line[i])
            end
        end
    else
        table.insert(keys, custom_prefix .. cardname)
    end
    if extra and #extra > 0 then
        for i = 2, #extra do
            if type(extra[i]) == "table" then
                local extra_table = {}
                extra_table.key = custom_prefix .. extra[i].key
                for k, v in pairs(extra[i]) do
                    if k ~= 'key' then
                        extra_table[k] = v
                    end
                end
                table.insert(keys, extra_table)
            else
                table.insert(keys, custom_prefix .. extra[i])
            end
        end
    end
    return keys
end
