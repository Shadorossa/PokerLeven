local ropes = J({
  name = "ropes",
  pos = { x = 1, y = 2 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local downtown = J({
  name = "Downtown",
  pos = { x = 2, y = 2 },
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
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local bindings = J({
  name = "Bindings",
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
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local gleeson = J({
  name = "Gleeson",
  pos = { x = 4, y = 2 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local snowfield = J({
  name = "Snowfield",
  pos = { x = 5, y = 2 },
  config = { extra = { chips = 150 } },
  loc_vars = function(self, info_queue, center)
    local count = 0
    if G.jokers and G.jokers.cards then
      for _, v in ipairs(G.jokers.cards) do
        if v.ability.pteam == "ina_team_Alpino" then
          count = count + 1
        end
      end
    end
    return { vars = { center.ability.extra.chips, count * center.ability.extra.chips, count } }
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and G.jokers and G.jokers.cards and card.area == G.jokers then
      local count = 0
      for _, v in ipairs(G.jokers.cards) do
        if v.ability.pteam == "ina_team_Alpino" then
          count = count + 1
        end
      end
      if count > 0 then
        return {
          message = localize { type = 'variable', key = 'a_chips', vars = { count * card.ability.extra.chips } },
          chip_mod = count * card.ability.extra.chips,
          colour = G.C.CHIPS
        }
      end
    end
  end,
  update = function(self, card, dt)
    if G.STAGE ~= G.STAGES.RUN or not G.jokers then return end
    local is_active = card.area == G.jokers and not card.debuff

    if G.jokers and G.jokers.cards then
      for _, v in ipairs(G.jokers.cards) do
        if v ~= card and v.ability.pteam == "ina_team_Alpino" then
          if is_active then
            if not v.ability.eternal then
              v.ability.eternal = true
              v.ability.ina_snowfield_eternal = true
            end
          else
            if v.ability.ina_snowfield_eternal then
              v.ability.eternal = false
              v.ability.ina_snowfield_eternal = nil
            end
          end
        end
      end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and G.jokers.cards then
      for _, v in ipairs(G.jokers.cards) do
        if v.ability.ina_snowfield_eternal then
          v.ability.eternal = false
          v.ability.ina_snowfield_eternal = nil
        end
      end
    end
  end
})

local bootgaiter = J({
  name = "Bootgaiter",
  pos = { x = 6, y = 2 },
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
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local Maddox = J({
  name = "Maddox",
  pos = { x = 7, y = 2 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
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
    if not G.jokers or not G.jokers.cards then return end
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

local skipolson = J({
  name = "Skipolson",
  pos = { x = 8, y = 2 },
  config = { extra = { type = 'Training' } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.type } }
  end,
  rarity = 1,
  pools = { ["Alpine"] = true },
  cost = 4,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.skip_blind then
      if Pokerleven.spawn_consumable(card.ability.extra.type) then
        return {
          message = localize('k_plus_tarot'),
          colour = G.C.SECONDARY_SET.Tarot,
          card = card
        }
      end
    end
  end
})

local shawn = J({
  name = "Shawn Froste",
  pos = { x = 9, y = 2 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local climbstein = J({
  name = "Climbstein",
  pos = { x = 10, y = 2 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local rackner = J({
  name = "Rackner",
  pos = { x = 11, y = 2 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local peggs = J({
  name = "Peggs",
  pos = { x = 12, y = 2 },
  config = { extra = { chips = 80 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chips } }
  end,
  rarity = 1,
  pools = { ["Alpine"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.blind and G.GAME.blind.boss then
      return {
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
        chip_mod = card.ability.extra.chips,
        colour = G.C.CHIPS
      }
    end
  end
})

local ursus = J({
  name = "Ursus",
  pos = { x = 0, y = 3 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local bogg = J({
  name = "Bogg",
  pos = { x = 1, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Alpine"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local strata = J({
  name = "Strata",
  pos = { x = 2, y = 3 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

local onlign = J({
  name = "Onlign",
  pos = { x = 3, y = 3 },
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
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_Alpino",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
  name = "Alpine",
  list = { Maddox, skipolson, peggs, snowfield }
}
