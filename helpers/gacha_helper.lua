Pokerleven.gacha_selected_teams = Pokerleven.gacha_selected_teams or {}
Pokerleven.gacha_selected_count = Pokerleven.gacha_selected_count or 0
Pokerleven.gacha_selected_coin = Pokerleven.gacha_selected_coin or nil

G.FUNCS.can_ina_gacha_roll = function(e)
    if Pokerleven.gacha_selected_coin and (G.GAME.ina_gacha_coins[Pokerleven.gacha_selected_coin] or 0) > 0 and Pokerleven.gacha_selected_count >= 2 then
        e.config.colour = G.C.GREEN
        e.config.button = 'ina_gacha_roll'
    else
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
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

  G.GAME.ina_gacha_coins[coin_id] = G.GAME.ina_gacha_coins[coin_id] - 1
  play_sound('coin3', 1, 0.3)

  local coin_types = {
    blue = { Common = 80, Uncommon = 18, Rare = 1.89, Top = 0.1, Legendary = 0.01 },
    red = { Common = 60, Uncommon = 30, Rare = 8, Top = 1.9, Legendary = 0.1 },
    silver = { Common = 30, Uncommon = 45, Rare = 20, Top = 4, Legendary = 1 },
    purple = { Common = 10, Uncommon = 40, Rare = 35, Top = 12, Legendary = 3 },
    gold = { Common = 1, Uncommon = 19, Rare = 45, Top = 25, Legendary = 10 }
  }
  local rates = coin_types[coin_id]
  
  local roll = pseudorandom("gacha_" .. coin_id .. G.GAME.round_resets.ante) * 100
  local rarity_rolled

  if roll <= rates.Legendary then rarity_rolled = 4
  elseif roll <= rates.Legendary + rates.Top then rarity_rolled = "ina_top"
  elseif roll <= rates.Legendary + rates.Top + rates.Rare then rarity_rolled = 3
  elseif roll <= rates.Legendary + rates.Top + rates.Rare + rates.Uncommon then rarity_rolled = 2
  else rarity_rolled = 1 end

  local selected_teams = {}
  local team_mapping = {
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
      bl_ina_gemini = "ina_team_TormentadeGéminis",
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

  for k, v in pairs(Pokerleven.gacha_selected_teams) do
      if v and team_mapping[k] then
          table.insert(selected_teams, team_mapping[k])
      end
  end

  local selected_team = pseudorandom_element(selected_teams, pseudoseed("gacha_team"))

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