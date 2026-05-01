Pokerleven.gacha_selected_teams = Pokerleven.gacha_selected_teams or {}
Pokerleven.gacha_selected_count = Pokerleven.gacha_selected_count or 0
Pokerleven.gacha_selected_coin = Pokerleven.gacha_selected_coin or nil

Pokerleven.gacha_team_mapping = {
    bl_ina_raimon = "ina_team_Raimon",
    bl_ina_occult = "ina_team_Occult",
    bl_ina_royal_blind = "ina_team_RoyalAcademy",
    bl_ina_wild = "ina_team_Wild",
    bl_ina_brain = "ina_team_Brain",
    bl_ina_otaku = "ina_team_Otaku",
    bl_ina_farm = "ina_team_Farm",
    bl_ina_inazuma_eleven = "ina_team_InazumaEleven",
    bl_ina_kirkwood = "ina_team_Kirkwood",
    bl_ina_shuriken = "ina_team_Shuriken",
    bl_ina_zeus = "ina_team_Zeus",
    bl_ina_tormenta_geminis = "ina_team_TormentaDeGeminis",
    bl_ina_spfixers = "ina_team_ServicioSecreto",
    bl_ina_alpine = "ina_team_Alpino",
    bl_ina_epsilon = "ina_team_Epsilon",
    bl_ina_RRedux = "ina_team_RoyalRedux",
    bl_ina_epsilonplus = "ina_team_Epsilon",
    bl_ina_Prominence = "ina_team_Prominence",
    bl_ina_Diamond = "ina_team_PolvodeDiamantes",
    bl_ina_cloister = "ina_team_ClaustroSagrado",
    bl_ina_osakaccc = "ina_team_OsakaCCC",
    bl_ina_fauxshore = "ina_team_Fauxshore",
    bl_ina_marytimes = "ina_team_MaryTimes",
    bl_ina_Genesis = "ina_team_Genesis"
}

Pokerleven.gacha_base_rates = {
    blue = { Common = 80, Uncommon = 18, Rare = 1.89, Top = 0.1, Legendary = 0.01 },
    red = { Common = 60, Uncommon = 30, Rare = 8, Top = 1.9, Legendary = 0.1 },
    silver = { Common = 30, Uncommon = 45, Rare = 20, Top = 4, Legendary = 1 },
    purple = { Common = 10, Uncommon = 40, Rare = 35, Top = 12, Legendary = 3 },
    gold = { Common = 1, Uncommon = 19, Rare = 45, Top = 25, Legendary = 10 }
}

Pokerleven.get_gacha_rates = function(coin_id)
    local rates = Pokerleven.gacha_base_rates[coin_id or 'blue']
    
    -- 1. Identify selected teams
    local active_teams = {}
    for k, v in pairs(Pokerleven.gacha_selected_teams) do
        if v and Pokerleven.gacha_team_mapping[k] then
            active_teams[Pokerleven.gacha_team_mapping[k]] = true
        end
    end

    -- 2. Scan G.P_CENTERS for counts (Density/Bulk)
    local cards_by_rarity = { [1] = 0, [2] = 0, [3] = 0, ["ina_top"] = 0, [4] = 0 }
    local total_cards = 0
    local pool_by_rarity = { [1] = {}, [2] = {}, [3] = {}, ["ina_top"] = {}, [4] = {} }
    
    for _, v in pairs(G.P_CENTERS) do
        if v.pteam and active_teams[v.pteam] then
            -- Allow if it's NOT auxiliary OR if it's an unlocked auxiliary (like IJ with voucher)
            if not v.aux_ina or player_in_pool(v) then
                local r = v.rarity
                if cards_by_rarity[r] ~= nil then
                    cards_by_rarity[r] = cards_by_rarity[r] + 1
                    total_cards = total_cards + 1
                    pool_by_rarity[r][v.pteam] = true
                end
            end
        end
    end

    -- 3. Calculate weights based on Density (Bulk)
    local rarity_config = {
        { val = 4, name = "Legendary" },
        { val = "ina_top", name = "Top" },
        { val = 3, name = "Rare" },
        { val = 2, name = "Uncommon" },
        { val = 1, name = "Common" }
    }
    
    local final_rates = {}
    local total_weight = 0
    local adjusted_weights = {}
    
    for _, cfg in ipairs(rarity_config) do
        local count = cards_by_rarity[cfg.val] or 0
        -- Rate is diluted by the ratio of this rarity vs total cards
        local weight = (rates[cfg.name] or 0) * (count / math.max(1, total_cards))
        adjusted_weights[cfg.val] = weight
        total_weight = total_weight + weight
    end

    if total_weight > 0 then
        for r_val, weight in pairs(adjusted_weights) do
            final_rates[r_val] = (weight / total_weight) * 100
        end
    else
        for r_val, _ in pairs(cards_by_rarity) do final_rates[r_val] = 0 end
    end
    
    return final_rates, pool_by_rarity
end

G.FUNCS.can_ina_gacha_roll = function(e)
    if Pokerleven.gacha_selected_coin and (G.GAME.ina_gacha_coins[Pokerleven.gacha_selected_coin] or 0) > 0 and Pokerleven.gacha_selected_count >= 2 then
        e.config.colour = G.C.GREEN
        e.config.button = 'ina_gacha_roll'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
    end
end

