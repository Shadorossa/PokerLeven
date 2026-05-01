---@diagnostic disable: undefined-field
Pokerleven.ui = {}
ina_joker_page = 1

local get_upgrade_cards = function(key, card_area)
  local upgrade_cards = {}
  local is_spirit = G.P_CENTERS[key].special == 'Spirit' or (G.P_CENTERS[key].config and type(G.P_CENTERS[key].config.extra) == 'table' and G.P_CENTERS[key].config.extra.special == 'Spirit')
  local limit = is_spirit and 6 or 8
  for i = 1, limit do
    local added_card = SMODS.create_card({
      key = key,
      no_edition = true,
      area = card_area
    })
    
    local ex = added_card.ability.extra
    if ex and type(ex) == 'table' then
      ex.tech_level = math.min(5, i - 1)
      if i > 1 then for _ = 1, ex.tech_level do modify_values(added_card) end end

      if not is_spirit then
        if i == 7 then
          ex.cap_plus = true
          for k, _ in pairs(technique_values) do
              if type(ex[k]) == 'number' and type(added_card.config.center.config.extra[k]) == 'number' then ex[k] = ex[k] * 2 end
          end
        elseif i == 8 then
          ex.cap_plus = true
          ex.cap_plus_max = true
          for k, _ in pairs(technique_values) do
              if type(ex[k]) == 'number' and type(added_card.config.center.config.extra[k]) == 'number' then ex[k] = ex[k] * 4 end
          end
          added_card:set_edition({negative = true}, true, true)
        end
      end
      if set_sticker then set_sticker(added_card) end
    end
    
    table.insert(upgrade_cards, added_card)
  end
  return upgrade_cards
end

local get_form_cards = function(keys, card_area)
  local form_cards = {}
  for _, key in ipairs(keys) do
    local added_card = SMODS.create_card({
      key = key,
      no_edition = true,
      area = card_area
    })
    table.insert(form_cards, added_card)
  end
  return form_cards
end

local get_shadow_forms = function(key, card_area)
  local form_cards = {}
  local base_shadow = SMODS.create_card({
    key = key,
    no_edition = true,
    area = card_area
  })

  local clone_shadow = SMODS.create_card({
    key = key,
    no_edition = true,
    area = card_area
  })
  clone_shadow.ability.extra.clone = true

  table.insert(form_cards, base_shadow)
  table.insert(form_cards, clone_shadow)

  return form_cards
end

local get_teams_for_bobby = function(key, card_area)
  local form_cards = {}
  for team_name, team_table in pairs(C.CUSTOM.Bobby_Teams) do
    local added_card = SMODS.create_card({
      key = key,
      no_edition = true,
      area = card_area
    })
    added_card.children.center:set_sprite_pos({ x = team_table.x, y = team_table.y })
    added_card.ability.extra.pteam = team_name
    table.insert(form_cards, added_card)
  end
  return form_cards
end

Pokerleven.ui.create_card_area_to_area_table = function(card_number, area_table)
  local area_card_size = card_number < 8 and card_number or 8
  local card_area = CardArea(
    G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
    area_card_size * G.CARD_W,
    0.95 * G.CARD_H,
    { card_limit = area_card_size, type = 'title', highlight_limit = 0, collection = true })
  table.insert(area_table, card_area)
  Pokerleven.aux_tab_card_area = card_area
  return card_area
end

Pokerleven.ui.emplace_collection_in_area = function(cards, card_area)
  for _, card in ipairs(cards) do
    card_area:emplace(card)
  end
end

Pokerleven.ui.create_tab_from_card_area = function(card_area)
  return {
    n = G.UIT.ROOT,
    config = {
      align = "cm",
      padding = 0.05,
      colour = G.C.CLEAR,
    },
    nodes = {
      {
        n = G.UIT.R,
        config = {
          align = "cm",
          r = 0.2,
          padding = 0.5,
          minh = 4.5,
          colour = G.C.BLACK
        },
        nodes = {
          {
            n = G.UIT.O,
            config = {
              object = card_area,
            }
          },
        }
      }
    }
  }
end

Pokerleven.ui.create_tabs_menu = function(tabs, previous_menu)
  G.FUNCS.overlay_menu({
    definition = create_UIBox_generic_options({
      back_colour = G.C.ORANGE,
      back_func = previous_menu or 'exit_overlay_menu',
      contents = {
        {
          n = G.UIT.R,
          nodes = {
            create_tabs({
              snap_to_nav = true,
              colour = G.C.PALE_GREEN,
              tabs = tabs
            }),
          }
        },
      }
    })
  })
