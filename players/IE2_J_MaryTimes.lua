local Rocky = J({
  name = "Rocky Black",
  pos = { x = 12, y = 9 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Scuba = J({
  name = "Chad Taylor",
  pos = { x = 0, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hills = J({
  name = "Victor Hills",
  pos = { x = 1, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hurley = J({
  name = "Hurley Kane",
  pos = { x = 2, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Redding = J({
  name = "Hector Redding",
  pos = { x = 3, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Fordline = J({
  name = "Mackenzie Fordline",
  pos = { x = 4, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Soundtown = J({
  name = "Soundtown",
  pos = { x = 5, y = 10 },
  config = { extra = { 
    current_Xmult = 1, 
    tuning = 1, -- 0: Low, 1: Med, 2: High
    targets = {high = {}, med = {}}
  } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    local tuning_str = "Medio"
    local tuning_col = G.C.ORANGE
    if ex.tuning == 2 then tuning_str = "Â¡ALTO!"; tuning_col = G.C.GREEN
    elseif ex.tuning == 0 then tuning_str = "Bajo"; tuning_col = G.C.RED end
    
    return { vars = { tuning_str, ex.current_Xmult, tuning_col } }
  end,
  rarity = 3,
  pools = { ["Mary Times"] = true },
  cost = 10,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  add_to_deck = function(self, card, from_debuff)
    -- Audio will start when blind begins (setting_blind)
  end,
  remove_from_deck = function(self, card, from_debuff)
    Pokerleven.soundtown_stop()
  end,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    
    -- Generate conditions and start music at start of round
    if ctx.setting_blind and not ctx.blueprint then
        local possible = {
            {type = 'suit', val = 'Hearts'}, {type = 'suit', val = 'Diamonds'}, {type = 'suit', val = 'Clubs'}, {type = 'suit', val = 'Spades'},
            {type = 'count', val = 1}, {type = 'count', val = 2}, {type = 'count', val = 3}, {type = 'count', val = 4}, {type = 'count', val = 5},
            {type = 'hand', val = 'Pair'}, {type = 'hand', val = 'Two Pair'}, {type = 'hand', val = 'Three of a Kind'}, 
            {type = 'hand', val = 'Straight'}, {type = 'hand', val = 'Flush'}, {type = 'hand', val = 'Full House'}
        }
        pseudoshuffle(possible, pseudoseed('soundtown_shuffle'))
        ex.targets.high = {possible[1], possible[2]}
        ex.targets.med = {possible[3], possible[4], possible[5], possible[6]}
        ex.tuning = 1
        Pokerleven.soundtown_start(1)
    end

    -- Stop music at end of round (before shop)
    if Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
        Pokerleven.soundtown_stop()
    end

    if Pokerleven.is_joker_turn(ctx) then
        return {
            Xmult_mod = ex.current_Xmult,
            message = localize{type='variable',key='a_xmult',vars={ex.current_Xmult}}
        }
    end

    if ctx.after and not ctx.blueprint then
        local hand_type = ctx.scoring_name
        local card_count = #ctx.scoring_hand
        local has_suit = function(s) 
            for _, c in ipairs(ctx.scoring_hand) do if c:is_suit(s) then return true end end
            return false
        end

        local check_cond = function(cond)
            if cond.type == 'suit' then return has_suit(cond.val)
            elseif cond.type == 'count' then return card_count == cond.val
            elseif cond.type == 'hand' then return hand_type == cond.val end
            return false
        end

        local new_tuning = 0
        local is_high = false
        for _, c in ipairs(ex.targets.high) do if check_cond(c) then is_high = true; break end end
        
        if is_high then
            new_tuning = 2
            ex.current_Xmult = ex.current_Xmult + 0.75
        else
            local is_med = false
            for _, c in ipairs(ex.targets.med) do if check_cond(c) then is_med = true; break end end
            if is_med then
                new_tuning = 1
                ex.current_Xmult = ex.current_Xmult + 0.25
            else
                new_tuning = 0
                ex.current_Xmult = math.max(1, ex.current_Xmult - 0.5)
            end
        end

        ex.tuning = new_tuning
        Pokerleven.soundtown_set_tuning(new_tuning)
        
        return {
            message = new_tuning == 2 and "Â¡SintonÃ­a ALTA!" or (new_tuning == 0 and "SintonÃ­a Baja..." or "SintonÃ­a Media"),
            colour = new_tuning == 2 and G.C.GREEN or (new_tuning == 0 and G.C.RED or G.C.ORANGE)
        }
    end
  end
})

local Delight = J({
  name = "Dora Delight",
  pos = { x = 6, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Contented = J({
  name = "Tom Contented",
  pos = { x = 7, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Easton = J({
  name = "Joston Easton",
  pos = { x = 8, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Shark = J({
  name = "Spring Millpond",
  pos = { x = 9, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Cooley = J({
  name = "Gaston Cooley",
  pos = { x = 10, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Breakfast = J({
  name = "Bevan_Breakfast",
  pos = { x = 11, y = 10 },
  config = { extra = { discards = 2 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.discards } }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and G.GAME.current_round.hands_played == 0 and context.scoring_name == "Pair" then
      ease_discard(card.ability.extra.discards)
      return {
        message = localize('k_active_ex'),
        card = card
      }
    end
  end
})

local Griddle = J({
  name = "Jack_Griddle",
  pos = { x = 12, y = 10 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play and not context.end_of_round then
      local other = context.other_card
      if other.seal == 'Red' and not other.edition then
        other:set_ability(G.P_CENTERS.m_glass)
        G.E_MANAGER:add_event(Event({
          func = function()
            other:juice_up()
            return true
          end
        }))
        return {
          message = localize('k_glass'),
          colour = G.C.ICE
        }
      end
    end
  end
})

local Andagi = J({
  name = "Stan Andagi",
  pos = { x = 0, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Talent = J({
  name = "Coral_Talent",
  pos = { x = 1, y = 11 },
  config = { extra = { boost = 1.02 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { (center.ability.extra.boost - 1) * 100 } }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
      local mt_jokers = find_player_team("ina_team_MaryTimes")
      -- TambiÃ©n buscamos en el banquillo
      if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
        for _, b in ipairs(Pokerleven.ina_bench_area.cards) do
          if is_team(b, "ina_team_MaryTimes") then
            table.insert(mt_jokers, b)
          end
        end
      end

      local keys_to_scale = { "mult", "chips", "Xmult_mod", "chip_mod", "current_Xmult", "xmult" }
      for _, v in ipairs(mt_jokers) do
        if v ~= card and v.ability and v.ability.extra and type(v.ability.extra) == "table" then
          for _, key in ipairs(keys_to_scale) do
            if v.ability.extra[key] and type(v.ability.extra[key]) == "number" then
              v.ability.extra[key] = v.ability.extra[key] * card.ability.extra.boost
            end
          end
          v:juice_up()
        end
      end
      return {
        message = "Â¡Ritmo Coral!",
        colour = G.C.WIND
      }
    end
  end
})

return {
  name = "Mary Times",
  list = { Soundtown, Breakfast, Griddle, Talent }
}

