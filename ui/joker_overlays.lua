---@diagnostic disable: undefined-field
-- Dependencies injected via setup() to avoid circular loads
local cc, ca, tb = nil, nil, nil

local create_upgrade_tab_for_joker = function(key)
  Pokerleven.upgrades_area = {}
  local center = G.P_CENTERS[key]
  local is_no_training = center.config and center.config.extra and center.config.extra.no_training

  if center.special ~= 'Manager' and (not center.config or type(center.config.extra) ~= 'table' or center.config.extra.special ~= 'Manager') then
    local is_spirit = center.special == 'Spirit' or (center.config and type(center.config.extra) == 'table' and center.config.extra.special == 'Spirit')
    return {
      label = is_spirit and "Evolución de EG" or localize("ina_training_upgrades"),
      chosen = true,
      tab_definition_function = function(t)
        local card_area = ca.create_card_area_to_area_table(is_spirit and 6 or (is_no_training and 3 or 6), t.area_table)
        local card_upgrade_list = cc.get_upgrade_cards(key, card_area, is_no_training)
        ca.emplace_collection_in_area(card_upgrade_list, card_area)
        return tb.create_tab_from_card_area(card_area)
      end,
      tab_definition_function_args = { area_table = Pokerleven.upgrades_area }
    }
  end
end

local create_forms_tab_for_joker = function(key)
  Pokerleven.forms_area = {}
  local card_center = G.P_CENTERS[key]
  local keys_to_add = get_family_keys(card_center.name)

  local is_no_training = card_center.config and card_center.config.extra and card_center.config.extra.no_training
  if not is_no_training and (#keys_to_add > 1 or key == 'j_ina_Bobby' or key == 'j_ina_Shadow') then
    return {
      label = localize("ina_forms"),
      chosen = false,
      tab_definition_function = function(t)
        local card_area, card_form_list
        if key == 'j_ina_Bobby' then
          card_area = ca.create_card_area_to_area_table(C.CUSTOM.Bobby_Teams_Number, t.area_table)
          card_form_list = cc.get_teams_for_bobby(key, card_area)
        elseif key == 'j_ina_Shadow' then
          card_area = ca.create_card_area_to_area_table(2, t.area_table)
          card_form_list = cc.get_shadow_forms(key, card_area)
        else
          card_area = ca.create_card_area_to_area_table(#keys_to_add, t.area_table)
          card_form_list = cc.get_form_cards(keys_to_add, card_area)
        end
        ca.emplace_collection_in_area(card_form_list, card_area)
        return tb.create_tab_from_card_area(card_area)
      end,
      tab_definition_function_args = { area_table = Pokerleven.forms_area }
    }
  end
end

local get_card_keys_from_team = function(team)
  local team_keys = {}
  for _, card in pairs(G.P_CENTERS) do
    if card.pteam == team then table.insert(team_keys, card.key) end
  end
  table.sort(team_keys, function(a, b)
    local card_a = G.P_CENTERS[a]
    local card_b = G.P_CENTERS[b]
    local dorsal_a = card_a and card_a.pdorsal or 999
    local dorsal_b = card_b and card_b.pdorsal or 999
    return dorsal_a < dorsal_b
  end)
  return team_keys
end

local create_team_tab_for_joker = function(key)
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

      ca.create_row_collection(rows, team_cards_keys, card_area_nodes)

      local tab_nodes
      if #team_cards_keys <= 12 then
        tab_nodes = {
          { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = card_area_nodes }
        }
      else
        local joker_options = {}
        for i = 1, math.ceil(#team_cards_keys / (4 * #G.your_collection)) do
          table.insert(joker_options,
            localize('k_page') .. ' ' .. tostring(i) .. '/' .. tostring(math.ceil(#team_cards_keys / (4 * #G.your_collection))))
        end
        tab_nodes = {
          { n = G.UIT.R, config = { align = "cm", r = 0.1, colour = G.C.BLACK, emboss = 0.05 }, nodes = card_area_nodes },
          {
            n = G.UIT.R,
            config = { align = "cm" },
            nodes = {
              create_option_cycle({
                options = joker_options, w = 4.5, cycle_shoulders = true,
                opt_callback = 'your_collection_inazuma_team_page',
                current_option = 1, keys = team_cards_keys,
                colour = G.C.RED, no_pips = true,
                focus_args = { snap_to = true, nav = 'wide' }
              })
            }
          }
        }
      end

      return { n = G.UIT.ROOT, config = { align = "cm", colour = G.C.CLEAR }, nodes = tab_nodes }
    end,
  }
end

local create_overlay_for_joker_properties = function(key, previous_menu)
  local tabs_list = {}

  local upgrade_tab = create_upgrade_tab_for_joker(key)
  local forms_tab   = create_forms_tab_for_joker(key)
  local team_tab    = create_team_tab_for_joker(key)

  if upgrade_tab then table.insert(tabs_list, upgrade_tab) end
  if forms_tab   then table.insert(tabs_list, forms_tab)   end
  if team_tab    then table.insert(tabs_list, team_tab)    end

  if #tabs_list > 0 then
    tb.create_tabs_menu(tabs_list, previous_menu)
  end
end

local setup = function(card_creation, card_areas, tabs)
  cc = card_creation
  ca = card_areas
  tb = tabs
end

return {
  create_overlay_for_joker_properties = create_overlay_for_joker_properties,
  setup = setup,
}
