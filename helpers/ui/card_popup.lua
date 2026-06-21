-- Agrupar las badges (tags) en la descripción del Joker en una cuadrícula de 2 columnas de manera segura
local orig_card_h_popup = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    local ui = orig_card_h_popup(card)

    -- Wittz mark tooltip
    if card and card.ability and card.ability.wittz_tally then
        local wittz_box = {
            n = G.UIT.R,
            config = {align = 'cm', colour = G.C.L_BLACK, r = 0.1, padding = 0.05, outline = 0.5, outline_colour = G.C.RED},
            nodes = {
                {n = G.UIT.R, config = {align = 'cm', padding = 0.02},
                    nodes = {{n = G.UIT.T, config = {text = "Marca de Wittz", colour = G.C.RED, scale = 0.35, shadow = true}}}},
                {n = G.UIT.R, config = {align = 'cm', padding = 0.02},
                    nodes = {{n = G.UIT.T, config = {text = "Ciegas: " .. card.ability.wittz_tally, colour = G.C.UI.TEXT_LIGHT, scale = 0.3}}}},
            }
        }
        if ui and ui.nodes then
            table.insert(ui.nodes, 1, wittz_box)
        end
    end

    local function find_and_reformat_badges(node)
        if type(node) ~= 'table' then return false end

        if node.n == G.UIT.R and node.nodes and #node.nodes > 1 then
            local is_badges = true
            for _, child in ipairs(node.nodes) do
                if type(child) ~= 'table' or child.n ~= G.UIT.R or not child.nodes or #child.nodes ~= 1 then
                    is_badges = false; break
                end
                local inner = child.nodes[1]
                if type(inner) ~= 'table' or inner.n ~= G.UIT.R or not inner.config or not inner.config.colour then
                    is_badges = false; break
                end
            end

            if is_badges then
                local old_badges = node.nodes
                local grouped_badges, current_row = {}, {}
                for i, badge in ipairs(old_badges) do
                    table.insert(current_row, {n=G.UIT.C, config={align="cm", padding=0.015}, nodes={badge}})
                    if #current_row >= 2 or i == #old_badges then
                        table.insert(grouped_badges, {n=G.UIT.R, config={align="cm", padding=0}, nodes=current_row})
                        current_row = {}
                    end
                end
                node.nodes = {{n=G.UIT.C, config={align="cm", padding=0}, nodes=grouped_badges}}; return true
            end
        end

        if node.nodes then for _, child in ipairs(node.nodes) do if find_and_reformat_badges(child) then return true end end end
        return false
    end

    if ui then find_and_reformat_badges(ui) end
    return ui
end

