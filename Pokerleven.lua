---@diagnostic disable: need-check-nil
mod_dir = '' .. SMODS.current_mod.path

SMODS.current_mod.optional_features = {
  retrigger_joker = true,
  post_trigger = true
}

Pokerleven = {}
Pokerleven.config = SMODS.current_mod.config

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

--Load consumable types
local pconsumable_types = NFS.getDirectoryItems(mod_dir .. "consumable types")

for _, file in ipairs(pconsumable_types) do
  sendDebugMessage("The file is: " .. file)
  local con_type, load_error = SMODS.load_file("consumable types/" .. file)

  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  elseif con_type ~= nil then
    local curr_type = con_type()
    if curr_type.init then curr_type:init() end

    for i, item in ipairs(curr_type.list) do
      SMODS.ConsumableType(item)
    end
  else
    sendDebugMessage("con_type is nil for file: " .. file)
  end
end


--Load joker types
local p_joker_types = NFS.getDirectoryItems(mod_dir .. "misc")

for _, file in ipairs(p_joker_types) do
  sendDebugMessage("The file is: " .. file)
  local joker_type, load_error = SMODS.load_file("misc/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    if joker_type ~= nil then
      local curr_type = joker_type()
      if curr_type.init then curr_type:init() end

      for i, item in ipairs(curr_type.list) do
        SMODS.ObjectType(item)
      end
    else
      sendDebugMessage("joker_type is nil for file: " .. file)
    end
  end
end


--Load consumables
local consumables = NFS.getDirectoryItems(mod_dir .. "consumables")

for _, file in ipairs(consumables) do
  sendDebugMessage("The file is: " .. file)
  local consumable, load_error = SMODS.load_file("consumables/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_consumable = consumable()
    if curr_consumable.init then curr_consumable:init() end
    for i, item in ipairs(curr_consumable.list) do
      SMODS.Consumable(item)
    end
  end
end

--Load seals
local seals = NFS.getDirectoryItems(mod_dir .. "seals")

for _, file in ipairs(seals) do
  sendDebugMessage("The file is: " .. file)
  local seal, load_error = SMODS.load_file("seals/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_seal = seal()
    if curr_seal.init then curr_seal:init() end
    for i, item in ipairs(curr_seal.list) do
      SMODS.Seal(item)
    end
  end
end


--Load stickers
local pseals = NFS.getDirectoryItems(mod_dir .. "stickers")

for _, file in ipairs(pseals) do
  sendDebugMessage("The file is: " .. file)
  local sticker, load_error = SMODS.load_file("stickers/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_sticker = sticker()
    if curr_sticker.init then curr_sticker:init() end

    for i, item in ipairs(curr_sticker.list) do
      SMODS.Sticker(item)
    end
  end
end

--Load tags
local tags = NFS.getDirectoryItems(mod_dir .. "tags")

for _, file in ipairs(tags) do
  sendDebugMessage("The file is: " .. file)
  local tag, load_error = SMODS.load_file("tags/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_tag = tag()
    if curr_tag.init then curr_tag:init() end

    for i, item in ipairs(curr_tag.list) do
      SMODS.Tag(item)
    end
  end
end


--Load boosters
local pboosters = NFS.getDirectoryItems(mod_dir .. "boosters")

for _, file in ipairs(pboosters) do
  sendDebugMessage("The file is: " .. file)
  local booster, load_error = SMODS.load_file("boosters/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_booster = booster()
    if curr_booster.init then curr_booster:init() end

    for i, item in ipairs(curr_booster.list) do
      SMODS.Booster(item)
    end
  end
end

--Load editions
local editions = NFS.getDirectoryItems(mod_dir .. "editions")

for _, file in ipairs(editions) do
  sendDebugMessage("The file is: " .. file)
  local edition, load_error = SMODS.load_file("editions/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_edition = edition()
    if curr_edition then
      if curr_edition.init then curr_edition:init() end
      for i, item in ipairs(curr_edition.list) do
        SMODS.Edition(item)
      end
    end
  end
end

--Load blinds
local blinds = NFS.getDirectoryItems(mod_dir .. "blinds")

for _, file in ipairs(blinds) do
  sendDebugMessage("The file is: " .. file)
  local blind, load_error = SMODS.load_file("blinds/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_blind = blind()
    if curr_blind.init then curr_blind:init() end

    for i, item in ipairs(curr_blind.list) do
      SMODS.Blind(item)
    end
  end
end

--Load blinds
local challenge = NFS.getDirectoryItems(mod_dir .. "challenges")

for _, file in ipairs(challenge) do
  sendDebugMessage("The file is: " .. file)
  local challenge, load_error = SMODS.load_file("challenges/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_challenge = challenge()
    if curr_challenge.init then curr_challenge:init() end

    for i, item in ipairs(curr_challenge.list) do
      SMODS.Challenge(item)
    end
  end
end

--Load vouchers
local vouchers = NFS.getDirectoryItems(mod_dir .. "vouchers")

for _, file in ipairs(vouchers) do
  sendDebugMessage("The file is: " .. file)
  local voucher, load_error = SMODS.load_file("vouchers/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_voucher = voucher()
    if curr_voucher.init then curr_voucher:init() end

    for _, item in ipairs(curr_voucher.list) do
      SMODS.Voucher(item)
    end
  end
end

--Load backs
local backs = NFS.getDirectoryItems(mod_dir .. "backs")

for _, file in ipairs(backs) do
  sendDebugMessage("The file is: " .. file)
  local back, load_error = SMODS.load_file("backs/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_back = back()
    if curr_back.init then curr_back:init() end

    for _, item in ipairs(curr_back.list) do
      SMODS.Back(item)
    end
  end
end

--Load poker_hands
local poker_hands = NFS.getDirectoryItems(mod_dir .. "poker_hands")

for _, file in ipairs(poker_hands) do
  sendDebugMessage("The file is: " .. file)
  local poker_hand, load_error = SMODS.load_file("poker_hands/" .. file)
  if load_error then
    sendDebugMessage("The error is: " .. load_error)
  else
    local curr_poker_hand = poker_hand()
    if curr_poker_hand.init then curr_poker_hand:init() end

    for _, item in ipairs(curr_poker_hand.list) do
      SMODS.PokerHand(item)
    end
  end
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
          if not item.discovered then
            item.discovered = false
          end
          item.key = item.key or item.name

          item.config = item.config or {}
          item.config.extra = item.config.extra or {}

          if item.ptype then item.config.extra.ptype = item.ptype end
          if item.pposition then item.config.extra.pposition = item.pposition end
          if item.pteam then item.config.extra.pteam = item.pteam end
          if item.pteam_concept then item.config.extra.pteam_concept = item.pteam_concept end
          if item.special then item.config.extra.special = item.special end
          -- Aseguramos que la etiqueta especial también se propague a nivel de raíz para que SMODS y Lovely no la pierdan nunca
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

          if not item.custom_pool_func then
            item.in_pool = function(self)
              return player_in_pool(self)
            end
          end

          item.generate_ui = Pokerleven.generate_info_ui
          item.set_badges = ina_set_badges

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

-- Hook global para manejar el aumento de coste de sobres por Butler (Young)
local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    if self.ability and self.ability.set == 'Booster' and G.jokers and G.jokers.cards then
        if next(SMODS.find_card('j_ina_Butler_Young')) then
            self.cost = math.floor(self.cost * 1.5)
        end
    end
end