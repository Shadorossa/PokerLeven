---@diagnostic disable: undefined-field

local create_card_area_to_area_table = function(card_number, area_table)
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

local emplace_collection_in_area = function(cards, card_area)
  for _, card in ipairs(cards) do
    card_area:emplace(card)
  end
end

local create_card_area = function(size)
  size = size or 4
  return CardArea(
    G.ROOM.T.x + 0.2 * G.ROOM.T.w / 2, G.ROOM.T.h,
    size * G.CARD_W,
    0.95 * G.CARD_H,
    { card_limit = size, type = 'title', highlight_limit = 0, collection = true })
end

local create_node_for_card_area = function(card_area)
  return {
    n = G.UIT.R,
    config = { align = "cm", padding = 0.07, no_fill = true },
    nodes = { { n = G.UIT.O, config = { object = card_area } } }
  }
end

local create_row_collection = function(rows, card_keys, card_area_nodes)
  local marker = 1
  for i = 1, rows do
    G.your_collection[i] = create_card_area()
    table.insert(card_area_nodes, create_node_for_card_area(G.your_collection[i]))

    local lastcard = math.min(marker + 3, #card_keys)
    for j = marker, lastcard do
      local key = (type(card_keys[j]) == "table" and card_keys[j].key) or card_keys[j]
      local card = Card(
        G.your_collection[i].T.x + G.your_collection[i].T.w / 2,
        G.your_collection[i].T.y,
        G.CARD_W, G.CARD_H, nil, G.P_CENTERS[key])
      if type(card_keys[j]) == "table" then
        card.ability.extra.form = card_keys[j].form
        G.P_CENTERS[key]:set_sprites(card)
      end
      G.your_collection[i]:emplace(card)
    end
    marker = marker + 4
  end
end

return {
  create_card_area_to_area_table = create_card_area_to_area_table,
  emplace_collection_in_area     = emplace_collection_in_area,
  create_card_area               = create_card_area,
  create_node_for_card_area      = create_node_for_card_area,
  create_row_collection          = create_row_collection,
}
