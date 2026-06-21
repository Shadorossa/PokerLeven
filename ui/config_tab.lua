---@diagnostic disable: undefined-field

local restart_toggles_left = {}

local restart_toggles_right = {
  { ref_value = "winners_jokers", label = "ina_settings_winners_jokers" },
  { ref_value = "oc_jokers",      label = "ina_settings_oc_jokers" },
}

local no_restart_toggles = {
  { ref_value = "custom_middle_blinds",    label = "ina_settings_custom_middle_blinds" },
  { ref_value = "middle_blinds_abilities", label = "ina_settings_middle_blinds_abilities" }
}

local create_menu_toggles = function(parent, toggles)
  for k, v in ipairs(toggles) do
    parent.nodes[#parent.nodes + 1] = create_toggle({
      label = localize(v.label),
      ref_table = Pokerleven.config,
      ref_value = v.ref_value,
      callback = function(_set_toggle)
        NFS.write(mod_dir .. "/config.lua", STR_PACK(Pokerleven.config))
      end,
    })
    if v.tooltip then
      parent.nodes[#parent.nodes].config.detailed_tooltip = v.tooltip
    end
  end
end

local create_config_tab = function()
  local restart_left  = { n = G.UIT.C, config = { align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR }, nodes = {} }
  local restart_right = { n = G.UIT.C, config = { align = "tl", padding = 0.05, scale = 0.75, colour = G.C.CLEAR }, nodes = {} }
  local no_restart    = { n = G.UIT.R, config = { align = "tm", padding = 0.05, scale = 0.75, colour = G.C.CLEAR }, nodes = {} }

  create_menu_toggles(restart_left,  restart_toggles_left)
  create_menu_toggles(restart_right, restart_toggles_right)
  create_menu_toggles(no_restart,    no_restart_toggles)

  local function label_row(text)
    return { n = G.UIT.R, config = { padding = 0, align = "cm" }, nodes = {
      { n = G.UIT.T, config = { text = text, shadow = true, scale = 0.75 * 0.8, colour = HEX("ED533A") } }
    }}
  end

  return {
    n = G.UIT.ROOT,
    config = { align = "cm", padding = 0.05, colour = G.C.CLEAR },
    nodes = {
      label_row("No restart required"),
      no_restart,
      label_row("Requires restart"),
      { n = G.UIT.R, config = { padding = 0, align = "tm" }, nodes = { restart_left, restart_right } },
    }
  }
end

return { create_config_tab = create_config_tab }
