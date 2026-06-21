---@diagnostic disable: undefined-field

local create_UIBox_gacha = function()
  Pokerleven.gacha_selected_teams = Pokerleven.gacha_selected_teams or {}
  Pokerleven.gacha_selected_count = 0
  for k, v in pairs(Pokerleven.gacha_selected_teams) do
    if v then Pokerleven.gacha_selected_count = Pokerleven.gacha_selected_count + 1 end
  end

  G.GAME.ina_gacha_coins = G.GAME.ina_gacha_coins or { blue = 0, red = 0, silver = 0, purple = 0, gold = 0 }

  local coin_types = {
    { id = 'blue',   name = 'Moneda Azul',      pos = { x = 1, y = 1 }, rates = { Common = 80,  Uncommon = 18, Rare = 1.89, Top = 0.1,  Legendary = 0.01 } },
    { id = 'red',    name = 'Moneda Roja',       pos = { x = 2, y = 1 }, rates = { Common = 60,  Uncommon = 30, Rare = 8,    Top = 1.9,  Legendary = 0.1  } },
    { id = 'silver', name = 'Moneda Plateada',   pos = { x = 3, y = 1 }, rates = { Common = 30,  Uncommon = 45, Rare = 20,   Top = 4,    Legendary = 1    } },
    { id = 'purple', name = 'Moneda Morada',     pos = { x = 4, y = 1 }, rates = { Common = 10,  Uncommon = 40, Rare = 35,   Top = 12,   Legendary = 3    } },
    { id = 'gold',   name = 'Moneda Dorada',     pos = { x = 5, y = 1 }, rates = { Common = 1,   Uncommon = 19, Rare = 45,   Top = 25,   Legendary = 10   } },
  }

  local coin_nodes = {}
  for _, coin in ipairs(coin_types) do
    local count = G.GAME.ina_gacha_coins[coin.id] or 0
    local coin_sprite = Sprite(0, 0, 0.5, 0.5, G.ASSET_ATLAS['ina_Tags01'], coin.pos)
    coin_sprite:define_draw_steps({ { shader = 'dissolve', shadow_height = 0.05 }, { shader = 'dissolve' } })

    local dyn_rates = Pokerleven.get_gacha_rates(coin.id)
    local tooltip_text = {
      "Común: "      .. (math.floor(dyn_rates[1]          * 100) / 100) .. "%",
      "Inusual: "    .. (math.floor(dyn_rates[2]          * 100) / 100) .. "%",
      "Raro: "       .. (math.floor(dyn_rates[3]          * 100) / 100) .. "%",
      "Destacado: "  .. (math.floor(dyn_rates["ina_top"]  * 100) / 100) .. "%",
      "Legendario: " .. (math.floor(dyn_rates[4]          * 100) / 100) .. "%",
    }

    local is_selected = Pokerleven.gacha_selected_coin == coin.id
    table.insert(coin_nodes, {
      n = G.UIT.C,
      config = {
        id = 'gacha_coin_' .. coin.id, align = "cm", padding = 0.05, r = 0.1, minw = 0.8,
        hover = true, button = 'ina_gacha_toggle_coin', ref_table = { coin_id = coin.id },
        colour = is_selected and adjust_alpha(G.C.GREEN, 0.4) or G.C.CLEAR,
        on_demand_tooltip = { title = coin.name, text = tooltip_text }
      },
      nodes = {
        { n = G.UIT.R, config = { align = "cm" }, nodes = { { n = G.UIT.O, config = { object = coin_sprite } } } },
        { n = G.UIT.R, config = { align = "cm" }, nodes = {
          { n = G.UIT.T, config = { text = "x" .. count, scale = 0.35, colour = count > 0 and G.C.WHITE or G.C.UI.TEXT_INACTIVE, shadow = true } }
        }}
      }
    })
  end

  Pokerleven.gacha_area = CardArea(0, 0, 0.9 * G.CARD_W, 0.9 * G.CARD_H, { card_limit = 1, type = 'title', highlight_limit = 0 })

  local left_box = {
    n = G.UIT.C,
    config = { align = "cm", minw = 5, minh = 5, colour = G.C.BLACK, r = 0.1, padding = 0.1, emboss = 0.05 },
    nodes = {
      { n = G.UIT.R, config = { align = "cm", padding = 0.1 }, nodes = {
        { n = G.UIT.T, config = { text = "Equipos Seleccionados", scale = 0.3, colour = G.C.UI.TEXT_LIGHT, shadow = true } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
        { n = G.UIT.O, config = { id = 'gacha_selected_count_text',
          object = DynaText({ string = {{ ref_table = Pokerleven, ref_value = 'gacha_selected_count', suffix = " / 5" }},
            colours = { G.C.GREEN }, scale = 0.5, shadow = true, silent = true }) } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.1 }, nodes = {
        { n = G.UIT.T, config = { text = "(Mínimo 2)", scale = 0.25, colour = G.C.UI.TEXT_INACTIVE, shadow = true } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = coin_nodes },
      { n = G.UIT.R, config = { align = "cm", padding = 0.05 }, nodes = {
        UIBox_button({ id = 'gacha_roll_button', button = 'ina_gacha_roll', func = 'can_ina_gacha_roll',
          label = { "Tirar" }, colour = G.C.GREEN, scale = 0.4, minw = 1.5, minh = 0.6 })
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.1, minh = 1.1 }, nodes = {
        { n = G.UIT.O, config = { object = Pokerleven.gacha_area } }
      }}
    }
  }

  local team_blind_keys = {
    "bl_ina_raimon", "bl_ina_occult", "bl_ina_royal_blind", "bl_ina_wild",
    "bl_ina_brain", "bl_ina_otaku", "bl_ina_farm", "bl_ina_inazuma_eleven",
    "bl_ina_kirkwood", "bl_ina_shuriken", "bl_ina_zeus",
    "bl_ina_tormenta_geminis", "bl_ina_spfixers", "bl_ina_alpine", "bl_ina_cloister",
    "bl_ina_epsilon", "bl_ina_RRedux", "bl_ina_osakaccc", "bl_ina_fauxshore",
    "bl_ina_marytimes", "bl_ina_Prominence", "bl_ina_Diamond", "bl_ina_Genesis"
  }

  local teams_nodes = {}
  for _, key in ipairs(team_blind_keys) do
    local blind_def = G.P_BLINDS[key]
    if blind_def then
      local is_discovered = blind_def.discovered
      local blind_pos   = is_discovered and blind_def.pos or G.b_undiscovered.pos
      local blind_atlas = is_discovered and (blind_def.atlas or 'blind_chips') or 'blind_chips'
      local blind_sprite = AnimatedSprite(0, 0, 0.75, 0.75, G.ANIMATION_ATLAS[blind_atlas] or G.ANIMATION_ATLAS['blind_chips'], blind_pos)
      blind_sprite:define_draw_steps({ { shader = 'dissolve', shadow_height = 0.05 }, { shader = 'dissolve' } })

      if is_discovered then
        local is_selected = Pokerleven.gacha_selected_teams[key]
        table.insert(teams_nodes, {
          n = G.UIT.C,
          config = {
            align = "cm", padding = 0.05, r = 0.1, minw = 0.85, minh = 0.85,
            colour = is_selected and adjust_alpha(G.C.GREEN, 0.4) or G.C.CLEAR,
            button = 'ina_gacha_toggle_team', ref_table = { key = key }, hover = true,
          },
          nodes = { { n = G.UIT.O, config = { object = blind_sprite } } }
        })
      else
        table.insert(teams_nodes, {
          n = G.UIT.C,
          config = { align = "cm", padding = 0.05, r = 0.1, minw = 0.85, minh = 0.85, colour = G.C.CLEAR },
          nodes = { { n = G.UIT.O, config = { object = blind_sprite } } }
        })
      end
    end
  end

  local teams_grid = {}
  local current_row = {}
  for i, node in ipairs(teams_nodes) do
    table.insert(current_row, node)
    if #current_row == 4 or i == #teams_nodes then
      table.insert(teams_grid, { n = G.UIT.R, config = { align = "cm", padding = 0.03 }, nodes = current_row })
      current_row = {}
    end
  end

  local right_box = {
    n = G.UIT.C,
    config = { align = "cm", minw = 5.5, minh = 5, colour = G.C.BLACK, r = 0.1, padding = 0.1, emboss = 0.05 },
    nodes = teams_grid
  }

  return create_UIBox_generic_options({
    back_func = 'exit_overlay_menu',
    contents = { { n = G.UIT.R, config = { align = "cm", padding = 0.2 }, nodes = {
      left_box, { n = G.UIT.C, config = { minw = 0.2 }, nodes = {} }, right_box
    }}}
  })
end

local setup = function()
  G.FUNCS.ina_gacha_btn = function(e)
    play_sound('button', 1, 0.3)
    G.SETTINGS.paused = true
    G.FUNCS.overlay_menu{ definition = create_UIBox_gacha() }
  end
end

return {
  create_UIBox_gacha = create_UIBox_gacha,
  setup = setup,
}
