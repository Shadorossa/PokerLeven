-- King
local King = J({
  name = "King",
  pos = { x = 3, y = 2 },
  config = { extra = { triggered = false } },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 1,
  pteam = "ina_team_RoyalAcademy",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) then
      local rankCount = 0
      for i, c in ipairs(context.scoring_hand) do
        if c:get_id() == 13 then
          rankCount = rankCount + 1
        end
      end

      if rankCount >= 3 then
        local rightmost_king = nil
        for i = #context.full_hand, 1, -1 do
          local c = context.full_hand[i]
          if c and c:get_id() == 13 then
            rightmost_king = c
            break
          end
        end

        if rightmost_king then
          card.ability.extra.triggered = true
          G.E_MANAGER:add_event(Event({ delay = 0.5, func = function() Pokerleven.clone_playing_card(rightmost_king, G.deck, 1); return true end }))
          return {
            message = "KING!",
            colour = G.C.XMULT
          }
        end
      end
    end
  end
})

-- Drent
local Drent = J({
  name = "Drent",
  pos = { x = 4, y = 2 },
  config = { extra = { odds = 5, triggered = false } },
  loc_vars = function(self, info_queue, center)
    local count = #find_player_type("Mountain");
    local odds = center.ability.extra.odds - count
    if odds < 0 then
      odds = 1
    end
    return { vars = { G.GAME.probabilities.normal, odds } }
  end,
  rarity = 2,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 2,
  pteam = "ina_team_RoyalAcademy",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.after and context.cardarea == G.jokers then
      local count = #find_player_type("Mountain");
      local odds = card.ability.extra.odds - count
      if odds < 0 then
        odds = 1
      end
      if not context.blueprint and pseudorandom('group_0_05214300') < G.GAME.probabilities.normal / odds then
          if Pokerleven.spawn_consumable('Tarot', 'c_tower') then
              card.ability.extra.triggered = true
              return { message = "Quake!", colour = G.C.PURPLE }
          end
      end
    end
  end
})

