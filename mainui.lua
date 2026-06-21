---@diagnostic disable: undefined-field
Pokerleven.ui = {}

local ui_path = SMODS.current_mod.path .. "ui/"
local card_creation  = dofile(ui_path .. "card_creation.lua")
local card_areas     = dofile(ui_path .. "card_areas.lua")
local tabs           = dofile(ui_path .. "tabs.lua")
local joker_overlays = dofile(ui_path .. "joker_overlays.lua")
local input_handlers = dofile(ui_path .. "input_handlers.lua")
local config_tab     = dofile(ui_path .. "config_tab.lua")
local credits_tab    = dofile(ui_path .. "credits_tab.lua")
local gacha          = dofile(ui_path .. "gacha.lua")

-- Wire inter-module dependencies
joker_overlays.setup(card_creation, card_areas, tabs)
input_handlers.setup(joker_overlays)

-- Export to Pokerleven.ui namespace for external callers
Pokerleven.ui.create_card_area_to_area_table      = card_areas.create_card_area_to_area_table
Pokerleven.ui.emplace_collection_in_area          = card_areas.emplace_collection_in_area
Pokerleven.ui.create_card_area                    = card_areas.create_card_area
Pokerleven.ui.create_node_for_card_area           = card_areas.create_node_for_card_area
Pokerleven.ui.create_row_collection               = card_areas.create_row_collection
Pokerleven.ui.create_tab_from_card_area           = tabs.create_tab_from_card_area
Pokerleven.ui.create_tabs_menu                    = tabs.create_tabs_menu
Pokerleven.ui.create_overlay_for_joker_properties = joker_overlays.create_overlay_for_joker_properties
Pokerleven.ui.create_UIBox_gacha                  = gacha.create_UIBox_gacha

-- Register SMODS hooks
SMODS.current_mod.config_tab  = config_tab.create_config_tab
SMODS.current_mod.extra_tabs  = credits_tab.create_extra_tabs

-- Setup G.FUNCS that need deferred init
gacha.setup()
