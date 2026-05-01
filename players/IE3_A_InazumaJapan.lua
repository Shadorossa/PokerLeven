-- Mark
local Mark_IJ = J({
  name = "Mark_IJ",
  pos = { x = 0, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Nathan
local Nathan_IJ = J({
  name = "Nathan_IJ",
  pos = { x = 1, y = 0 }, -- Keep y=0
  config = { extra = { xmult = 1.3, triggered = false } },
  loc_vars = function(self, info_queue, center)
    local count = #find_player_team("ina_team_Raimon") + #find_player_team("ina_team_InazumaJapon")
    return { vars = { count, center.ability.extra.xmult } }
  end,
  rarity = 2,
  pools = { ["Inazuma Japón"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  techtype = C.UPGRADES.Plus,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not context.debuff and context.other_joker then
      if is_team(context.other_joker, "ina_team_Raimon") or is_team(context.other_joker, "ina_team_InazumaJapon") then
        card.ability.extra.triggered = true
        G.E_MANAGER:add_event(Event({
          func = function()
            context.other_joker:juice_up(0.5, 0.5)
            return true
          end
        }))
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } },
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.xmult
        }
      end
    end
  end,
})

-- Jack
local Jack_IJ = J({
  name = "Jack_IJ",
  pos = { x = 2, y = 0 }, -- Keep y=0
  config = { extra = { chips_mod = 10, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chips_mod } }
  end,
  rarity = 2,
  pools = { ["Inazuma Japón"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  techtype = C.UPGRADES.Plus,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play
        and not context.other_card.debuff and not context.end_of_round
        and SMODS.has_enhancement(context.other_card, 'm_stone') then
      card.ability.extra.triggered = true

      local count = #find_player_position("DF")
      context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus or 0
      context.other_card.ability.perma_bonus = context.other_card.ability.perma_bonus +
          card.ability.extra.chips_mod * count
      return {
        extra = { message = localize('k_upgrade_ex'), colour = G.C.CHIPS },
        colour = G.C.CHIPS,
        card = card
      }
    end
  end,
})

-- Hurley
local Hurley_IJ = J({
  name = "Hurley_IJ",
  pos = { x = 3, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Scotty
local Scotty_IJ = J({
  name = "Scotty_IJ",
  pos = { x = 4, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Archer
local Archer_IJ = J({
  name = "Archer_IJ",
  pos = { x = 5, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Caleb
local Caleb_IJ = J({
  name = "Caleb_IJ",
  pos = { x = 6, y = 0 }, -- Keep y=0
  config = { extra = { current_xmult = 1, xmult_gain = 0.5, redux_turns = 0, turns_needed = 4 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.current_xmult, ex.xmult_gain, ex.turns_needed, ex.turns_needed - (ex.redux_turns or 0) } }
  end,
  rarity = 3,
  pools = { ["Inazuma Japón"] = true },
  cost = 8,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_InazumaJapon",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then
      local des, ba = false, Pokerleven.ina_bench_area
      for i = ba and ba.cards and #ba.cards or 0, 1, -1 do
        local b = ba.cards[i]
        if is_team(b, "ina_team_RoyalAcademy") or is_team(b, "ina_team_RoyalRedux") then
          ex.current_xmult, des = ex.current_xmult + ex.xmult_gain, true
          b:start_dissolve({ G.C.RED }, nil, 1.6)
        end
      end
      if des then
        card_eval_status_text(card, 'extra', nil, nil, nil,
          { message = localize { type = 'variable', key = 'a_xmult', vars = { ex.current_xmult } } })
      end
    elseif Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
      local k, s
      for _, v in ipairs(G.jokers.cards) do
        if v.config.center_key == 'j_ina_King' then
          k = v
        elseif v.config.center_key == 'j_ina_Samford' then
          s = v
        end
      end
      if k or s then
        ex.redux_turns = (ex.redux_turns or 0) + 1
        if ex.redux_turns >= ex.turns_needed then
          ex.redux_turns = 0
          if k then ina_evolve(k, 'j_ina_KingR') end
          if s then ina_evolve(s, 'j_ina_SamfordR') end
        else
          return { message = ex.redux_turns .. "/" .. ex.turns_needed, colour = G.C.DARK_EDITION }
        end
      else
        ex.redux_turns = 0
      end
    elseif Pokerleven.is_joker_turn(ctx) and ex.current_xmult > 1 then
      return {
        message = localize { type = 'variable', key = 'a_xmult', vars = { ex.current_xmult } },
        Xmult_mod = ex
            .current_xmult
      }
    end
  end
})

-- Shawn
local Shawn_IJ = J({
  name = "Shawn_IJ",
  pos = { x = 7, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Axel
local Axel_IJ = J({
  name = "Axel_IJ",
  pos = { x = 9, y = 0 },
  soul_pos = { x = 9, y = 1 },
  config = { extra = { copies_number = 2, xmult = 3 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.copies_number, center.ability.extra.xmult } }
  end,
  rarity = "ina_top",
  pools = { ["Inazuma Japón"] = true },
  cost = 8,
  atlas = "top",
  ptype = C.Fire,
  pposition = C.FW,
  techtype = C.UPGRADES.Number,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = false,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.before and ctx.cardarea == G.jokers and not ctx.blueprint then
      if ctx.scoring_name == 'Three of a Kind' and #ctx.full_hand == 3 then
        local first_card = ctx.scoring_hand[1]

        local clones = Pokerleven.clone_playing_card(first_card, G.play, ex.copies_number)
        for _, copy in ipairs(clones) do table.insert(ctx.scoring_hand, copy) end

        for _, c in ipairs(ctx.scoring_hand) do
          if not c.ability.fire_sticker then
            apply_property_sticker(c, 'Fire', 'type')
            c:juice_up()
          end
        end

        return {
          message = localize("ina_fuego_total"),
          colour = G.C.RED
        }
      end
    elseif ctx.joker_main and ctx.scoring_hand then
      local all_f = true
      for _, v in ipairs(ctx.scoring_hand) do
        if not (v:is_suit('Hearts') or v.ability.fire_sticker) then
          all_f = false; break
        end
      end
      if all_f and ex.xmult > 1 then
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { ex.xmult } },
          Xmult_mod = ex.xmult,
          colour =
              G.C.XMULT
        }
      end
    end
  end,
})

-- Austin
local Austin_IJ = J({
  name = "Austin_IJ",
  pos = { x = 9, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Thor
local Thor_IJ = J({
  name = "Thor_IJ",
  pos = { x = 10, y = 0 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jude
local Jude_IJ = J({
  name = "Jude_IJ",
  pos = { x = 8, y = 0 },
  soul_pos = { x = 8, y = 1 },
  config = {
    extra = { current_xmult = 1, xmult_mod = 0.08, next_xmult = 1, triggered = false
    }
  },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.current_xmult, center.ability.extra.xmult_mod } }
  end,
  rarity = "ina_top",
  cost = 8,
  atlas = "top",
  stage = "one",
  ptype = C.Wind,
  pposition = C.MF,
  techtype = C.UPGRADES.Plus,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.post_trigger and context.other_card ~= card
        and context.other_card == card:get_left_joker() then
      card.ability.extra.current_xmult = (card.ability.extra.current_xmult or 0) + card.ability.extra.xmult_mod

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
        message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.current_xmult } },
        colour = G.C.XMULT,
        Xmult_mod = card.ability.extra.current_xmult
      }
    end
  end
})

-- Samford
local Samford_IJ = J({
  name = "Samford_IJ",
  pos = { x = 0, y = 1 }, -- Keep y=0
  config = { extra = { xmult_mod = 3, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.xmult_mod } }
  end,
  rarity = 2,
  pools = { ["Inazuma Japón"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_InazumaJapon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_hand then
      if #find_player_position("FW") >= 2 and #find_player_position("MF") >= 1 then
        card.ability.extra.triggered = true
        return {
          message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult_mod } },
          colour = G.C.XMULT,
          Xmult_mod = card.ability.extra.xmult_mod
        }
      end
    end
  end,
})

-- Kevin
local Kevin_IJ = J({
  name = "Kevin_IJ",
  pos = { x = 1, y = 1 }, -- Keep y=0
  config = { extra = { retriggers = 1, cooldown_base = 6, current_cooldown = 6 } },
  loc_vars = function(self, info_queue, card)
    return {
      key = (card.ability.extra.tech_level or 0) < 5 and 'j_ina_Kevin_IJ' or 'j_ina_Kevin_inf_IJ',
      vars = { card.ability.extra.cooldown_base, card.ability.extra.current_cooldown }
    }
  end,
  rarity = 2,
  pools = { ["Inazuma Japón"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_InazumaJapon",
  techtype = C.UPGRADES.Plus,
  calculate = function(self, card, context)
    if card.ability.extra.current_cooldown == 0 and context.retrigger_joker_check and not context.retrigger_joker and context.other_card ~= self then
      if context.other_card == card:get_right_joker() and is_position(context.other_card, "FW") then
        return { message = localize("k_again_ex"), repetitions = card.ability.extra.retriggers, card = card }
      else
        return nil, true
      end
    elseif card.ability.extra.current_cooldown > 0 and Pokerleven.is_joker_turn(context) then
      card.ability.extra.current_cooldown = card.ability.extra.current_cooldown - 1
    end
    if card.ability.extra.current_cooldown == 0 and context.end_of_round then
      card.ability.extra.current_cooldown = card.ability.extra.cooldown_base
    end
  end,
})

-- Xavier
local Xavier_IJ = J({
  name = "Xavier_IJ",
  pos = { x = 2, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Darren
local Darren_IJ = J({
  name = "Darren_IJ",
  pos = { x = 3, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Inazuma Japón"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_InazumaJapon",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "InazumaJapan",
  list = { Nathan_IJ, Jack_IJ, Caleb_IJ, Axel_IJ, Jude_IJ, Samford_IJ, Kevin_IJ }
}