end

local function create_upgrade_tab_for_joker(key)
  Pokerleven.upgrades_area = {}
  local center = G.P_CENTERS[key]
  if center.special ~= 'Manager' and (not center.config or type(center.config.extra) ~= 'table' or center.config.extra.special ~= 'Manager') then
    local is_spirit = center.special == 'Spirit' or (center.config and type(center.config.extra) == 'table' and center.config.extra.special == 'Spirit')
    return {
      label = is_spirit and "Evolución de EG" or localize("ina_training_upgrades"),
      chosen = true,
      tab_definition_function = function(t)
        local card_area = Pokerleven.ui.create_card_area_to_area_table(is_spirit and 6 or 8, t.area_table)
        local card_upgrade_list = get_upgrade_cards(key, card_area)
        Pokerleven.ui.emplace_collection_in_area(card_upgrade_list, card_area)
        return Pokerleven.ui.create_tab_from_card_area(card_area)
      end,
      tab_definition_function_args = { area_table = Pokerleven.upgrades_area }
    }
  end
end

local function create_forms_tab_for_joker(key)
  Pokerleven.forms_area = {}
  local card_center = G.P_CENTERS[key]
  local keys_to_add = get_family_keys(card_center.name)

  if #keys_to_add > 1 or key == 'j_ina_Bobby' or key == 'j_ina_Shadow' then
    return {
      label = localize("ina_forms"),
      chosen = false,
      tab_definition_function = function(t)
        -- +4 to have a little more space
        local card_area
        if key == 'j_ina_Bobby' then
          card_area = Pokerleven.ui.create_card_area_to_area_table(C.CUSTOM.Bobby_Teams_Number, t.area_table)
          card_form_list = get_teams_for_bobby(key, card_area)
        elseif key == 'j_ina_Shadow' then
          card_area = Pokerleven.ui.create_card_area_to_area_table(2, t.area_table)
          card_form_list = get_shadow_forms(key, card_area)
        else
          card_area = Pokerleven.ui.create_card_area_to_area_table(#keys_to_add, t.area_table)
          card_form_list = get_form_cards(keys_to_add, card_area)
        end

        Pokerleven.ui.emplace_collection_in_area(card_form_list, card_area)
        return Pokerleven.ui.create_tab_from_card_area(card_area)
      end,
      tab_definition_function_args = { area_table = Pokerleven.forms_area }
    }
  end
end

local get_card_keys_from_team = function(team)
  local team_keys = {}
  for _, card in pairs(G.P_CENTERS) do
    if card.pteam == team then
      table.insert(team_keys, card.key)
    end
  end
  return team_keys
end

local function create_team_tab_for_joker(key)
  local card_center = G.P_CENTERS[key]
  local is_spirit = card_center.special == 'Spirit' or (card_center.config and type(card_center.config.extra) == 'table' and card_center.config.extra.special == 'Spirit')
  if not card_center.pteam or is_spirit then return nil end
  local team_cards_keys = get_card_keys_from_team(card_center.pteam)

  return {
    label = localize('ina_team'),
    chosen = false,
    tab_definition_function = function(f)
      local card_area_nodes = {}
      G.your_collection = {}
      local rows = (#team_cards_keys > 4 and #team_cards_keys < 13) and math.ceil(#team_cards_keys / 4) or 3

      Pokerleven.ui.create_row_collection(rows, team_cards_keys, card_area_nodes)

      local tab_nodes = {}
      if #team_cards_keys <= 12 then
        tab_nodes = {
          { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = card_area_nodes }
        }
      else
        local joker_options = {}
        for i = 1, math.ceil(#team_cards_keys / (4 * #G.your_collection)) do
          table.insert(joker_options,
            localize('k_page') ..
            ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#team_cards_keys / (4 * #G.your_collection))))
        end
        tab_nodes = {
          { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = card_area_nodes },
          {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
              create_option_cycle({
                options = joker_options,
                w = 4.5,
                cycle_shoulders = true,
                opt_callback = 'your_collection_inazuma_team_page',
                current_option = 1,
                keys = team_cards_keys,
                colour = G.C.RED,
                no_pips = true,
                focus_args = { snap_to = true, nav = 'wide' }
              })
            }
          }
        }
      end

      return {
        n = G.UIT.ROOT,
        config = { align = "cm", colour = G.C.CLEAR },
        nodes = tab_nodes
      }
    end,
  }
end

Pokerleven.ui.create_row_collection = function(rows, card_keys, card_area_nodes)
  local marker = 1
  for i = 1, rows do
    G.your_collection[i] = Pokerleven.ui.create_card_area()
    table.insert(card_area_nodes, Pokerleven.ui.create_node_for_card_area(G.your_collection[i]))

    local lastcard = math.min(marker + 3, #card_keys)
    for j = marker, lastcard do
      local key = (type(card_keys[j]) == "table" and card_keys[j].key) or card_keys[j]
      local card = Card(G.your_collection[i].T.x + G.your_collection[i].T.w / 2, G.your_collection[i].T.y, G
        .CARD_W,
        G.CARD_H, nil, G.P_CENTERS[key])
      if type(card_keys[j]) == "table" then
        card.ability.extra.form = card_keys[j].form
        G.P_CENTERS[key]:set_sprites(card)
      end
      G.your_collection[i]:emplace(card)
    end
    marker = marker + 4
  end
end

Pokerleven.ui.create_card_area = function(size)
  size = size or 4
  return CardArea(
    G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
    size * G.CARD_W,
    0.95 * G.CARD_H,
    { card_limit = size, type = 'title', highlight_limit = 0, collection = true })
end

Pokerleven.ui.create_node_for_card_area = function(card_area)
  return {
    n = G.UIT.R,
    config = { align = "cm", padding = 0.07, no_fill = true },
    nodes = {
      { n = G.UIT.O, config = { object = card_area } }
    }
  }
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
      local card = Card(G.your_collection[i].T.x + G.your_collection[i].T.w / 2, G.your_collection[i].T.y, G.CARD_W,
        G.CARD_H, nil, G.P_CENTERS[key])
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

Pokerleven.ui.create_overlay_for_joker_properties = function(key, previous_menu)
  local tabs = {}

  local upgrade_tab = create_upgrade_tab_for_joker(key)
  local forms_tab = create_forms_tab_for_joker(key)
  local team_tab = create_team_tab_for_joker(key)

  if upgrade_tab then table.insert(tabs, upgrade_tab) end
  if forms_tab then table.insert(tabs, forms_tab) end
  if team_tab then table.insert(tabs, team_tab) end

  if #tabs > 0 then
    Pokerleven.ui.create_tabs_menu(tabs, previous_menu)
  end
end

G.FUNCS.inadex_back = function()
  G.FUNCS.your_collection_jokers()
  G.FUNCS.SMODS_card_collection_page({ cycle_config = { current_option = ina_joker_page } })
  local page = G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders').children[1].children[1]
  page.config.ref_table.current_option = ina_joker_page
  page.config.ref_table.current_option_val = page.config.ref_table.options[ina_joker_page]
end

local initialize_previous_menu = function(center)
  local menu = G.SETTINGS.paused and 'inadex_back' or nil
  if menu then
    if center and (center.special == 'Spirit' or (center.config and type(center.config.extra) == 'table' and center.config.extra.special == 'Spirit')) then
      menu = 'your_collection_spirits'
    elseif center and (center.special == 'Manager' or (center.config and type(center.config.extra) == 'table' and center.config.extra.special == 'Manager')) then
      menu = 'your_collection_managers'
    elseif G.OVERLAY_MENU:get_UIE_by_ID('cycle_shoulders') then
      ina_joker_page = G.OVERLAY_MENU:get_UIE_by_ID(
        'cycle_shoulders').children[1].children[1].config.ref_table.current_option
    end
  end
  return menu
end

local controller_queue_R_cursor_press_ref = Controller.queue_R_cursor_press
function Controller:queue_R_cursor_press(x, y)
  controller_queue_R_cursor_press_ref(self, x, y)
  local clicked = self.hovering.target or self.focused.target
  if clicked and type(clicked) == 'table' and clicked.config and type(clicked.config) == 'table' and clicked.config.center and clicked.facing ~= 'back'
      and clicked.config.center.ptype then
    local menu = initialize_previous_menu(clicked.config.center)
    LeakScope.snap("close_bench")

    Pokerleven.ui.create_overlay_for_joker_properties(clicked.config.center_key, menu)
  end
end

local ina_capture_focused_input = Controller.capture_focused_input
function Controller:capture_focused_input(button, input_type, dt)
  if self.focused then
    local clicked = self.focused.target
    if input_type == 'press' and button == 'rightstick' then
      if clicked and type(clicked) == 'table' and clicked.config and type(clicked.config) == 'table' and clicked.config.center and clicked.facing ~= 'back' then
        if clicked.config.center.stage then
          local menu = initialize_previous_menu(clicked.config.center)
          G.SETTINGS.paused = true
          Pokerleven.ui.create_overlay_for_joker_properties(clicked.config.center_key, menu)
          self:update_focus()
        end
      end
    end
  end

  return ina_capture_focused_input(self, button, input_type, dt)
end

--#region Config tab

local restart_toggles_left = {
}

local restart_toggles_right = {
  { ref_value = "winners_jokers", label = "ina_settings_winners_jokers" },
  { ref_value = "oc_jokers",      label = "ina_settings_oc_jokers" },
}
local no_restart_toggles = {
  { ref_value = "custom_middle_blinds",    label = "ina_settings_custom_middle_blinds" },
  { ref_value = "middle_blinds_abilities", label = "ina_settings_middle_blinds_abilities" }
}

local create_menu_toggles = function(parent, toggles)
  for k, v in ipairs(toggles) do
    parent.nodes[#parent.nodes + 1] = create_toggle({
      label = localize(v.label),
      ref_table = Pokerleven.config,
      ref_value = v.ref_value,
      callback = function(_set_toggle)
        NFS.write(mod_dir .. "/config.lua", STR_PACK(Pokerleven.config))
      end,
    })
    if v.tooltip then
      parent.nodes[#parent.nodes].config.detailed_tooltip = v.tooltip
    end
  end
end

pokerlevenconfig = function()
  local restart_left_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR, }, nodes = {} }
  create_menu_toggles(restart_left_settings, restart_toggles_left)

  local restart_right_settings = { n = G.UIT.C, config = { align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR, }, nodes = {} }
  create_menu_toggles(restart_right_settings, restart_toggles_right)

  local no_restart_settings = { n = G.UIT.R, config = { align = "tm", padding = 0.05, scale = 0.75, colour = G.C.CLEAR, }, nodes = {} }
  create_menu_toggles(no_restart_settings, no_restart_toggles)

  local config_nodes =
  {
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "cm"
      },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = "No restart required",
            shadow = true,
            scale = 0.75 * 0.8,
            colour = HEX("ED533A")
          }
        }
      },
    },
    no_restart_settings,
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "cm"
      },
      nodes = {
        {
          n = G.UIT.T,
          config = {
            text = "Requires restart",
            shadow = true,
            scale = 0.75 * 0.8,
            colour = HEX("ED533A")
          }
        }
      },
    },
    {
      n = G.UIT.R,
      config = {
        padding = 0,
        align = "tm"
      },
      nodes = { restart_left_settings, restart_right_settings },
    },
  }
  return config_nodes