-- Simmons
local Simmons = J({
  name = "Simmons",
    pos = { x = 5, y = 2 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 3,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Master
local Master = J({
  name = "Master",
  pos = { x = 6, y = 2 },
  config = { extra = { mult_mod = 7, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.mult_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 4,
  pteam = "ina_team_RoyalAcademy",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) then
      if not card:get_left_joker() then
        local count = #find_player_team("ina_team_RoyalAcademy")
        return {
          message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult_mod * count } },
          colour = G.C.MULT,
          mult_mod = card.ability.extra.mult_mod * count
        }
      end
    end
  end
})

-- Martin
local Martin = J({
  name = "Martin",
  pos = { x = 7, y = 2 },
  config = { extra = { common_mult = 6, uncommon_mult = 12, rare_xmult = 1.5, legendary_exp = 1.15, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return {
      vars = { center.ability.extra.common_mult, center.ability.extra.uncommon_mult,
        center.ability.extra.rare_xmult, center.ability.extra.legendary_exp }
    }
  end,
  rarity = 2,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 5,
  pteam = "ina_team_RoyalAcademy",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not context.debuff and context.other_joker and not context.other_joker.debuff and card ~= context.other_joker then
      local rarity = context.other_joker.config.center.rarity
      local rarity_effects = {
        [1] = { key = 'a_mult', value = card.ability.extra.common_mult, type = 'mult' },
        [2] = { key = 'a_mult', value = card.ability.extra.uncommon_mult, type = 'mult' },
        [3] = { key = 'a_xmult', value = card.ability.extra.rare_xmult, type = 'xmult' },
        [4] = { key = 'a_powmult', value = card.ability.extra.legendary_exp, type = 'legendary' },
        ["ina_top"] = { key = 'a_xmult', value = card.ability.extra.rare_xmult, type = 'xmult' },
      }

      local effect = rarity_effects[rarity]
      if effect then
        card.ability.extra.triggered = true
        Pokerleven.trigger_other_joker_animation(context)

        if effect.type == 'legend ary' then
          return {
            mult_message = {
              message = localize({ type = "variable", key = effect.key, vars = { number_format(effect.value) } }),
              colour = G.C.DARK_EDITION,
            },
            mult = (mult ^ effect.value) - mult,
          }
        elseif effect.type == 'xmult' then
          return Pokerleven.create_xmult_return(effect.value, effect.key)
        else
          return Pokerleven.create_mult_return(effect.value, effect.key)
        end
      end
    end
  end,
})

-- Waldon
local Waldon = J({
  name = "Waldon",
    pos = { x = 8, y = 2 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 6,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Bloom
local Bloom = J({
  name = "Bloom",
  pos = { x = 9, y = 2 },
  config = { extra = { Xmult_mod = 3 } },
  loc_vars = function(self, info_queue, center)
    local grand_total = 0
    for _, card in pairs(G.GAME.cards_played) do
      grand_total = grand_total + card.total
    end
    return { vars = { center.ability.extra.Xmult_mod, grand_total } }
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 7,
  pteam = "ina_team_RoyalAcademy",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    local grand_total = 0
    for _, card in pairs(G.GAME.cards_played) do
      grand_total = grand_total + card.total
    end
    if context.joker_main and context.scoring_hand and next(context.poker_hands['Straight'])
        and grand_total >= 3 then
      return {
        Xmult = card.ability.extra.Xmult_mod
      }
    end
  end
})

-- Swing
local Swing = J({
  name = "Swing",
  pos = { x = 10, y = 2 },
  config = { extra = { chip_mod = 60, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 8,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  techtype = C.UPGRADES.Number,
  calculate = function(self, card, context)
    if context.scoring_hand and context.joker_main and next(context.poker_hands['Three of a Kind']) then
      local count = #find_player_team("ina_team_RoyalAcademy")
      card.ability.extra.triggered = true
      return {
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chip_mod * count } },
        colour = G.C.CHIPS,
        chip_mod = card.ability.extra.chip_mod * count
      }
    end
  end
})

-- Hatch
local Hatch = J({
  name = "Hatch",
    pos = { x = 11, y = 2 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 9,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Jude
local Jude = J({
  name = "Jude",
  pos = { x = 0, y = 0 },
  soul_pos = { x = 0, y = 1 },
  config = {
    extra = { current_Xmult = 1, Xmult_mod = 0.08, next_xmult = 1, triggered = false
    }
  },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.current_Xmult, center.ability.extra.Xmult_mod } }
  end,
  rarity = "ina_top",
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 8,
  atlas = "top",
  ptype = C.Wind,
  stage = "base",
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 10,
  pteam = "ina_team_RoyalAcademy",
  pcaptain = C.CAPTAIN,
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.post_trigger and context.other_card ~= card
        and context.other_card == card:get_left_joker() then
      card.ability.extra.current_Xmult = (card.ability.extra.current_Xmult or 0) + card.ability.extra.Xmult_mod

      G.E_MANAGER:add_event(Event({
        func = function()
          card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = localize("ina_evolve_level"),
            colour = G.C.XMULT
          })
          return true
        end
      }))

      return {}
    end

    if context.joker_main and context.scoring_hand then
      card.ability.extra.triggered = true
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.current_Xmult } },
        colour = G.C.XMULT,
        Xmult_mod = card.ability.extra.current_Xmult
      }
    end
  end
})

-- Samford
local Samford = J({
  name = "Samford",
  pos = { x = 0, y = 3 },
  config = { extra = { Xmult_mod = 3, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.Xmult_mod } }
  end,
  rarity = 2,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 11,
  pteam = "ina_team_RoyalAcademy",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_hand then
      if #find_player_position("FW") >= 2 and #find_player_position("MF") >= 1 then
        card.ability.extra.triggered = true
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.Xmult_mod } },
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.Xmult_mod
        }
      end
    end
  end
})

-- Carlton
local Carlton = J({
  name = "Carlton",
    pos = { x = 1, y = 3 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 12,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Tomlinson
local Tomlinson = J({
  name = "Tomlinson",
    pos = { x = 2, y = 3 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 13,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Lawrenson
local Lawrenson = J({
  name = "Lawrenson",
    pos = { x = 3, y = 3 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 14,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Potts
local Potts = J({
  name = "Potts",
    pos = { x = 4, y = 3 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 15,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Ingham
local Ingham = J({
  name = "Ingham",
    pos = { x = 5, y = 3 }, -- Placeholder pos
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["ina_team_RoyalAcademy"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 16,
  pteam = "ina_team_RoyalAcademy",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
  name = "Royal Academy",
  list = { King, Drent, Martin, Master, Bloom, Swing, Jude, Samford }
}