-- Update Gacha Tooltips and labels manually to avoid menu refresh
local function update_gacha_ui_silent(e)
    if not e or not e.UIBox then return end
    
    -- 1. Update the "Selected Teams" counter label
    local count_node = e.UIBox:get_UIE_by_ID('gacha_selected_count_text')
    if count_node and count_node.config.object then
        -- DynaText will auto-update
    end

    -- 2. Update tooltips for all coin buttons
    local coin_ids = {'blue', 'red', 'silver', 'purple', 'gold'}
    for _, id in ipairs(coin_ids) do
        local node = e.UIBox:get_UIE_by_ID('gacha_coin_' .. id)
        if node then
            local dyn_rates = Pokerleven.get_gacha_rates(id)
            node.config.on_demand_tooltip.text = {
                "Común: " .. (math.floor(dyn_rates[1]*100)/100) .. "%", 
                "Inusual: " .. (math.floor(dyn_rates[2]*100)/100) .. "%", 
                "Raro: " .. (math.floor(dyn_rates[3]*100)/100) .. "%", 
                "Destacado: " .. (math.floor(dyn_rates["ina_top"]*100)/100) .. "%", 
                "Legendario: " .. (math.floor(dyn_rates[4]*100)/100) .. "%"
            }
        end
    end

    -- 3. Update the Roll button state
    local roll_node = e.UIBox:get_UIE_by_ID('gacha_roll_button')
    if roll_node then
        G.FUNCS.can_ina_gacha_roll(roll_node)
    end
end

G.FUNCS.ina_gacha_toggle_team = function(e)
  local key = e.config.ref_table.key

  if Pokerleven.gacha_selected_teams[key] then
      Pokerleven.gacha_selected_teams[key] = false
      Pokerleven.gacha_selected_count = Pokerleven.gacha_selected_count - 1
      e.config.colour = G.C.CLEAR
      play_sound('cancel', 1, 0.3)
  else
      if Pokerleven.gacha_selected_count < 5 then
          Pokerleven.gacha_selected_teams[key] = true
          Pokerleven.gacha_selected_count = Pokerleven.gacha_selected_count + 1
          e.config.colour = adjust_alpha(G.C.GREEN, 0.4)
          play_sound('button', 1, 0.3)
      else
          play_sound('cancel', 0.5, 0.3)
      end
  end
  update_gacha_ui_silent(e)
end

G.FUNCS.ina_gacha_toggle_coin = function(e)
  local coin_id = e.config.ref_table.coin_id

  if Pokerleven.gacha_selected_coin == coin_id then
      Pokerleven.gacha_selected_coin = nil
      e.config.colour = G.C.CLEAR
      play_sound('cancel', 1, 0.3)
  else
      if Pokerleven.gacha_selected_coin then
          local prev_coin_node = e.UIBox:get_UIE_by_ID('gacha_coin_' .. Pokerleven.gacha_selected_coin)
          if prev_coin_node then
              prev_coin_node.config.colour = G.C.CLEAR
          end
      end
      Pokerleven.gacha_selected_coin = coin_id
      e.config.colour = adjust_alpha(G.C.GREEN, 0.4)
      play_sound('button', 1, 0.3)
  end
  update_gacha_ui_silent(e)
end

G.FUNCS.ina_gacha_roll = function(e)
  local coin_id = Pokerleven.gacha_selected_coin
  if not coin_id then return end
  G.GAME.ina_gacha_coins = G.GAME.ina_gacha_coins or {blue = 0, red = 0, silver = 0, purple = 0, gold = 0}
  
  if Pokerleven.gacha_selected_count < 2 then
      play_sound('cancel', 0.5, 0.3)
      return
  end

  if G.GAME.ina_gacha_coins[coin_id] <= 0 then
      play_sound('cancel', 0.5, 0.3)
      return
  end

  if #G.jokers.cards >= G.jokers.config.card_limit then
      play_sound('cancel', 0.5, 0.3)
      return
  end

  -- Restar exactamente 1 moneda
  G.GAME.ina_gacha_coins[coin_id] = G.GAME.ina_gacha_coins[coin_id] - 1
  play_sound('coin3', 1, 0.3)

  local final_rates, pool_by_rarity = Pokerleven.get_gacha_rates(coin_id)
  local total_weight = 0
  for _, v in pairs(final_rates) do total_weight = total_weight + v end

  if total_weight <= 0 then
      play_sound('cancel', 0.5, 0.3)
      return
  end

  -- 4. Roll rarity
  local roll = pseudorandom("gacha_rarity_" .. coin_id .. G.GAME.round_resets.ante) * total_weight
  local rarity_rolled = 1
  local cumulative = 0
  
  local rarity_config = {
      { val = 4 },
      { val = "ina_top" },
      { val = 3 },
      { val = 2 },
      { val = 1 }
  }

  for _, cfg in ipairs(rarity_config) do
      cumulative = cumulative + (final_rates[cfg.val] or 0)
      if roll <= cumulative then
          rarity_rolled = cfg.val
          break
      end
  end

  -- 5. Select a team that HAS this rarity
  local valid_teams = {}
  for t_name, _ in pairs(pool_by_rarity[rarity_rolled]) do
      table.insert(valid_teams, t_name)
  end
  local selected_team = pseudorandom_element(valid_teams, pseudoseed("gacha_team"))

  local card = create_random_ina_joker("gacha_roll", rarity_rolled, G.jokers, selected_team, true)

  card:add_to_deck()
  G.jokers:emplace(card)

  G.FUNCS.ina_gacha_btn()

  if Pokerleven.gacha_area then
      for i = #Pokerleven.gacha_area.cards, 1, -1 do
          local c = Pokerleven.gacha_area:remove_card(Pokerleven.gacha_area.cards[i])
          c:remove()
      end
      local display_card = copy_card(card, nil, 0.9, nil, false)
      display_card.states.hover.can = true
      display_card.states.drag.can = false
      Pokerleven.gacha_area:emplace(display_card)
      display_card:start_materialize()
      display_card:juice_up(0.5, 0.5)
      play_sound('tarot1')
  end
end