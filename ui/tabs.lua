---@diagnostic disable: undefined-field

local create_tab_from_card_area = function(card_area)
  return {
    n = G.UIT.ROOT,
    config = { align = "cm", padding = 0.05, colour = G.C.CLEAR },
    nodes = {
      {
        n = G.UIT.R,
        config = { align = "cm", r = 0.2, padding = 0.5, minh = 4.5, colour = G.C.BLACK },
        nodes = { { n = G.UIT.O, config = { object = card_area } } }
      }
    }
  }
end

local create_tabs_menu = function(tabs, previous_menu)
  G.FUNCS.overlay_menu({
    definition = create_UIBox_generic_options({
      back_colour = G.C.ORANGE,
      back_func = previous_menu or 'exit_overlay_menu',
      contents = {
        {
          n = G.UIT.R,
          nodes = {
            create_tabs({ snap_to_nav = true, colour = G.C.PALE_GREEN, tabs = tabs }),
          }
        },
      }
    })
  })
end

return {
  create_tab_from_card_area = create_tab_from_card_area,
  create_tabs_menu          = create_tabs_menu,
}
