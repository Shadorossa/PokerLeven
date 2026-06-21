---@diagnostic disable: undefined-field
-- Dependencies injected via setup() to avoid circular loads
local jo = nil
local ina_joker_page = 1

G.FUNCS.inadex_back = function()
  G.FUNCS.your_collection_jokers()
  G.FUNCS.SMODS_card_collection_page({ cycle_config = { current_option = ina_joker_page } })
  local page = G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders').children[1].children[1]
  page.config.ref_table.current_option = ina_joker_page
  page.config.ref_table.current_option_val = page.config.ref_table.options[ina_joker_page]
end

G.FUNCS.your_collection_inazuma_team_page = function(args)
  if not args or not args.cycle_config then return end
  for j = 1, #G.your_collection do
    for i = #G.your_collection[j].cards, 1, -1 do
      local c = G.your_collection[j]:remove_card(G.your_collection[j].cards[i])
      c:remove()
      c = nil
    end
  end
  local row_start = 1 + (12 * (args.cycle_config.current_option - 1))
  for i = 1, 3 do
    for j = row_start, row_start + 3 do
      local akeys = args.cycle_config.keys
      local key = (type(akeys[j]) == "table" and akeys[j].key) or akeys[j]
      if not akeys[j] then break end
      local card = Card(
        G.your_collection[i].T.x + G.your_collection[i].T.w / 2,
        G.your_collection[i].T.y,
        G.CARD_W, G.CARD_H, nil, G.P_CENTERS[key])
      if type(akeys[j]) == "table" then
        card.ability.extra.form = akeys[j].form
        G.P_CENTERS[key]:set_sprites(card)
      end
      G.your_collection[i]:emplace(card)
    end
    row_start = row_start + 4
  end
  INIT_COLLECTION_CARD_ALERTS()
end

local initialize_previous_menu = function(center)
  local menu = G.SETTINGS.paused and 'inadex_back' or nil
  if menu then
    if center and (center.special == 'Spirit' or (center.config and type(center.config.extra) == 'table' and center.config.extra.special == 'Spirit')) then
      menu = 'your_collection_spirits'
    elseif center and (center.special == 'Manager' or (center.config and type(center.config.extra) == 'table' and center.config.extra.special == 'Manager')) then
      menu = 'your_collection_managers'
    elseif G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders') then
      ina_joker_page = G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders').children[1].children[1].config.ref_table.current_option
    end
  end
  return menu
end

local setup = function(joker_overlays)
  jo = joker_overlays

  local controller_queue_R_cursor_press_ref = Controller.queue_R_cursor_press
  function Controller:queue_R_cursor_press(x, y)
    controller_queue_R_cursor_press_ref(self, x, y)
    local clicked = self.hovering.target or self.focused.target
    if clicked and type(clicked) == 'table' and clicked.config and type(clicked.config) == 'table'
        and clicked.config.center and clicked.facing ~= 'back' and clicked.config.center.ptype then
      local menu = initialize_previous_menu(clicked.config.center)
      LeakScope.snap("close_bench")
      jo.create_overlay_for_joker_properties(clicked.config.center_key, menu)
    end
  end

  local ina_capture_focused_input = Controller.capture_focused_input
  function Controller:capture_focused_input(button, input_type, dt)
    if self.focused then
      local clicked = self.focused.target
      if input_type == 'press' and button == 'rightstick' then
        if clicked and type(clicked) == 'table' and clicked.config and type(clicked.config) == 'table'
            and clicked.config.center and clicked.facing ~= 'back' and clicked.config.center.stage then
          local menu = initialize_previous_menu(clicked.config.center)
          G.SETTINGS.paused = true
          jo.create_overlay_for_joker_properties(clicked.config.center_key, menu)
          self:update_focus()
        end
      end
    end
    return ina_capture_focused_input(self, button, input_type, dt)
  end
end

return { setup = setup }
