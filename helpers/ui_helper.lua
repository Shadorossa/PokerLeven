---@diagnostic disable: cast-local-type
ina_set_badges = function(self, card, badges)
    local pteam = get_team(card)
    local text_colour = G.C.WHITE
    if pteam then
        local lower_pteam = string.lower(pteam)
        local loc_team = localize(pteam, 'teams')
        if loc_team == 'ERROR' then loc_team = pteam end
        
        -- Seguridad: Si G.ARGS o LOC_COLOURS no existen (pasa a veces al arrancar), usamos un color gris por defecto
        local badge_colour = G.C.GREY
        if G.ARGS and G.ARGS.LOC_COLOURS and G.ARGS.LOC_COLOURS[lower_pteam] then
            badge_colour = G.ARGS.LOC_COLOURS[lower_pteam]
        end
        
        badges[#badges + 1] = create_badge(loc_team, badge_colour, text_colour, 1.2)
    end
    if card.ability and card.ability.ina_small_sticker then
        local sticker_key = card.ability.ina_small_sticker
        local center = G.P_CENTERS[sticker_key] or (SMODS.Stickers and SMODS.Stickers[sticker_key])
        local color = center and center.badge_colour or G.C.PURPLE
        badges[#badges + 1] = create_badge(localize(sticker_key, "labels"), color, text_colour, 1.2)
    end
end

type_tooltip = function(self, info_queue, center)
    local percent
    if center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.ptype then
        info_queue[#info_queue + 1] = { set = 'Other', key = center.ability.extra.ptype }
    end
    if center.ability.extra and type(center.ability.extra) == "table" and center.ability.extra.pposition then
        info_queue[#info_queue + 1] = { set = 'Other', key = center.ability.extra.pposition }
    end
end

apply_property_sticker = function(card, sticker_type, property)
    local inateam_list = { "Forest", "Fire", "Wind", "Mountain" }
    local inaposition_list = { "FW", "DF", "MF", "GK" }
    local apply_type = nil

    if sticker_type then
        apply_type = sticker_type
        card.ability[string.lower(apply_type) .. "_sticker"] = true
    else
        if property == "type" then
            options = {}
            for _, t in ipairs(inateam_list) do
                if t ~= card.ability.extra.ptype then
                    table.insert(options, t)
                end
            end
            apply_type = pseudorandom_element(options, pseudoseed("type"))
        elseif property == "position" then
            options = {}
            for _, p in ipairs(inaposition_list) do
                if p ~= card.ability.extra.pposition then
                    table.insert(options, p)
                end
            end
            apply_type = pseudorandom_element(options, pseudoseed("position"))
        end
        card.ability[string.lower(apply_type) .. "_sticker"] = true
    end

    if property == "type" then
        for _, v in pairs(inateam_list) do
            if string.lower(v) ~= string.lower(apply_type) then
                card.ability[string.lower(v) .. "_sticker"] = false
            end
        end
    end

    if property == "position" then
        for l, v in pairs(inaposition_list) do
            if string.lower(v) ~= string.lower(apply_type) then
                card.ability[string.lower(v) .. "_sticker"] = false
            end
        end
    end

    if property == "type" then
        if card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.ptype then
            card.ability.extra.ptype = apply_type
        end
    end

    if property == "position" then
        if card.ability and card.ability.extra and type(card.ability.extra) == "table" and card.ability.extra.pposition then
            card.ability.extra.pposition = apply_type
        end
    end
end

-- CREDITS
local base_create_badges = SMODS.create_mod_badges
function SMODS.create_mod_badges(obj, badges)
    base_create_badges(obj, badges)

    if obj and obj.ina_credits then
        local function calc_scale_fac(text)
            local size = 0.9
            local font = G.LANG.font
            local max_text_width = 2 - 2 * 0.05 - 4 * 0.03 * size - 2 * 0.03
            local calced_text_width = 0
            for _, c in utf8.chars(text) do
                ---@diagnostic disable-next-line: undefined-field
                local tx = font.FONT:getWidth(c) * (0.33 * size) * G.TILESCALE * font.FONTSCALE
                    ---@diagnostic disable-next-line: undefined-field
                    + 2.7 * 1 * G.TILESCALE * font.FONTSCALE
                calced_text_width = calced_text_width + tx / (G.TILESIZE * G.TILESCALE)
            end
            return calced_text_width > max_text_width and max_text_width / calced_text_width or 1
        end

        local strings = { "Pokerleven" }

        if obj.ina_credits.idea then
            for i = 1, #obj.ina_credits.idea do
                localized = localize({ type = "variable", key = "ina_idea", vars = { obj.ina_credits.idea[i] } })[1]
                strings[#strings + 1] = localized
            end
        end

        if obj.ina_credits.art then
            for i = 1, #obj.ina_credits.art do
                localized = localize({ type = "variable", key = "ina_art", vars = { obj.ina_credits.art[i] } })[1]
                strings[#strings + 1] = localized
            end
        end

        if obj.ina_credits.code then
            for i = 1, #obj.ina_credits.code do
                localized = localize({ type = "variable", key = "ina_code", vars = { obj.ina_credits.code[i] } })[1]
                strings[#strings + 1] = localized
            end
        end

        local scale_fac = {}
        local min_scale_fac = 1
        for i = 1, #strings do
            scale_fac[i] = calc_scale_fac(strings[i])
            min_scale_fac = math.min(min_scale_fac, scale_fac[i])
        end

        local ct = {}
        for i = 1, #strings do
            ct[i] = { string = strings[i] }
        end

        local badge = {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
                {
                    n = G.UIT.R,
                    config = {
                        align = "cm",
                        colour = G.C.RED,
                        r = 0.1,
                        minw = 2 / min_scale_fac,
                        minh = 0.36,
                        emboss = 0.05,
                        padding = 0.03 * 0.9,
                    },
                    nodes = {
                        { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                        {
                            n = G.UIT.O,
                            config = {
                                object = DynaText({
                                    string = ct,
                                    colours = { obj.ina_credits.text_colour or G.C.WHITE },
                                    silent = true,
                                    float = true,
                                    shadow = true,
                                    offset_y = -0.03,
                                    spacing = 1,
                                    scale = 0.33 * 0.9,
                                }),
                            },
                        },
                        { n = G.UIT.B, config = { h = 0.1, w = 0.03 } },
                    },
                },
            },
        }

        badges[#badges] = badge
    end
end

--- Only Mod Blinds
local original_collection_pool = SMODS.collection_pool
SMODS.collection_pool = function(_base_pool)
    local result = original_collection_pool(_base_pool)

    local is_blinds_pool = (_base_pool == G.P_BLINDS)

    if is_blinds_pool then
        local filtered_result = {}
        for _, v in ipairs(result) do
            local is_mod = (type(v.mod) == "string" and (v.mod == "Pokerleven" or v.mod == "Multiplayer"))
                or (type(v.mod) == "table" and (v.mod.id == "Pokerleven" or v.mod.id == "Multiplayer"))
            if is_mod then
                filtered_result[#filtered_result + 1] = v
            end
        end
        return filtered_result
    else
        return result
    end
end

---Creates the UI for jokers in collection
---@return UINode node UI for jokers in collection
create_UIBox_your_collection_jokers = function()
    local filtered_jokers = {}
    for _, joker in ipairs(G.P_CENTER_POOLS.Joker) do
        if not joker.special and joker.ptype then
            table.insert(filtered_jokers, joker)
        end
    end
    return SMODS.card_collection_UIBox(filtered_jokers, { 5, 5, 5 }, {
        no_materialize = true,
        modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
        h_mod = 0.95,
    })
end

--#region Technique UI

---Creates the UI for additions in collection
---@param requirement string special requierment to filter on cards
---@return UINode node UI for additions in collection
create_UIBox_your_collection_addition = function(requirement)
    local filtered_jokers = {}
    for _, joker in ipairs(G.P_CENTER_POOLS.Joker) do
        local sp = joker.special or (joker.config and type(joker.config.extra) == 'table' and joker.config.extra.special)
        if sp and sp == requirement then
            table.insert(filtered_jokers, joker)
        end
    end
    return SMODS.card_collection_UIBox(filtered_jokers, { 5, 5, 5 }, {
        no_materialize = true,
        modify_card = function(card, center) card.sticker = get_joker_win_sticker(center) end,
        h_mod = 0.95,
    })
end

G.FUNCS.your_collection_techniques = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_your_collection_addition("Technique"),
    }
end

G.FUNCS.your_collection_managers = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_your_collection_addition("Manager"),
    }
end

G.FUNCS.your_collection_spirits = function(e)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu {
        definition = create_UIBox_your_collection_addition("Spirit"),
    }
end

local old_modsCollectionTally = modsCollectionTally
modsCollectionTally = function(pool, ...)
    -- Si el pool es el de Jokers, filtramos antes
    if pool == G.P_CENTER_POOLS.Joker then
        local filtered_pool = {}
        for _, card in ipairs(pool) do
            local sp = card.special or (card.config and type(card.config.extra) == 'table' and card.config.extra.special)
            if not sp then
                table.insert(filtered_pool, card)
            end
        end
        return old_modsCollectionTally(filtered_pool, ...)
    end

    -- Para el resto, comportamiento original
    return old_modsCollectionTally(pool, ...)
end

Pokerleven.Extra_Additions = { "Manager", "Spirit" }
if buildAdditionsTab then
    local original_buildAdditionsTab = buildAdditionsTab
    function buildAdditionsTab(mod)
        local tab = original_buildAdditionsTab(mod)
        if not tab then return nil end
        
        if mod.id ~= "Pokerleven" then return tab end

        local old_def = tab.tab_definition_function
        tab.tab_definition_function = function(...)
            local ui = old_def(...)
            local insert_index = 2
            for _, addition in ipairs(Pokerleven.Extra_Additions) do
                local tally_key = string.lower(addition) .. "s"
                local tally = G.DISCOVER_TALLIES[tally_key] or {tally = 0, of = 0}

                if tally.of > 0 then
                    local button_id = "your_collection_" .. tally_key
                    local label_key = "ina_special_" .. string.lower(addition)
                    local addition_node = UIBox_button({
                        button = button_id,
                        label = { localize(label_key) },
                        count = tally,
                        minw = 5,
                        minh = 1.2,
                        scale = 0.6,
                        id = button_id
                    })
                    local tab_nodes = ui.nodes
                    if tab_nodes and tab_nodes[1] and tab_nodes[1].nodes and tab_nodes[1].nodes[1] and tab_nodes[1].nodes[1].nodes then
                        table.insert(tab_nodes[1].nodes[1].nodes, insert_index, addition_node)
                        insert_index = insert_index + 1
                    end
                end
            end
            return ui
        end
        return tab
    end
end

local original_set_discover_tallies = set_discover_tallies
function set_discover_tallies()
    original_set_discover_tallies()
    G.DISCOVER_TALLIES = G.DISCOVER_TALLIES or {}
    G.DISCOVER_TALLIES.managers = {tally = 0, of = 0}
    G.DISCOVER_TALLIES.spirits = {tally = 0, of = 0}
    G.DISCOVER_TALLIES.techniques = {tally = 0, of = 0}
    for _, v in pairs(G.P_CENTERS) do
        if not v.omit then
            local sp = v.special or (v.config and type(v.config.extra) == 'table' and v.config.extra.special)
            if sp == "Manager" then
                G.DISCOVER_TALLIES.managers.of = G.DISCOVER_TALLIES.managers.of + 1
                if v.discovered then G.DISCOVER_TALLIES.managers.tally = G.DISCOVER_TALLIES.managers.tally + 1 end
            elseif sp == "Spirit" then
                G.DISCOVER_TALLIES.spirits.of = G.DISCOVER_TALLIES.spirits.of + 1
                if v.discovered then G.DISCOVER_TALLIES.spirits.tally = G.DISCOVER_TALLIES.spirits.tally + 1 end
            elseif sp == "Technique" then
                G.DISCOVER_TALLIES.techniques.of = G.DISCOVER_TALLIES.techniques.of + 1
                if v.discovered then G.DISCOVER_TALLIES.techniques.tally = G.DISCOVER_TALLIES.techniques.tally + 1 end
            end
        end
    end
end

local original_set_alerts = set_alerts
function set_alerts()
    original_set_alerts()
    if G.ARGS.set_alerts_alertables then
        local alert_manager, alert_spirit, alert_tech = false, false, false
        for _, v in pairs(G.P_CENTERS) do
            if v.discovered and not v.alerted then
                local sp = v.special or (v.config and type(v.config.extra) == 'table' and v.config.extra.special)
                if sp == "Manager" then alert_manager = true end
                if sp == "Spirit" then alert_spirit = true end
                if sp == "Technique" then alert_tech = true end
            end
        end
        local found_man, found_spi, found_tech = false, false, false
        for _, v in ipairs(G.ARGS.set_alerts_alertables) do
            if v.id == 'your_collection_managers' then found_man = true; v.should_alert = alert_manager end
            if v.id == 'your_collection_spirits' then found_spi = true; v.should_alert = alert_spirit end
            if v.id == 'your_collection_techniques' then found_tech = true; v.should_alert = alert_tech end
        end
        if not found_man then table.insert(G.ARGS.set_alerts_alertables, {id = 'your_collection_managers', alert_uibox_name = 'your_collection_managers_alert', should_alert = alert_manager}) end
        if not found_spi then table.insert(G.ARGS.set_alerts_alertables, {id = 'your_collection_spirits', alert_uibox_name = 'your_collection_spirits_alert', should_alert = alert_spirit}) end
        if not found_tech then table.insert(G.ARGS.set_alerts_alertables, {id = 'your_collection_techniques', alert_uibox_name = 'your_collection_techniques_alert', should_alert = alert_tech}) end
        for _, v in ipairs(G.ARGS.set_alerts_alertables) do
            if v.id == 'your_collection_managers' or v.id == 'your_collection_spirits' or v.id == 'your_collection_techniques' then
                if G.OVERLAY_MENU and G.OVERLAY_MENU:get_UIE_by_ID(v.id) then
                    if v.should_alert then
                        if not G[v.alert_uibox_name] then 
                            G[v.alert_uibox_name] = UIBox{
                                definition = create_UIBox_card_alert({red_bad = true}),
                                config = {align="tri", offset = {x = 0.05, y = -0.05}, major = G.OVERLAY_MENU:get_UIE_by_ID(v.id), instance_type = 'ALERT'}
                            }
                            G[v.alert_uibox_name].states.collide.can = false
                        end
                    elseif G[v.alert_uibox_name] then 
                        G[v.alert_uibox_name]:remove(); G[v.alert_uibox_name] = nil
                    end
                elseif G[v.alert_uibox_name] then
                    G[v.alert_uibox_name]:remove(); G[v.alert_uibox_name] = nil
                end
            end
        end
    end
end

--#endregion

-- Agrupar las badges (tags) en la descripción del Joker en una cuadrícula de 2 columnas de manera segura
local orig_card_h_popup = G.UIDEF.card_h_popup
function G.UIDEF.card_h_popup(card)
    local ui = orig_card_h_popup(card)
    
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

local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    local card = e.config.ref_table
    if card.ability.set ~= 'Joker' then
        can_select_card_ref(e)
    elseif Pokerleven.is_manager(card) then
        if (card.edition and card.edition.negative) or
            #Pokerleven.ina_manager_area.cards < Pokerleven.ina_manager_area.config.card_limit then
            e.config.colour = G.C.GREEN
            e.config.button = 'use_card'
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    elseif Pokerleven.is_spirit(card) then
        if (card.edition and card.edition.negative) or
            #Pokerleven.ina_spirits_area.cards < Pokerleven.ina_spirits_area.config.card_limit then
            e.config.colour = G.C.GREEN
            e.config.button = 'use_card'
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    else
        can_select_card_ref(e)
    end
end

---Creates button ui for custom cards
---@param card Card Card you want to create buttons on
---@param args table Table of configs for creating custom buttons
---@return table
Pokerleven.create_custom_buttons = function(card, args)
    local args = args or {}
    local sell = nil
    local use = nil
    local bench = nil

    local is_small = Pokerleven.is_manager(card) or Pokerleven.is_spirit(card)
    local s_fac = is_small and 0.55 or 1

    if args.sell then
        sell = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { ref_table = card, align = "cr", padding = 0.1 * s_fac, r = 0.08, minw = 1.25 * s_fac, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card', handy_insta_action = "sell" },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 * s_fac } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 * s_fac },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('b_sell'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4 * s_fac, shadow = true } }
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('$'), colour = G.C.WHITE, scale = 0.4 * s_fac, shadow = true } },
                                        { n = G.UIT.T, config = { ref_table = card, ref_value = 'sell_cost_label', colour = G.C.WHITE, scale = 0.55 * s_fac, shadow = true } }
                                    }
                                }
                            }
                        }
                    }
                },
            }
        }
    end
    if args.bench or args.unbench then
        bench = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1 * s_fac,
                        r = 0.08,
                        minw = 1.25 * s_fac,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = args.bench and 'bench_card' or 'unbench_card',
                        func = args.bench and 'can_bench_card' or 'can_unbench_card',
                        handy_insta_action = "use"
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 * s_fac } },
                        {
                            n = G.UIT.C,
                            config = { align = "cr" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 * s_fac },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = args.bench and localize('ina_bench') or localize('ina_unbench'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4 * s_fac, shadow = true } }
                                    }
                                }
                            }
                        }
                    }
                },
            }
        }
    end

    return {
        n = G.UIT.ROOT,
        config = {
            align = "cr",
            padding = 0,
            colour = G.C.CLEAR
        },
        nodes = {
            {
                n = G.UIT.C,
                config = { padding = 0.05, align = 'cl' },
                nodes = {
                    sell and {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { sell }
                    } or nil,
                    bench and {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { bench }
                    } or nil
                }
            }
        }
    }
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
            France = {{"F", G.C.BLUE}, {"R", G.C.WHITE}, {"A", G.C.RED}}, -- Blue-White-Red
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

    if is_spirit and ex and (ex.max_charges or ex.max_charges_plasma) then
        local max_charges = ex.max_charges or ex.max_charges_plasma
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

-- Main menu (Stolen from Cryptid)
local game_main_menu_ref = Game.main_menu
function Game:main_menu(change_context)
    local ret = game_main_menu_ref(self, change_context)

    G.SPLASH_BACK:define_draw_steps({
        {
            shader = "splash",
            send = {
                { name = "time",       ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                { name = "vort_speed", val = 0.4 },
                { name = "colour_1",   val = HEX("5A00FF"),  ref_value = "EFFECT" },
                { name = "colour_2",   ref_table = G.C,      ref_value = "BLACK" },
            },
        },
    })

    return ret
end
