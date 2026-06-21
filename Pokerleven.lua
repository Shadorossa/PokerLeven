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
local helpers = NFS.getDirectoryItems(mod_dir .. "helpers")
for _, file in ipairs(helpers) do
  sendDebugMessage("The file is: " .. file)

  local helper, load_error = SMODS.load_file("helpers/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  elseif helper ~= nil then
    helper()
  end
end

--Load UI file
local UI, load_error = SMODS.load_file("mainui.lua")
if load_error then
  sendDebugMessage("The error is: " .. load_error)
elseif UI ~= nil then
  UI()
end

SMODS.Rarity({
  key = "top",
  loc_txt = {},
  badge_colour = SMODS.Gradient({
    key = 'topplayer',
    colours = {
      HEX('e7b400'),
      HEX('df7500'),
    },
    cycle = 5,
    interpolation = 'trig'
  })
  ,
  default_weight = 0.01,
  get_weight = function(self, weight, object_type)
    return weight
  end,
  pools = { ["Joker"] = true },
})

SMODS.Rarity({
  key = "winner",
  loc_txt = {},
  badge_colour = SMODS.Gradient({
    key = 'winnerplayer',
    colours = {
      HEX('937d3e'),
      HEX('e4ce8f'),
    },
    cycle = 5,
    interpolation = 'trig'
  })
  ,
  default_weight = 0.01,
  get_weight = function(self, weight, object_type)
    return weight
  end,
  pools = { ["Joker"] = true },
})

SMODS.Rarity({
  key = "vestige",
  loc_txt = {},
  badge_colour = SMODS.Gradient({
    key = 'vestigeplayer',
    colours = {
      HEX('7A5E3C'),
      HEX('B7865B'),
    },
    cycle = 5,
    interpolation = 'trig'
  }),
  default_weight = 0.01,
  get_weight = function(self, weight, object_type) return weight end,
  pools = { ["Joker"] = true },
})

SMODS.Sticker:take_ownership("eternal", {
  atlas = "stickers",
  pos = { x = 9, y = 3 },
  prefix_config = { key = false },
})

SMODS.Sticker:take_ownership("perishable", {
  atlas = "stickers",
  pos = { x = 10, y = 3 },
  prefix_config = { key = false },
})

SMODS.Sticker:take_ownership("rental", {
  atlas = "stickers",
  pos = { x = 11, y = 3 },
  prefix_config = { key = false },
})

-- Generic resource loader (replaces repetitive loops)
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

-- Helper to process joker item properties before registration
local function process_joker_item(item)
  if not item.discovered then
    item.discovered = false
  end
  item.key = item.key or item.name

  item.config = item.config or {}
  item.config.extra = item.config.extra or {}

  -- Copy player properties to config.extra
  if item.ptype then item.config.extra.ptype = item.ptype end
  if item.pposition then item.config.extra.pposition = item.pposition end
  if item.pteam then item.config.extra.pteam = item.pteam end
  if item.pteam_concept then item.config.extra.pteam_concept = item.pteam_concept end
  if item.special then item.config.extra.special = item.special end
  if item.special then item.special_type = item.special end
  if item.no_training then
    item.config.extra.no_training = item.no_training
    item.config.extra.tech_level = 1
  end
  if item.techtype then item.config.extra.techtype = item.techtype end
  if item.numberTechType then item.config.extra.numberTechType = item.numberTechType end
  if item.pdorsal then item.config.extra.pdorsal = item.pdorsal end
  if item.pgender then item.config.extra.pgender = item.pgender end
  if item.pnation then item.config.extra.pnation = item.pnation end
  if item.pyear then item.config.extra.pyear = item.pyear end

  -- Set default pool function for players
  if not item.custom_pool_func then
    item.in_pool = function(self)
      return player_in_pool(self)
    end
  end

  -- Set UI and badge functions
  item.generate_ui = Pokerleven.generate_info_ui
  item.set_badges = ina_set_badges
end

--Load jokers files
local function load_joker_folder(folder_name, item_constructor)
  local files = NFS.getDirectoryItems(mod_dir .. folder_name)
  for _, file in ipairs(files) do
    sendDebugMessage("The file is: " .. file)
    local mod_func, load_error = SMODS.load_file(folder_name .. "/" .. file)
    if load_error then
      sendDebugMessage("The error is: " .. load_error)
    else
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

LeakScope = {
  last = { mem = 0, events = 0, jokers = 0, cards = 0 },
}

local function count_events()
  return G and G.E_MANAGER and G.E_MANAGER.events and #G.E_MANAGER.events or 0
end

local function count_jokers()
  return (G and G.jokers and G.jokers.cards) and #G.jokers.cards or 0
end

local function count_all_cards()
  local n = 0
  local buckets = { G.hand, G.deck, G.discard, G.jokers, G.consumeables, G.play }
  for _, area in ipairs(buckets) do
    if area and area.cards then n = n + #area.cards end
  end
  return n
end

function LeakScope.snap(tag)
  collectgarbage("collect")
  local mem = collectgarbage("count") -- KB
  local ev  = count_events()
  local jok = count_jokers()
  local car = count_all_cards()
  print(string.format("[LeakScope] %s | mem: %.1f KB (Δ%.1f) | events: %d (Δ%d) | jokers: %d | cards: %d",
    tag, mem, mem - LeakScope.last.mem, ev, ev - LeakScope.last.events, jok, car))
  LeakScope.last = { mem = mem, events = ev, jokers = jok, cards = car }
end

load_joker_folder("players", SMODS.Joker)
load_joker_folder("managers", SMODS.Joker)
load_joker_folder("Spirit", SMODS.Joker)

-- Hook global para manejar la reversión de Thaddeus Bellefax
local card_calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
    local res = card_calculate_joker_ref(self, context)
    
    if context.end_of_round and context.main_eval and self.thaddeus_transform and not context.blueprint then
        self.thaddeus_transform.blinds_remaining = self.thaddeus_transform.blinds_remaining - 1
        if self.thaddeus_transform.blinds_remaining <= 0 then
            local data = self.thaddeus_transform
            self:set_ability(G.P_CENTERS[data.original_key])
            -- Marcamos que ya se usó la transformación en la nueva habilidad
            if self.ability and self.ability.extra then
                self.ability.extra.used_transform = true
                -- Limpieza explícita de stickers de posición que Byron pudo asignar
                self.ability.fw_sticker = false
                self.ability.mf_sticker = false
                self.ability.df_sticker = false
                self.ability.gk_sticker = false
            end
            self.thaddeus_transform = nil -- Limpiamos el estado de transformación
            card_eval_status_text(self, 'extra', nil, nil, nil, { message = "Reversión", colour = G.C.BLUE })
            Pokerleven.refresh_concept_boosts("ZEUS", data.stat_boost, "THADDEUS")
        end
    end
    
    return res
end

-- Hook global para manejar modificaciones genéricas de coste de cartas
local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            j:calculate_joker({ set_cost = true, card = self })
        end
    end
end