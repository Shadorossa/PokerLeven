-- ropes
local ropes = {
  name = "ropes",
  pos = { x = 3, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.GK,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- downtown
local downtown = {
  name = "Downtown",
  pos = { x = 4, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- bindings
local bindings = {
  name = "Bindings",
  pos = { x = 5, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- gleeson
local gleeson = {
  name = "Gleeson",
  pos = { x = 6, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- snowfield
local snowfield = {
  name = "Snowfield",
  pos = { x = 7, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- bootgaiter
local bootgaiter = {
  name = "Bootgaiter",
  pos = { x = 8, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Sobrescribimos el debilitamiento del motor para perdonar a los de Bosque
local card_set_debuff_ref = Card.set_debuff
function Card:set_debuff(should_debuff)
    local prevent = false
    local saved_perma = nil
    if self.ability and self.ability.forest_sticker then
        local maddox = G.jokers and G.jokers.cards and get_joker_with_key("j_ina_Maddox")
        prevent = maddox and not maddox.debuff
    end
    
    if prevent then should_debuff = false; saved_perma = self.ability.perma_debuff; self.ability.perma_debuff = false end
    
    card_set_debuff_ref(self, should_debuff)
    
    if prevent and saved_perma ~= nil then self.ability.perma_debuff = saved_perma end
end


-- maddox
local Maddox = J({
  name = "Maddox",
  pos = { x = 9, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_Alpino",
  techtype = C.UPGRADES.Number,
  blueprint_compat = false,
  calculate = function(self, card, ctx)
  end,
  add_to_deck = function(self, card, from_debuff)
    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.ability and c.ability.forest_sticker then
          c.debuff = false
          if G.GAME and G.GAME.blind then G.GAME.blind:debuff_card(c) end
        end
      end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and not G.jokers.cards then return end
    if G.playing_cards then
      for _, c in ipairs(G.playing_cards) do
        if c.ability and c.ability.forest_sticker then
          c.debuff = false
          if G.GAME and G.GAME.blind then G.GAME.blind:debuff_card(c) end
        end
      end
    end
  end
})

-- skipolson
local skipolson = {
  name = "Skipolson",
  pos = { x = 10, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- shawn
local shawn = {
  name = "Shawn Froste",
  pos = { x = 11, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- climbstein
local climbstein = {
  name = "Climbstein",
  pos = { x = 1, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Rackner
local rackner = {
  name = "Rackner",
  pos = { x = 2, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- peggs
local peggs = {
  name = "Peggs",
  pos = { x = 3, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Ursus
local ursus = {
  name = "Ursus",
  pos = { x = 4, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Bogg
local bogg = {
  name = "Bogg",
  pos = { x = 5, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- strata
local strata = {
  name = "Strata",
  pos = { x = 6, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- onlign
local onlign = {
  name = "Onlign",
  pos = { x = 7, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

return {
  name = "Alpine",
  list = { Maddox }
}