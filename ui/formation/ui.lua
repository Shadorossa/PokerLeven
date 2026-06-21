local create_UIBox_formation = function()
  local form_type = G.GAME.ina_formation_type or "pachanga"
  local max_slots = (form_type == "partido") and 11 or 5
  local current_formation = G.GAME.ina_current_formation or ((form_type == "partido") and "4-3-3" or "1-2-1")

  -- Prevent out of bound settings if mode switched
  if not Pokerleven.formations[current_formation] then
    current_formation = (form_type == "partido") and "4-3-3" or "1-2-1"
    G.GAME.ina_current_formation = current_formation
  end

  local slots = Pokerleven.formations[current_formation]

  -- Get chemistry statistics
  local stats = Pokerleven.get_chemistry_stats()
  Pokerleven.ui.current_stats = stats

  local pitch_drawer = Sprite(0, 0, 0.01, 0.01, G.ASSET_ATLAS["ina_resources"], { x = 0, y = 0 })
  pitch_drawer.draw = function(self)
    -- Calculate bounds from slot elements since pitch_container is a layout row (G.UIT.R) and not registered in get_UIE_by_ID
    local min_x, max_x, min_y, max_y = 9999, -9999, 9999, -9999
    local slots_found = 0
    if G.OVERLAY_MENU then
      for k = 1, 11 do
        local el = G.OVERLAY_MENU:get_UIE_by_ID("slot_" .. k)
        if el then
          slots_found = slots_found + 1
          local x, y, w, h = el.T.x, el.T.y, el.T.w, el.T.h
          if x < min_x then min_x = x end
          if x + w > max_x then max_x = x + w end
          if y < min_y then min_y = y end
          if y + h > max_y then max_y = y + h end
        end
      end
    end

    if slots_found > 0 then
      local tx = (self.container and self.container.T.x) or self.T.x or 0
      local ty = (self.container and self.container.T.y) or self.T.y or 0

      local px = min_x - 0.25 - tx
      local py = min_y - 0.25 - ty
      local pw = max_x - min_x + 0.5
      local ph = max_y - min_y + 0.5

      -- Alternating green grass stripes
      local num_stripes = 10
      local stripe_h = ph / num_stripes
      for j = 0, num_stripes - 1 do
        if j % 2 == 0 then
          love.graphics.setColor(0.12, 0.40, 0.15, 1.0) -- Dark green
        else
          love.graphics.setColor(0.15, 0.48, 0.18, 1.0) -- Light green
        end
        love.graphics.rectangle("fill", px, py + j * stripe_h, pw, stripe_h)
      end

      -- Draw soccer field markings
      love.graphics.setLineWidth(2)
      love.graphics.setColor(1, 1, 1, 0.35) -- Semi-transparent white
      
      local inset = 0.05
      love.graphics.rectangle("line", px + inset, py + inset, pw - 2*inset, ph - 2*inset, 0.1)
      
      -- Midfield line
      local my = py + ph / 2
      love.graphics.line(px + inset, my, px + pw - inset, my)
      
      -- Center circle
      love.graphics.circle("line", px + pw / 2, my, 0.5)
      
      -- Penalty areas
      love.graphics.rectangle("line", px + pw/2 - 1.1, py + inset, 2.2, 0.7)
      love.graphics.rectangle("line", px + pw/2 - 1.1, py + ph - inset - 0.7, 2.2, 0.7)

      -- Draw connections (chemistry links)
      local current_stats = Pokerleven.ui.current_stats
      if current_stats and current_stats.links_list then
        for _, link in ipairs(current_stats.links_list) do
          local el1 = G.OVERLAY_MENU:get_UIE_by_ID("slot_" .. link.idx1)
          local el2 = G.OVERLAY_MENU:get_UIE_by_ID("slot_" .. link.idx2)
          if el1 and el2 then
            local x1 = el1.T.x + el1.T.w / 2 - tx
            local y1 = el1.T.y + el1.T.h / 2 - ty
            local x2 = el2.T.x + el2.T.w / 2 - tx
            local y2 = el2.T.y + el2.T.h / 2 - ty

            local col = {0.5, 0.5, 0.5, 0.3} -- Grey
            if link.quality == "Verde" then col = {0.1, 0.8, 0.1, 0.8}
            elseif link.quality == "Amarillo" then col = {0.9, 0.8, 0.1, 0.8}
            elseif link.quality == "Rojo" then col = {0.8, 0.1, 0.1, 0.8}
            end

            love.graphics.setLineWidth(4)
            love.graphics.setColor(col[1], col[2], col[3], col[4])
            love.graphics.line(x1, y1, x2, y2)
          end
        end
      end
      
      -- Restore default graphics state
      love.graphics.setColor(1, 1, 1, 1)
      love.graphics.setLineWidth(1)
    end
  end

  -- Store CardAreas in Pokerleven.ui to clean them up on exit
  Pokerleven.ui.bench_area = CardArea(0, 0, 5.5 * G.CARD_W * 0.42, 0.95 * G.CARD_H * 0.42, { card_limit = 12, type = 'title', highlight_limit = 0, collection = false })
  Pokerleven.ui.unassigned_area = CardArea(0, 0, 5.5 * G.CARD_W * 0.42, 0.95 * G.CARD_H * 0.42, { card_limit = 12, type = 'title', highlight_limit = 0, collection = false })
  Pokerleven.ui.slots_areas = Pokerleven.ui.slots_areas or {}

  local function get_chem_stars(chem)
    if chem >= 3 then return "◆ ◆ ◆"
    elseif chem >= 2 then return "◆ ◆ ◇"
    elseif chem >= 1 then return "◆ ◇ ◇"
    else return "◇ ◇ ◇"
    end
  end

  local function get_chem_color(chem)
    if chem >= 3 then return G.C.GREEN
    elseif chem >= 2 then return G.C.YELLOW
    elseif chem >= 1 then return G.C.RED
    else return G.C.GREY
    end
  end

  local owned_players = Pokerleven.get_all_owned_players()
  local assigned_uids = {}

  -- Render formation layout dynamically by rows and slots positioning
  local pitch_rows = {}
  for row_idx, slot_indices in ipairs(Pokerleven.formation_layouts[current_formation]) do
    local row_nodes = {}
    for _, i in ipairs(slot_indices) do
      local slot_pos = slots[i]
      local uid = G.GAME.ina_formation_assignments[i]
      local slot_node

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
        assigned_uids[uid] = true
        local copy = copy_card(card, nil, 0.4) -- scaled down slightly
        copy.states.drag.can = false
        copy.states.hover.can = true
        copy.states.click.can = false

        Pokerleven.ui.slots_cards = Pokerleven.ui.slots_cards or {}
        Pokerleven.ui.slots_cards[i] = copy

        local pos = card.ability and card.ability.extra and card.ability.extra.pposition
        if not pos and card.config and card.config.center_key then
          local center = G.P_CENTERS[card.config.center_key]
          pos = center and center.pposition
        end

        local chem = stats.player_chems[i] or 0
        local chem_color = get_chem_color(chem)
        local is_pos_match = (pos == slot_pos)
        local pos_str = is_pos_match and (slot_pos .. " ✓") or (pos .. " ➔ " .. slot_pos)

        local is_selected = (uid == G.GAME.ina_selected_player_uid)
        slot_node = {
          n = G.UIT.C,
          config = {
            id = "slot_" .. i,
            align = "cm",
            padding = 0.01,
            minw = G.CARD_W * 0.4,
            minh = G.CARD_H * 0.4 + 0.25,
            colour = is_selected and G.C.GOLD or HEX("1b1b1b"),
            r = 0.08,
            outline = is_selected and 2 or 0,
            outline_colour = G.C.GOLD,
            hover = true,
            button = "ina_click_player_card",
            ref_table = { joker_uid = uid, slot_index = i, area = "slot" }
          },
          nodes = {
            { n = G.UIT.R, config = { align = "cm" }, nodes = { { n = G.UIT.O, config = { object = copy } } } },
            { n = G.UIT.R, config = { align = "cm" }, nodes = {
              { n = G.UIT.T, config = { text = pos_str, scale = 0.14, colour = is_pos_match and G.C.GREEN or G.C.RED } }
            }},
            { n = G.UIT.R, config = { align = "cm" }, nodes = {
              { n = G.UIT.T, config = { text = get_chem_stars(chem), scale = 0.16, colour = chem_color } },
              { n = G.UIT.C, config = { minw = 0.03 } },
              UIBox_button({
                label = { "x" },
                button = "ina_unassign_player_from_slot",
                ref_table = { slot_index = i },
                scale = 0.08,
                minw = 0.12,
                minh = 0.12,
                colour = G.C.RED
              })
            }}
          }
        }
      else
        -- Empty Slot
        slot_node = {
          n = G.UIT.C,
          config = {
            id = "slot_" .. i,
            align = "cm",
            minw = G.CARD_W * 0.4,
            minh = G.CARD_H * 0.4 + 0.25,
            colour = HEX("1b1b1b"),
            r = 0.08,
            outline = G.GAME.ina_selected_player_uid and 2 or 1,
            outline_colour = G.GAME.ina_selected_player_uid and G.C.GOLD or G.C.GREY,
            hover = true,
            button = "ina_click_player_card",
            ref_table = { slot_index = i, area = "empty_slot" }
          },
          nodes = {
            { n = G.UIT.R, config = { align = "cm", minh = 0.45 }, nodes = {} },
            { n = G.UIT.R, config = { align = "cm" }, nodes = {
              { n = G.UIT.T, config = { text = "VACÍO (" .. slot_pos .. ")", scale = 0.12, colour = G.C.UI.TEXT_INACTIVE } }
            }}
          }
        }
      end

      table.insert(row_nodes, slot_node)
      table.insert(row_nodes, { n = G.UIT.C, config = { minw = 0.25 }, nodes = {} })
    end
    if #row_nodes > 0 then table.remove(row_nodes) end
    table.insert(pitch_rows, { n = G.UIT.R, config = { align = "cm", padding = 0.02 }, nodes = row_nodes })
    if row_idx < #Pokerleven.formation_layouts[current_formation] then
      table.insert(pitch_rows, { n = G.UIT.R, config = { minh = 0.15 }, nodes = {} })
    end
  end

  -- Determine vacant slots for assignment
  local empty_slots = {}
  for i = 1, max_slots do
    if not G.GAME.ina_formation_assignments[i] then
      table.insert(empty_slots, { index = i, pos = slots[i] })
    end
  end

  -- Populate unassigned players pool
  local unassigned_nodes = {}
  for _, p in ipairs(owned_players) do
    local uid = p.card.unique_val
    if not assigned_uids[uid] then
      local copy = copy_card(p.card, nil, 0.42)
      copy.states.drag.can = false
      copy.states.hover.can = true
      copy.states.click.can = false
      Pokerleven.ui.unassigned_area:emplace(copy)

      local assign_buttons = {}
      for _, slot in ipairs(empty_slots) do
        table.insert(assign_buttons, {
          n = G.UIT.C,
          config = { padding = 0.01 },
          nodes = {
            UIBox_button({
              label = { slot.pos },
              button = "ina_assign_player_to_slot",
              ref_table = { joker_uid = uid, slot_index = slot.index },
              scale = 0.18,
              colour = G.C.GREEN
            })
          }
        })
      end

      if #assign_buttons == 0 then
        table.insert(assign_buttons, {
          n = G.UIT.T,
          config = { text = "Lleno", scale = 0.16, colour = G.C.UI.TEXT_INACTIVE }
        })
      end

      local is_selected = (uid == G.GAME.ina_selected_player_uid)
      table.insert(unassigned_nodes, {
        n = G.UIT.C,
        config = {
          align = "cm",
          padding = 0.02,
          colour = is_selected and G.C.GOLD or G.C.CLEAR,
          r = 0.08,
          outline = is_selected and 2 or 0,
          outline_colour = G.C.GOLD,
          hover = true,
          button = "ina_click_player_card",
          ref_table = { joker_uid = uid, area = "unassigned" }
        },
        nodes = {
          { n = G.UIT.R, config = { align = "cm" }, nodes = { { n = G.UIT.O, config = { object = copy } } } },
          { n = G.UIT.R, config = { align = "cm" }, nodes = assign_buttons }
        }
      })
    end
  end

  -- Populate reserves (bench)
  local bench_nodes = {}
  if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
    for _, card in ipairs(Pokerleven.ina_bench_area.cards) do
      local uid = card.unique_val
      local copy = copy_card(card, nil, 0.42)
      copy.states.drag.can = false
      copy.states.hover.can = true
      copy.states.click.can = false

      local is_selected = (uid == G.GAME.ina_selected_player_uid)
      table.insert(bench_nodes, {
        n = G.UIT.C,
        config = {
          align = "cm",
          padding = 0.02,
          colour = is_selected and G.C.GOLD or G.C.CLEAR,
          r = 0.08,
          outline = is_selected and 2 or 0,
          outline_colour = G.C.GOLD,
          hover = true,
          button = "ina_click_player_card",
          ref_table = { joker_uid = uid, area = "bench" }
        },
        nodes = {
          { n = G.UIT.R, config = { align = "cm" }, nodes = { { n = G.UIT.O, config = { object = copy } } } }
        }
      })
    end
  end

  local pitch_nodes = {}
  table.insert(pitch_nodes, { n = G.UIT.O, config = { object = pitch_drawer } })
  for _, row in ipairs(pitch_rows) do
    table.insert(pitch_nodes, row)
  end

  local pitch_layout = {
    n = G.UIT.R,
    config = { id = "pitch_container", align = "cm", padding = 0.04, colour = HEX("1b5e20"), r = 0.15, outline = 2, outline_colour = G.C.WHITE },
    nodes = pitch_nodes
  }

  local unassigned_layout = {
    n = G.UIT.C,
    config = { align = "tm", padding = 0.04, colour = G.C.L_BLACK, r = 0.1, minw = 3.0, minh = 1.6 },
    nodes = {
      { n = G.UIT.R, config = { align = "cm", padding = 0.01 }, nodes = {
        { n = G.UIT.T, config = { text = "PLANTILLA", scale = 0.2, colour = G.C.UI.TEXT_LIGHT, shadow = true } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.01 }, nodes = unassigned_nodes }
    }
  }

  local bench_layout = {
    n = G.UIT.C,
    config = { align = "tm", padding = 0.04, colour = G.C.BLACK, r = 0.1, minw = 3.0, minh = 1.6 },
    nodes = {
      { n = G.UIT.R, config = { align = "cm", padding = 0.01 }, nodes = {
        { n = G.UIT.T, config = { text = "RESERVAS", scale = 0.2, colour = G.C.UI.TEXT_LIGHT, shadow = true } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.01 }, nodes = bench_nodes }
    }
  }

  local bottom_layout = {
    n = G.UIT.R,
    config = { align = "cm" },
    nodes = {
      unassigned_layout,
      { n = G.UIT.C, config = { minw = 0.1 }, nodes = {} },
      bench_layout
    }
  }

  -- Left panel showing Chemistry Stats (super premium)
  local left_panel = {
    n = G.UIT.C,
    config = { align = "tm", minw = 2.4, minh = 5.2, colour = G.C.BLACK, r = 0.1, padding = 0.08, emboss = 0.05 },
    nodes = {
      { n = G.UIT.R, config = { align = "cm", padding = 0.02 }, nodes = {
        { n = G.UIT.T, config = { text = "QUÍMICA", scale = 0.3, colour = G.C.WHITE, shadow = true } }
      }},
      { n = G.UIT.R, config = { minh = 0.2 }, nodes = {} },
      
      -- Chemistry Panel Box
      { n = G.UIT.R, config = { align = "cm", padding = 0.04, colour = HEX("1b1b1b"), r = 0.08, minw = 2.2, minh = 1.2, outline = 1, outline_colour = G.C.GREY }, nodes = {
        { n = G.UIT.R, config = { align = "cm" }, nodes = {
          { n = G.UIT.T, config = { text = "TOTAL", scale = 0.16, colour = G.C.UI.TEXT_LIGHT } }
        }},
        { n = G.UIT.R, config = { align = "cm", padding = 0.02 }, nodes = {
          { n = G.UIT.T, config = { text = string.format("%d/%d", stats.team_chem, stats.max_chem), scale = 0.35, colour = G.C.GREEN, shadow = true } }
        }}
      }},
      
      { n = G.UIT.R, config = { minh = 0.2 }, nodes = {} },
      
      -- Multiplier Panel Box
      { n = G.UIT.R, config = { align = "cm", padding = 0.04, colour = HEX("1b1b1b"), r = 0.08, minw = 2.2, minh = 1.2, outline = 1, outline_colour = G.C.GREY }, nodes = {
        { n = G.UIT.R, config = { align = "cm" }, nodes = {
          { n = G.UIT.T, config = { text = "MEJORA X", scale = 0.16, colour = G.C.UI.TEXT_LIGHT } }
        }},
        { n = G.UIT.R, config = { align = "cm", padding = 0.02 }, nodes = {
          { n = G.UIT.T, config = { text = string.format("X%.2f", stats.boost), scale = 0.35, colour = G.C.RED, shadow = true } }
        }}
      }}
    }
  }

  -- Right panel showing Formation Selectors
  local right_panel = {
    n = G.UIT.C,
    config = { align = "tm", minw = 2.4, minh = 5.2, colour = G.C.BLACK, r = 0.1, padding = 0.08, emboss = 0.05 },
    nodes = {
      { n = G.UIT.R, config = { align = "cm", padding = 0.02 }, nodes = {
        { n = G.UIT.T, config = { text = "TÁCTICA", scale = 0.3, colour = G.C.WHITE, shadow = true } }
      }},
      { n = G.UIT.R, config = { minh = 0.2 }, nodes = {} },
      
      -- Mode Selection (Pachanga vs Partido)
      { n = G.UIT.R, config = { align = "cm" }, nodes = {
        { n = G.UIT.T, config = { text = "MODO", scale = 0.16, colour = G.C.UI.TEXT_LIGHT } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.02 }, nodes = {
        create_option_cycle({
          options = { "Pachanga (5)", "Partido (11)" },
          w = 2.2,
          cycle_shoulders = true,
          opt_callback = 'ina_change_formation_type',
          current_option = (form_type == "pachanga") and 1 or 2,
          colour = G.C.ORANGE,
          no_pips = true,
          focus_args = { snap_to = true, nav = 'wide' }
        })
      }},
      
      { n = G.UIT.R, config = { minh = 0.2 }, nodes = {} },
      
      -- Sub-Formation selection
      { n = G.UIT.R, config = { align = "cm" }, nodes = {
        { n = G.UIT.T, config = { text = "ESQUEMA", scale = 0.16, colour = G.C.UI.TEXT_LIGHT } }
      }},
      { n = G.UIT.R, config = { align = "cm", padding = 0.02 }, nodes = {
        create_option_cycle({
          options = (form_type == "pachanga") and { "1-2-1", "2-1-1", "1-1-2", "0-2-2" } or { "4-3-3", "4-4-2", "3-5-2", "4-2-3-1" },
          w = 2.2,
          cycle_shoulders = true,
          opt_callback = 'ina_change_formation',
          current_option = (function()
            local opts = (form_type == "pachanga") and { "1-2-1", "2-1-1", "1-1-2", "0-2-2" } or { "4-3-3", "4-4-2", "3-5-2", "4-2-3-1" }
            for k, v in ipairs(opts) do
              if v == current_formation then return k end
            end
            return 1
          end)(),
          colour = G.C.GREEN,
          no_pips = true,
          focus_args = { snap_to = true, nav = 'wide' }
        })
      }}
    }
  }

  return create_UIBox_generic_options({
    back_func = 'exit_formation_menu',
    contents = { { n = G.UIT.R, config = { align = "cm", padding = 0.03 }, nodes = {
      left_panel,
      { n = G.UIT.C, config = { minw = 0.1 }, nodes = {} },
      {
        n = G.UIT.C,
        config = { align = "cm", padding = 0 },
        nodes = {
          pitch_layout,
          { n = G.UIT.R, config = { minh = 0.04 }, nodes = {} },
          bottom_layout
        }
      },
      { n = G.UIT.C, config = { minw = 0.1 }, nodes = {} },
      right_panel
    }}}
  })
end

return {
  create_UIBox_formation = create_UIBox_formation
}
