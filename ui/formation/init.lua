local path = SMODS.current_mod.path .. "ui/formation/"
dofile(path .. "defs.lua")
dofile(path .. "logic.lua")
local ui_mod = dofile(path .. "ui.lua")

Pokerleven.ui.clean_formation_cards = function()
  local areas = {
    Pokerleven.ui.bench_area,
    Pokerleven.ui.unassigned_area
  }
  for _, area in ipairs(areas) do
    if area then
      for i = #area.cards, 1, -1 do
        area.cards[i]:remove()
      end
    end
  end
  if Pokerleven.ui.slots_cards then
    for i = 1, 11 do
      if Pokerleven.ui.slots_cards[i] then
        Pokerleven.ui.slots_cards[i]:remove()
        Pokerleven.ui.slots_cards[i] = nil
      end
    end
  end
end

local setup = function()
  G.FUNCS.ina_formation_btn = function(e)
    play_sound('button', 1, 0.3)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu{ definition = ui_mod.create_UIBox_formation() }
  end

  G.FUNCS.exit_formation_menu = function(e)
    Pokerleven.ui.clean_formation_cards()
    G.FUNCS.exit_overlay_menu(e)
  end

  G.FUNCS.ina_change_formation_type = function(args)
    if not args or not args.cycle_config then return end
    local type_list = { "pachanga", "partido" }
    G.GAME.ina_formation_type = type_list[args.cycle_config.current_option] or "partido"
    -- Reset current sub-formation to default for that mode
    G.GAME.ina_current_formation = (G.GAME.ina_formation_type == "pachanga") and "1-2-1" or "4-3-3"

    if G.OVERLAY_MENU then
      Pokerleven.ui.clean_formation_cards()
      G.FUNCS.exit_overlay_menu()
      G.FUNCS.ina_formation_btn()
    end
  end

  G.FUNCS.ina_change_formation = function(args)
    if not args or not args.cycle_config then return end
    local form_type = G.GAME.ina_formation_type or "pachanga"
    local formation_list = (form_type == "partido") and { "4-3-3", "4-4-2", "3-5-2", "4-2-3-1" } or { "1-2-1", "2-1-1", "1-1-2", "0-2-2" }
    G.GAME.ina_current_formation = formation_list[args.cycle_config.current_option] or formation_list[1]

    if G.OVERLAY_MENU then
      Pokerleven.ui.clean_formation_cards()
      G.FUNCS.exit_overlay_menu()
      G.FUNCS.ina_formation_btn()
    end
  end

  G.FUNCS.ina_assign_player_to_slot = function(e)
    local ref = e.config.ref_table
    if not ref then return end
    local slot = ref.slot_index
    local joker_uid = ref.joker_uid

    -- Clear existing slot for this player to prevent copies
    for i = 1, 11 do
      if G.GAME.ina_formation_assignments[i] == joker_uid then
        G.GAME.ina_formation_assignments[i] = nil
      end
    end

    G.GAME.ina_formation_assignments[slot] = joker_uid

    if G.OVERLAY_MENU then
      Pokerleven.ui.clean_formation_cards()
      G.FUNCS.exit_overlay_menu()
      G.FUNCS.ina_formation_btn()
    end
  end

  G.FUNCS.ina_unassign_player_from_slot = function(e)
    local ref = e.config.ref_table
    if not ref then return end
    local slot = ref.slot_index
    G.GAME.ina_formation_assignments[slot] = nil

    if G.OVERLAY_MENU then
      Pokerleven.ui.clean_formation_cards()
      G.FUNCS.exit_overlay_menu()
      G.FUNCS.ina_formation_btn()
    end
  end

  -- Handle click on a player card to support click-to-select and click-to-swap/move
  G.FUNCS.ina_click_player_card = function(e)
    local ref = e.config.ref_table
    if not ref then return end

    local clicked_uid = ref.joker_uid
    local clicked_slot = ref.slot_index
    local clicked_area = ref.area -- "slot", "unassigned", "bench", or "empty_slot"

    local selected_uid = G.GAME.ina_selected_player_uid
    local selected_slot = G.GAME.ina_selected_source_slot

    if selected_uid then
      -- A player is already selected
      if clicked_area == "empty_slot" then
        -- Move selected player to the empty slot
        if selected_slot then
          G.GAME.ina_formation_assignments[selected_slot] = nil
        end
        G.GAME.ina_formation_assignments[clicked_slot] = selected_uid
        -- Clear selection
        G.GAME.ina_selected_player_uid = nil
        G.GAME.ina_selected_source_slot = nil
      elseif clicked_area == "slot" then
        -- Clicked another slot containing a player: swap them!
        if selected_slot then
          local temp = G.GAME.ina_formation_assignments[clicked_slot]
          G.GAME.ina_formation_assignments[clicked_slot] = selected_uid
          G.GAME.ina_formation_assignments[selected_slot] = temp
        else
          -- Selected player was in unassigned/bench, swap places with the slot player
          -- Clear any existing slot for the selected player to prevent duplicates
          for i = 1, 11 do
            if G.GAME.ina_formation_assignments[i] == selected_uid then
              G.GAME.ina_formation_assignments[i] = nil
            end
          end
          G.GAME.ina_formation_assignments[clicked_slot] = selected_uid
        end
        -- Clear selection
        G.GAME.ina_selected_player_uid = nil
        G.GAME.ina_selected_source_slot = nil
      elseif clicked_area == "unassigned" or clicked_area == "bench" then
        -- User clicked another player in plantilla/reservas: toggle or change selection
        if clicked_uid == selected_uid then
          G.GAME.ina_selected_player_uid = nil
          G.GAME.ina_selected_source_slot = nil
        else
          G.GAME.ina_selected_player_uid = clicked_uid
          G.GAME.ina_selected_source_slot = nil
        end
      end
    else
      -- Nothing was selected yet: select this player!
      if clicked_area == "slot" then
        G.GAME.ina_selected_player_uid = clicked_uid
        G.GAME.ina_selected_source_slot = clicked_slot
      elseif clicked_area == "unassigned" or clicked_area == "bench" then
        G.GAME.ina_selected_player_uid = clicked_uid
        G.GAME.ina_selected_source_slot = nil
      end
    end

    play_sound('button', 1, 0.3)
    if G.OVERLAY_MENU then
      Pokerleven.ui.clean_formation_cards()
      G.FUNCS.exit_overlay_menu()
      G.FUNCS.ina_formation_btn()
    end
  end
end

return {
  create_UIBox_formation = ui_mod.create_UIBox_formation,
  setup = setup,
}
