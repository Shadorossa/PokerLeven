---@diagnostic disable: need-check-nil
mod_dir = '' .. SMODS.current_mod.path

SMODS.current_mod.optional_features = {
  retrigger_joker = true,
  post_trigger = true
}

Pokerleven = {}
Pokerleven.config = SMODS.current_mod.config

---Helper para crear eventos simples sin boilerplate
---@param func function La función a ejecutar
---@param delay number|nil Delay opcional (default: 0)
Pokerleven.add_simple_event = function(func, delay)
    delay = delay or 0
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = delay,
        func = func
    }))
end

--Load Sprites file
local sprite, load_error = SMODS.load_file("sprites.lua")
if load_error then
  sendDebugMessage("The error is: " .. load_error)
elseif sprite ~= nil then
  sprite()
end

--Load helpers
local function load_helper_dir(dir)
  local path = mod_dir .. "helpers/" .. dir .. "/"
  local items = NFS.getDirectoryItems(path)
  for _, file in ipairs(items) do
    if file:match("%.lua$") then
      local helper, load_error = SMODS.load_file("helpers/" .. dir .. "/" .. file)
      if load_error then
        sendDebugMessage("helpers/" .. dir .. "/" .. file .. " error: " .. load_error)
      elseif helper ~= nil then
        helper()
      end
    end
  end
end

local helper_dirs = { "core", "data", "music", "player", "gameplay", "zones", "ui", "smods", "utils" }
for _, dir in ipairs(helper_dirs) do
  load_helper_dir(dir)
end

--Load UI file
local UI, load_error = SMODS.load_file("mainui.lua")
if load_error then
  sendDebugMessage("The error is: " .. load_error)
elseif UI ~= nil then
  UI()
end

-- Generic resource loader
local function loadResourceFolder(folder_name, constructor)
  local files = NFS.getDirectoryItems(mod_dir .. folder_name)
  for _, file in ipairs(files) do
    sendDebugMessage("Loading " .. folder_name .. "/" .. file)
    local chunk, load_error = SMODS.load_file(folder_name .. "/" .. file)
    if load_error then
      sendDebugMessage("ERROR loading " .. folder_name .. "/" .. file .. ": " .. load_error)
    elseif chunk ~= nil then
      local source = chunk()
      if source then
        if source.init then source:init() end
        if source.list then
          for _, item in ipairs(source.list) do
            constructor(item)
          end
        end
      end
    end
  end
end

--Load consumable types
loadResourceFolder("consumable types", SMODS.ConsumableType)

--Load joker types
loadResourceFolder("misc", SMODS.ObjectType)

--Load consumables
loadResourceFolder("consumables", SMODS.Consumable)

--Load seals
loadResourceFolder("seals", SMODS.Seal)

--Load stickers
loadResourceFolder("stickers", SMODS.Sticker)

--Load tags
loadResourceFolder("tags", SMODS.Tag)

--Load boosters
loadResourceFolder("boosters", SMODS.Booster)

--Load editions
loadResourceFolder("editions", SMODS.Edition)

--Load blinds
loadResourceFolder("blinds", SMODS.Blind)

--Load challenges
loadResourceFolder("challenges", SMODS.Challenge)

--Load vouchers
loadResourceFolder("vouchers", SMODS.Voucher)

--Load backs
loadResourceFolder("backs", SMODS.Back)

--Load poker_hands
loadResourceFolder("poker_hands", SMODS.PokerHand)

--Load jokers files
local function load_joker_folder(folder_name, item_constructor)
  local files = NFS.getDirectoryItems(mod_dir .. folder_name)
  for _, file in ipairs(files) do
    sendDebugMessage("The file is: " .. file)
    local mod_func, load_error = SMODS.load_file(folder_name .. "/" .. file)
    if load_error then
      sendDebugMessage("The error is: " .. load_error)
    elseif mod_func ~= nil then
      local source = mod_func()
      if source then
        if source.init then source:init() end
        for _, item in ipairs(source.list) do
          process_joker_item(item)
          item_constructor(item)
        end
      end
    end
  end
end

local player_arcs = { "IE1", "IE2", "IE3", "IE4", "IE5", "IE6", "IE7", "IE8", "IE9" }
for _, arc in ipairs(player_arcs) do
  load_joker_folder("players/" .. arc, SMODS.Joker)
end
load_joker_folder("players/managers", SMODS.Joker)
load_joker_folder("players/spirits", SMODS.Joker)