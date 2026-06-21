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
