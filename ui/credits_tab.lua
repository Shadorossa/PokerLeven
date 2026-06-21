---@diagnostic disable: undefined-field

local create_text_node = function(text, colour)
  return { n = G.UIT.T, config = { text = text, shadow = true, scale = 0.75 * 0.8, colour = colour } }
end

local create_text_row = function(text1, text2)
  local nodes = { create_text_node(text1, G.C.UI.TEXT_LIGHT) }
  if text2 and text2 ~= "" then
    table.insert(nodes, create_text_node(text2, G.C.BLUE))
  end
  return { n = G.UIT.R, config = { padding = 0, align = "cm" }, nodes = nodes }
end

local create_credits_tab = function()
  return {
    n = G.UIT.ROOT,
    config = { align = "cm", padding = 0.3, colour = G.C.BLACK, r = 0.3 },
    nodes = {
      create_text_row(localize('ina_thanks')),
      create_text_row(localize('ina_lead_developer'),    C.CREDITS.lead),
      create_text_row(localize('ina_developers'),        C.CREDITS.developers),
      create_text_row(localize('ina_graphic_designers'), C.CREDITS.graphic),
    }
  }
end

local create_extra_tabs = function()
  return { label = localize("ina_credits"), tab_definition_function = create_credits_tab }
end

return { create_extra_tabs = create_extra_tabs }