---Creates UI for type information
---@param card Card
---@return table
Pokerleven.get_type_ui = function(card)
    if Pokerleven.is_manager(card) then
        return {
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = { localize("ina_manager_info") },
                        colours = { G.ARGS.LOC_COLOURS["pink"] },
                        bump = true,
                        silent = true,
                        pop_in = 0,
                        pop_in_rate = 4,
                        maxw = 5,
                        shadow = true,
                        y_offset = 0,
                        spacing = math.max(0, 0.32 * (17 - #localize("ina_manager_info"))),
                        scale = (0.4 - 0.004 * #localize("ina_manager_info"))
                    })
                }
            }
        }
    end

    if Pokerleven.is_spirit(card) then
        return {
            {
                n = G.UIT.O,
                config = {
                    object = DynaText({
                        string = { localize("ina_spirit_info") },
                        colours = { G.C.PURPLE },
                        bump = true,
                        silent = true,
                        pop_in = 0,
                        pop_in_rate = 4,
                        maxw = 5,
                        shadow = true,
                        y_offset = 0,
                        spacing = math.max(0, 0.32 * (17 - #localize("ina_spirit_info"))),
                        scale = (0.4 - 0.004 * #localize("ina_spirit_info"))
                    })
                }
            }
        }
    end

    local extra = card.ability.extra
    local type_text = localize("ina_" .. (extra.ptype or "Fire"))
    local position_text = localize("ina_" .. (extra.pposition or "FW"))
    local dorsal_text = extra.pdorsal and ("#" .. extra.pdorsal) or nil
    local gender_text = (extra.pgender and extra.pgender ~= "UNKNOWN") and localize("ina_" .. extra.pgender) or nil
    local year_text = (extra.pyear and extra.pyear ~= "UNKNOWN") and localize("ina_" .. extra.pyear) or nil
    local nation_text = (extra.pnation and extra.pnation ~= "UNKNOWN") and localize("ina_" .. extra.pnation) or nil
    local special_text = (extra.special and extra.special ~= "UNKNOWN") and localize("ina_" .. extra.special) or nil

    -- Base text for scale calculation (approximate)
    local full_text = type_text .. " / " .. position_text
    if dorsal_text then full_text = full_text .. " / " .. dorsal_text end
    if gender_text then full_text = full_text .. " / " .. gender_text end
    if year_text then full_text = full_text .. " / " .. year_text end
    if nation_text then full_text = full_text .. " / " .. nation_text end

    local common_scale = math.min(0.40, (0.40 - 0.003 * #full_text))

    local function create_dyna_node(text, color)
        return {
            n = G.UIT.O,
            config = {
                object = DynaText({
                    string = { text },
                    colours = { color or G.C.UI.TEXT_LIGHT },
                    bump = true,
                    silent = true,
                    pop_in = 0,
                    pop_in_rate = 4,
                    maxw = 5,
                    shadow = true,
                    y_offset = 0,
                    spacing = math.max(0, 0.1),
                    scale = common_scale
                })
            }
        }
    end

    local function get_separator()
        return {
            n = G.UIT.T,
            config = {
                text = " / ",
                colour = G.C.UI.TEXT_LIGHT,
                scale = common_scale
            }
        }
    end

    local nodes = {}
    -- Type
    local type_color = (G.ARGS and G.ARGS.LOC_COLOURS) and G.ARGS.LOC_COLOURS[string.lower(extra.ptype or "fire")] or G.C.WHITE
    table.insert(nodes, create_dyna_node(type_text, type_color))
    -- Position
    table.insert(nodes, get_separator())
    local pos_color = (G.ARGS and G.ARGS.LOC_COLOURS) and G.ARGS.LOC_COLOURS[string.lower(extra.pposition or "fw")] or G.C.WHITE
    table.insert(nodes, create_dyna_node(position_text, pos_color))

    -- Optional fields
    if dorsal_text then
        table.insert(nodes, get_separator())
        table.insert(nodes, create_dyna_node(dorsal_text, G.C.ORANGE))
    end

    if gender_text then
        local gender_color = (extra.pgender == "M") and G.C.BLUE or ((G.ARGS and G.ARGS.LOC_COLOURS) and G.ARGS.LOC_COLOURS["pink"] or G.C.WHITE)
        table.insert(nodes, get_separator())
        table.insert(nodes, create_dyna_node(gender_text, gender_color))
    end

    if year_text then
        table.insert(nodes, get_separator())
        table.insert(nodes, create_dyna_node(year_text, G.C.WHITE))
    end

    if nation_text then
        table.insert(nodes, get_separator())

        local nation_configs = {
            Japan = {{"J", G.C.WHITE}, {"P", G.C.RED}, {"N", G.C.WHITE}},
            Spain = {{"E", G.C.RED}, {"S", G.C.GOLD}, {"P", G.C.RED}},
            Italy = {{"I", G.C.GREEN}, {"T", G.C.WHITE}, {"A", G.C.RED}},
            France = {{"F", G.C.BLUE}, {"R", G.C.WHITE}, {"A", G.C.RED}},
            USA = {{"U", G.C.BLUE}, {"S", G.C.WHITE}, {"A", G.C.RED}},
            Korea = {{"K", G.C.WHITE}, {"O", G.C.RED}, {"R", G.C.BLUE}},
            England = {{"E", G.C.WHITE}, {"N", G.C.RED}, {"G", G.C.WHITE}},
            Germany = {{"G", G.C.BLACK or G.C.UI.TEXT_DARK}, {"E", G.C.RED}, {"R", G.C.GOLD}},
            Brazil = {{"B", G.C.GREEN}, {"R", G.C.GOLD}, {"A", G.C.BLUE}},
            Argentina = {{"A", G.C.BLUE}, {"R", G.C.WHITE}, {"G", G.C.BLUE}}
        }

        local config = nation_configs[extra.pnation]
        if config then
            for _, char_data in ipairs(config) do
                table.insert(nodes, {
                    n = G.UIT.T,
                    config = {
                        text = char_data[1],
                        colour = char_data[2],
                        scale = common_scale,
                        shadow = true
                    }
                })
            end
        else
            -- Fallback for unknown configurations
            table.insert(nodes, {
                n = G.UIT.T,
                config = {
                    text = nation_text,
                    colour = G.C.WHITE,
                    scale = common_scale,
                    shadow = true
                }
            })
        end
    end

    if special_text then
        table.insert(nodes, get_separator())
        table.insert(nodes, create_dyna_node(special_text, G.ARGS.LOC_COLOURS["pink"]))
    end

    return nodes
end


---Generates Joker's description UI. This is done to add:
---* Type information under names
---* Some tooltips to info_queue automatically
---@param self table
---@param info_queue table
---@param card Card
---@param desc_nodes table
---@param specific_vars table
---@param full_UI_table table
Pokerleven.generate_info_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    if card and card.ability and card.ability.ina_small_sticker then
        info_queue[#info_queue + 1] = {key = card.ability.ina_small_sticker, set = 'Other'}
    end

    local is_spirit = false
    local ex = nil
    if card and card.ability and type(card.ability.extra) == 'table' and card.ability.extra.special == 'Spirit' then
        is_spirit, ex = true, card.ability.extra
    elseif self and self.config and type(self.config.extra) == 'table' and self.config.extra.special == 'Spirit' then
        is_spirit, ex = true, self.config.extra
    end

    if is_spirit and ex and get_max_charges(ex) then
        local max_charges = get_max_charges(ex)
        local charges, spent, tech = ex.charges or max_charges, ex.charges_spent or 0, ex.tech_level or 0
        local req = math.max(1, math.ceil(max_charges * 0.25 * math.max(1, tech)))

        if tech >= 5 then
            info_queue[#info_queue + 1] = {key = 'ina_spirit_charges_max', set = 'Other', vars = {charges, max_charges}}
        else
            info_queue[#info_queue + 1] = {key = 'ina_spirit_charges', set = 'Other', vars = {charges, max_charges, spent, req}}
        end
    end

    if card and card.thaddeus_transform then
        info_queue[#info_queue + 1] = {key = 'fate_tooltip', set = 'Other', vars = {card.thaddeus_transform.blinds_remaining}}
    end

    SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)

    if desc_nodes == full_UI_table.main then
        -- Add type information under names
        full_UI_table.name = {
            {
                n = G.UIT.C,
                config = { align = "cm", padding = 0.05 },
                nodes = {
                    {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = full_UI_table.name
                    },
                    {
                        n = G.UIT.R,
                        config = { align = "cm" },
                        nodes = Pokerleven.get_type_ui(card)
                    },
                }
            }
        }
    end
end