end

SMODS.current_mod.config_tab = function()
  return {
    n = G.UIT.ROOT,
    config = {
      align = "cm",
      padding = 0.05,
      colour = G.C.CLEAR,
    },
    nodes = pokerlevenconfig()
  }
end

local function create_text_node(text, colour)
  local scale = 0.75
  return {
    n = G.UIT.T,
    config = {
      text = text,
      shadow = true,
      scale = scale * 0.8,
      colour = colour
    }
  }
end

local function create_text_row(text1, text2)
  local nodes = {
    create_text_node(text1, G.C.UI.TEXT_LIGHT)
  }

  if text2 and text2 ~= "" then
    table.insert(nodes, create_text_node(text2, G.C.BLUE))
  end

  return {
    n = G.UIT.R,
    config = {
      padding = 0,
      align = "cm"
    },
    nodes = nodes
  }
end

local create_credits_tab = function()
  return {
    n = G.UIT.ROOT,
    config = {
      align = "cm",
      padding = 0.3,
      colour = G.C.BLACK,
      r = 0.3
    },
    nodes = {
      create_text_row(localize('ina_thanks')),
      create_text_row(localize('ina_lead_developer'), C.CREDITS.lead),
      create_text_row(localize('ina_developers'), C.CREDITS.developers),
      create_text_row(localize('ina_graphic_designers'), C.CREDITS.graphic),
    }
  }
