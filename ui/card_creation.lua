---@diagnostic disable: undefined-field

local get_upgrade_cards = function(key, card_area, is_no_training)
  local upgrade_cards = {}
  local center = G.P_CENTERS[key]
  local is_spirit = center.special == 'Spirit' or (center.config and type(center.config.extra) == 'table' and center.config.extra.special == 'Spirit')
  local limit = is_spirit and 6 or 6

  local indices_to_create = {}
  if is_no_training then
    indices_to_create = {1, 7, 8}
    limit = 3
  else
    for i = 1, limit do table.insert(indices_to_create, i) end
  end

  for _, i in ipairs(indices_to_create) do
    local added_card = SMODS.create_card({ key = key, no_edition = true, area = card_area })

    local ex = added_card.ability.extra
    if ex and type(ex) == 'table' then
      ex.tech_level = i

      if not is_spirit then
        if i == 7 then
          ex.cap_plus = true
        elseif i == 8 then
          ex.cap_plus = true
          ex.cap_plus_max = true
          added_card:set_edition({negative = true}, true, true)
        end
      end

      if i > 1 then modify_values(added_card) end
      if set_sticker then set_sticker(added_card) end
    end

    table.insert(upgrade_cards, added_card)
  end
  return upgrade_cards
end

local get_form_cards = function(keys, card_area)
  local form_cards = {}
  for _, key in ipairs(keys) do
    local added_card = SMODS.create_card({ key = key, no_edition = true, area = card_area })
    table.insert(form_cards, added_card)
  end
  return form_cards
end

local get_shadow_forms = function(key, card_area)
  local base_shadow = SMODS.create_card({ key = key, no_edition = true, area = card_area })
  local clone_shadow = SMODS.create_card({ key = key, no_edition = true, area = card_area })
  clone_shadow.ability.extra.clone = true
  return { base_shadow, clone_shadow }
end

local get_teams_for_bobby = function(key, card_area)
  local form_cards = {}
  for team_name, team_table in pairs(C.CUSTOM.Bobby_Teams) do
    local added_card = SMODS.create_card({ key = key, no_edition = true, area = card_area })
    added_card.children.center:set_sprite_pos({ x = team_table.x, y = team_table.y })
    added_card.ability.extra.pteam = team_name
    table.insert(form_cards, added_card)
  end
  return form_cards
end

return {
  get_upgrade_cards  = get_upgrade_cards,
  get_form_cards     = get_form_cards,
  get_shadow_forms   = get_shadow_forms,
  get_teams_for_bobby = get_teams_for_bobby,
}
