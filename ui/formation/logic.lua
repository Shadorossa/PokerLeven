-- Combined pool of all players owned (Jokers + Bench)
Pokerleven.get_all_owned_players = function()
  local pool = {}
  local seen = {}

  if G.jokers and G.jokers.cards then
    for _, card in ipairs(G.jokers.cards) do
      if card.ability and card.ability.extra and card.ability.extra.pposition then
        table.insert(pool, { card = card, area = "jokers" })
      end
    end
  end

  if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
    for _, card in ipairs(Pokerleven.ina_bench_area.cards) do
      if card.ability and card.ability.extra and card.ability.extra.pposition then
        table.insert(pool, { card = card, area = "bench" })
      end
    end
  end

  return pool
end

-- Validate and heal formation assignments mapping to owned players
Pokerleven.heal_formation_assignments = function()
  local form_type = G.GAME.ina_formation_type or "pachanga"
  local max_slots = (form_type == "partido") and 11 or 5
  local owned_players = Pokerleven.get_all_owned_players()
  local num_owned = #owned_players
  G.GAME.ina_formation_assignments = G.GAME.ina_formation_assignments or {}

  -- Clear slots beyond the mode limit
  for i = max_slots + 1, 11 do
    G.GAME.ina_formation_assignments[i] = nil
  end

  local assigned_uids = {}
  for i = 1, max_slots do
    local uid = G.GAME.ina_formation_assignments[i]
    local found = false
    -- Verify the player UID is still owned
    if uid then
      for _, p in ipairs(owned_players) do
        if p.card.unique_val == uid then
          found = true
          break
        end
      end
    end

    if found and not assigned_uids[uid] then
      assigned_uids[uid] = true
    else
      G.GAME.ina_formation_assignments[i] = nil
    end
  end

  -- Auto-assign unassigned owned players
  for _, p in ipairs(owned_players) do
    local uid = p.card.unique_val
    if not assigned_uids[uid] then
      for i = 1, max_slots do
        if not G.GAME.ina_formation_assignments[i] then
          G.GAME.ina_formation_assignments[i] = uid
          assigned_uids[uid] = true
          break
        end
      end
    end
  end
end

-- Calculate complete chemistry statistics based on assignments
Pokerleven.get_chemistry_stats = function()
  Pokerleven.heal_formation_assignments()

  local form_type = G.GAME.ina_formation_type or "pachanga"
  local max_slots = (form_type == "partido") and 11 or 5
  local formation_name = G.GAME.ina_current_formation or ((form_type == "partido") and "4-3-3" or "1-2-1")
  local slots = Pokerleven.formations[formation_name] or Pokerleven.formations["1-2-1"]
  local links = Pokerleven.formation_links[formation_name]

  local stats = {
    team_chem = 0,
    max_chem = 0,
    player_chems = {},
    link_details = {},
    links_list = {},
    boost = 1.0,
  }

  local owned_players = Pokerleven.get_all_owned_players()
  stats.max_chem = math.min(max_slots, #owned_players) * 3

  if #owned_players == 0 then
    return stats
  end

  local players = {}
  for i = 1, max_slots do
    local uid = G.GAME.ina_formation_assignments[i]
    local card = nil
    if uid then
      for _, p in ipairs(owned_players) do
        if p.card.unique_val == uid then
          card = p.card
          break
        end
      end
    end

    if card then
      local pos = card.ability and card.ability.extra and card.ability.extra.pposition
      if not pos and card.config and card.config.center_key then
        local center = G.P_CENTERS[card.config.center_key]
        pos = center and center.pposition
      end

      players[i] = {
        card = card,
        pos = pos,
        name = card.config.center.name or ("Joker " .. i),
        team = card.ability.extra.pteam,
        nation = card.ability.extra.pnation,
        gender = card.ability.extra.pgender,
        ptype = card.ability.extra.ptype,
        pyear = card.ability.extra.pyear,
        chem = 0,
      }
    else
      players[i] = nil
    end
  end

  -- 1. Position suitability (+1 chem if position matches slot)
  for i = 1, max_slots do
    if players[i] then
      if players[i].pos == slots[i] then
        players[i].chem = players[i].chem + 1
      end
    end
  end

  -- 2. Link chemistry
  if links then
    for _, link in ipairs(links) do
      local idx1, idx2 = link[1], link[2]
      local p1 = players[idx1]
      local p2 = players[idx2]

      if p1 and p2 then
        local link_points = 0
        local matching = {}

        if p1.nation and p2.nation and p1.nation == p2.nation then
          link_points = link_points + 1
          table.insert(matching, "País")
        end
        if p1.team and p2.team and p1.team == p2.team then
          link_points = link_points + 1
          table.insert(matching, "Equipo")
        end
        if p1.ptype and p2.ptype and p1.ptype == p2.ptype then
          link_points = link_points + 1
          table.insert(matching, "Elemento")
        end
        if p1.pyear and p2.pyear and p1.pyear == p2.pyear then
          link_points = link_points + 1
          table.insert(matching, "Curso")
        end

        local quality = "Gris"
        if link_points >= 3 then
          quality = "Verde"
          p1.chem = p1.chem + 2
          p2.chem = p2.chem + 2
        elseif link_points == 2 then
          quality = "Amarillo"
          p1.chem = p1.chem + 1
          p2.chem = p2.chem + 1
        elseif link_points == 1 then
          quality = "Rojo"
          p1.chem = p1.chem + 0.5
          p2.chem = p2.chem + 0.5
        end

        local link_str = string.format("%s ↔ %s: %s", slots[idx1], slots[idx2], quality)
        if #matching > 0 then
          link_str = link_str .. " (" .. table.concat(matching, ", ") .. ")"
        end
        table.insert(stats.link_details, { text = link_str, quality = quality })
        table.insert(stats.links_list, { idx1 = idx1, idx2 = idx2, quality = quality })
      end
    end
  end

  -- Cap each player's chemistry to 3
  for i = 1, max_slots do
    if players[i] then
      players[i].chem = math.min(3, players[i].chem)
      stats.team_chem = stats.team_chem + players[i].chem
      stats.player_chems[i] = players[i].chem
    end
  end

  if stats.max_chem > 0 then
    local ratio = stats.team_chem / stats.max_chem
    stats.boost = 1.0 + 0.30 * ratio
  end

  return stats
end

Pokerleven.calculate_chemistry_boost = function()
  local stats = Pokerleven.get_chemistry_stats()
  return stats.boost
end