end

SMODS.current_mod.extra_tabs = function()
  return {
    label = localize("ina_credits"),
    tab_definition_function = create_credits_tab
  }
end

Pokerleven.ui.create_UIBox_gacha = function()
  Pokerleven.gacha_selected_teams = Pokerleven.gacha_selected_teams or {}
  Pokerleven.gacha_selected_count = 0
  for k, v in pairs(Pokerleven.gacha_selected_teams) do
      if v then Pokerleven.gacha_selected_count = Pokerleven.gacha_selected_count + 1 end
  end

  G.GAME.ina_gacha_coins = G.GAME.ina_gacha_coins or {blue = 0, red = 0, silver = 0, purple = 0, gold = 0}

  local coin_types = {
      { id = 'blue', name = 'Moneda Azul', pos = {x = 1, y = 1}, rates = { Common = 80, Uncommon = 18, Rare = 1.89, Top = 0.1, Legendary = 0.01 } },
      { id = 'red', name = 'Moneda Roja', pos = {x = 2, y = 1}, rates = { Common = 60, Uncommon = 30, Rare = 8, Top = 1.9, Legendary = 0.1 } },
      { id = 'silver', name = 'Moneda Plateada', pos = {x = 3, y = 1}, rates = { Common = 30, Uncommon = 45, Rare = 20, Top = 4, Legendary = 1 } },
      { id = 'purple', name = 'Moneda Morada', pos = {x = 4, y = 1}, rates = { Common = 10, Uncommon = 40, Rare = 35, Top = 12, Legendary = 3 } },
      { id = 'gold', name = 'Moneda Dorada', pos = {x = 5, y = 1}, rates = { Common = 1, Uncommon = 19, Rare = 45, Top = 25, Legendary = 10 } }
  }

  local coin_nodes = {}
  for _, coin in ipairs(coin_types) do
      local count = G.GAME.ina_gacha_coins[coin.id] or 0
      local coin_sprite = Sprite(0, 0, 0.5, 0.5, G.ASSET_ATLAS['ina_Tags01'], coin.pos)
      coin_sprite:define_draw_steps({{shader = 'dissolve', shadow_height = 0.05}, {shader = 'dissolve'}})
      
      local dyn_rates = Pokerleven.get_gacha_rates(coin.id)
      local tooltip_text = {
        "Común: " .. (math.floor(dyn_rates[1]*100)/100) .. "%", 
        "Inusual: " .. (math.floor(dyn_rates[2]*100)/100) .. "%", 
        "Raro: " .. (math.floor(dyn_rates[3]*100)/100) .. "%", 
        "Destacado: " .. (math.floor(dyn_rates["ina_top"]*100)/100) .. "%", 
        "Legendario: " .. (math.floor(dyn_rates[4]*100)/100) .. "%"
      }
      
      local is_selected = Pokerleven.gacha_selected_coin == coin.id

      table.insert(coin_nodes, {
          n = G.UIT.C, config = { id = 'gacha_coin_' .. coin.id, align = "cm", padding = 0.05, r = 0.1, minw = 0.8, hover = true, button = 'ina_gacha_toggle_coin', ref_table = {coin_id = coin.id}, colour = is_selected and adjust_alpha(G.C.GREEN, 0.4) or G.C.CLEAR, on_demand_tooltip = {title = coin.name, text = tooltip_text} }, nodes = {
              { n = G.UIT.R, config = { align = "cm" }, nodes = {
                  { n = G.UIT.O, config = { object = coin_sprite } }
              }},
              { n = G.UIT.R, config = { align = "cm" }, nodes = {
                  { n = G.UIT.T, config = { text = "x" .. count, scale = 0.35, colour = count > 0 and G.C.WHITE or G.C.UI.TEXT_INACTIVE, shadow = true } }
              }}
          }
      })
  end

  Pokerleven.gacha_area = CardArea(
    0, 0,
    0.9 * G.CARD_W,
    0.9 * G.CARD_H, 
    {card_limit = 1, type = 'title', highlight_limit = 0}
  )

  local left_box = {
    n = G.UIT.C,
    config = { align = "cm", minw = 5, minh = 5, colour = G.C.BLACK, r = 0.1, padding = 0.1, emboss = 0.05 },
    nodes = {
      { n = G.UIT.R, config = { align = "cm", padding = 0.1 }, nodes = {
        { n = G.UIT.T, config = { text = "Equipos Seleccionados", scale = 0.3, colour = G.C.UI.TEXT_LIGHT, shadow = true } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
        { n = G.UIT.O, config = { id = 'gacha_selected_count_text', object = DynaText({string = {{ref_table = Pokerleven, ref_value = 'gacha_selected_count', suffix = " / 5"}}, colours = {G.C.GREEN}, scale = 0.5, shadow = true, silent = true}) } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.1 }, nodes = {
        { n = G.UIT.T, config = { text = "(Mínimo 2)", scale = 0.25, colour = G.C.UI.TEXT_INACTIVE, shadow = true } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = coin_nodes },
      { n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
          UIBox_button({ id = 'gacha_roll_button', button = 'ina_gacha_roll', func = 'can_ina_gacha_roll', label = { "Tirar" }, colour = G.C.GREEN, scale = 0.4, minw = 1.5, minh = 0.6 })
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.1, minh = 1.1 }, nodes = {
        { n = G.UIT.O, config = { object = Pokerleven.gacha_area } }
      }}
    }
  }

  local team_blind_keys = {
    "bl_ina_raimon", "bl_ina_occult", "bl_ina_royal_blind", "bl_ina_wild",
    "bl_ina_brain", "bl_ina_otaku", "bl_ina_farm", "bl_ina_inazuma_eleven",
    "bl_ina_kirkwood", "bl_ina_shuriken", "bl_ina_zeus", "bl_ina_tormenta_geminis",
    "bl_ina_spfixers", "bl_ina_alpine", "bl_ina_epsilon", "bl_ina_RRedux",
    "bl_ina_Prominence", "bl_ina_Diamond", "bl_ina_cloister",
    "bl_ina_osakaccc", "bl_ina_fauxshore", "bl_ina_marytimes", "bl_ina_Genesis"
  }

  local teams_nodes = {}
  for _, key in ipairs(team_blind_keys) do
    local blind_def = G.P_BLINDS[key]
    if blind_def then
      local is_discovered = blind_def.discovered
      local blind_pos = is_discovered and blind_def.pos or G.b_undiscovered.pos
      local blind_atlas = is_discovered and (blind_def.atlas or 'blind_chips') or 'blind_chips'
      local blind_sprite = AnimatedSprite(0,0, 0.75, 0.75, G.ANIMATION_ATLAS[blind_atlas] or G.ANIMATION_ATLAS['blind_chips'], blind_pos)
      blind_sprite:define_draw_steps({{shader = 'dissolve', shadow_height = 0.05}, {shader = 'dissolve'}})
      
      if is_discovered then
          local is_selected = Pokerleven.gacha_selected_teams[key]
          table.insert(teams_nodes, {
            n = G.UIT.C,
            config = { 
                align = "cm", padding = 0.05, r = 0.1, minw = 0.85, minh = 0.85,
                colour = is_selected and adjust_alpha(G.C.GREEN, 0.4) or G.C.CLEAR,
                button = 'ina_gacha_toggle_team',
                ref_table = {key = key},
                hover = true,
            },
            nodes = {
              { n = G.UIT.O, config = { object = blind_sprite } }
            }
          })
      else
          table.insert(teams_nodes, {
            n = G.UIT.C,
            config = { 
                align = "cm", padding = 0.05, r = 0.1, minw = 0.85, minh = 0.85,
                colour = G.C.CLEAR,
            },
            nodes = {
              { n = G.UIT.O, config = { object = blind_sprite } }
            }
          })
      end
    end
  end

  local teams_grid = {}
  local current_row = {}
  for i, node in ipairs(teams_nodes) do
      table.insert(current_row, node)
      if #current_row == 4 or i == #teams_nodes then
          table.insert(teams_grid, {n = G.UIT.R, config = {align = "cm", padding = 0.03}, nodes = current_row})
          current_row = {}
      end
  end

  local right_box = {
    n = G.UIT.C,
    config = { align = "cm", minw = 5.5, minh = 5, colour = G.C.BLACK, r = 0.1, padding = 0.1, emboss = 0.05 },
    nodes = teams_grid
  }

  return create_UIBox_generic_options({ back_func = 'exit_overlay_menu', contents = { { n = G.UIT.R, config = { align = "cm", padding = 0.2 }, nodes = { left_box, { n = G.UIT.C, config = { minw = 0.2 }, nodes = {} }, right_box } } } })
end

G.FUNCS.ina_gacha_btn = function(e)
  play_sound('button', 1, 0.3)
  G.SETTINGS.paused = true
  G.FUNCS.overlay_menu{
    definition = Pokerleven.ui.create_UIBox_gacha(),
  }
end

--#endregion
