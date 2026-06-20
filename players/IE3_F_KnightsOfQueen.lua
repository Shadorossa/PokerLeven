-- Helper: Check if cards form consecutive sequence
local function is_straight_sequence(cards)
  if #cards < 2 then return #cards == 1 end
  local sorted_ids = {}
  for _, c in ipairs(cards) do table.insert(sorted_ids, c:get_id()) end
  table.sort(sorted_ids)
  for i = 2, #sorted_ids do if sorted_ids[i] - sorted_ids[i-1] ~= 1 then return false end end
  return true
end

-- Helper: Check if all cards are same suit
local function is_flush_check(cards)
  for _, suit in ipairs({'S', 'H', 'C', 'D'}) do
    local all_match = true
    for _, c in ipairs(cards) do if not c:is_suit(suit, nil, true) then all_match = false; break end end
    if all_match then return true end
  end
  return false
end

if not SMODS then SMODS = {} end
if not SMODS.original_evaluate_poker_hand then
  SMODS.original_evaluate_poker_hand = evaluate_poker_hand
  evaluate_poker_hand = function(cards, hand_type, handname)
    local result = SMODS.original_evaluate_poker_hand(cards, hand_type, handname)
    if G.GAME and G.jokers and #cards < 5 then
      local edgar = SMODS.find_card('j_ina_Edgar_Partinus')[1]
      if edgar then
        local ex = edgar.ability.extra
        local cycle_pos = (ex.straights_count % 8) + 1
        if #cards == cycle_pos and is_straight_sequence(cards) then
          local flush = is_flush_check(cards)
          if flush then
            result["Straight Flush"] = { cards }
            result.top = result["Straight Flush"]
          end
          result["Straight"] = { cards }
          if not flush then result.top = result["Straight"] end
        end
      end
    end
    return result
  end
end

-- Freddy McQueen (1)
local Freddy_McQueen = J({
  name = "Freddy McQueen",
  pos = { x = 2, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_3,
  pnumber = 1,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jonny Gascoigne (2)
local Jonny_Gascoigne = J({
  name = "Jonny Gascoigne",
  pos = { x = 3, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_3,
  pnumber = 2,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- David Buckingham (3)
local David_Buckingham = J({
  name = "David_Buckingham",
  pos = { x = 4, y = 6 },
  config = { extra = { floors = 0, active_fortification = false } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    local status = ""
    if ex.active_fortification then
      status = "¡Fortificación lista!"
    else
      status = "Pisos: " .. ex.floors .. "/5"
    end
    return { vars = { status } }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 3,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.joker_main and ctx.scoring_hand and not ctx.blueprint and ex.active_fortification then
      card_eval_status_text(card, 'extra', nil, nil, nil, { message = '¡Palacio!', colour = G.C.MOUNTAIN })
      return { Xchip_mod = 3, card = card }
    end

    if ctx.after and not ctx.blueprint then
      if ex.active_fortification then
        ex.active_fortification = false
      else
        ex.floors = ex.floors + 1
        if ex.floors >= 5 then
          ex.floors, ex.active_fortification = 0, true
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = '¡Palacio Construido!', colour = G.C.MOUNTAIN })
        else
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Piso ' .. ex.floors .. '/5', colour = G.C.MOUNTAIN })
        end
      end
    end
  end
})

-- Lance Ralton (4)
local Lance_Ralton = J({
  name = "Lance_Ralton",
  pos = { x = 5, y = 6 },
  config = { extra = { consecutive_count = 0, last_rank = nil } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    local rank_name = "Ninguno"
    if ex.last_rank then
      local ok, res = pcall(localize, ex.last_rank, 'ranks')
      if ok and res then
        rank_name = res
      else
        rank_name = tostring(ex.last_rank)
      end
    end
    return { vars = { rank_name, ex.consecutive_count } }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.after and not ctx.blueprint and ctx.scoring_hand then
      local ex = card.ability.extra
      local rank_counts = {}
      for _, c in ipairs(ctx.scoring_hand) do
        local rank = c.base.value
        rank_counts[rank] = (rank_counts[rank] or 0) + 1
      end

      local played_rank = nil
      for rank, count in pairs(rank_counts) do
        if count >= 3 then played_rank = rank; break end
      end

      if played_rank then
        if ex.last_rank == played_rank then
          ex.consecutive_count = ex.consecutive_count + 1
          if ex.consecutive_count >= 3 then
            ex.consecutive_count, ex.last_rank = 0, nil
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = '¡Carga de Lanza!', colour = G.C.WIND })
            play_sound('tarot2', 1.2, 0.6)
            G.E_MANAGER:add_event(Event({ func = function()
              if G.GAME and G.GAME.blind then
                G.GAME.blind.chips = G.GAME.blind.chips * 0.85
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
              end
              return true
            end }))
          else
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'Lanza: ' .. ex.consecutive_count .. '/3', colour = G.C.WIND })
          end
        else
          ex.last_rank, ex.consecutive_count = played_rank, 1
        end
      else
        ex.last_rank, ex.consecutive_count = nil, 0
      end
    end
  end
})

-- Edge Ripper (5)
local Edge_Ripper = J({
  name = "Edge Ripper",
  pos = { x = 6, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Peter Coole (6)
local Peter_Coole = J({
  name = "Peter Coole",
  pos = { x = 7, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gary Mane (7)
local Gary_Mane = J({
  name = "Gary_Mane",
  pos = { x = 8, y = 6 },
  config = { extra = { x_chips = 1.0, x_chips_gain = 0.2, last_hand_type = nil } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    local last_hand_localized = "Ninguna"
    if ex.last_hand_type then
      local ok, res = pcall(localize, ex.last_hand_type, 'poker_hands')
      if ok and res then
        last_hand_localized = res
      else
        last_hand_localized = tostring(ex.last_hand_type)
      end
    end
    return { vars = { ex.x_chips_gain, ex.x_chips, last_hand_localized } }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.joker_main and ctx.scoring_hand and not ctx.blueprint and ex.x_chips > 1.0 then
      card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'X' .. string.format('%.2f', ex.x_chips), colour = G.C.MOUNTAIN })
      return { Xchip_mod = ex.x_chips, card = card }
    end

    if ctx.after and not ctx.blueprint and ctx.scoring_name then
      if ex.last_hand_type == ctx.scoring_name then
        ex.x_chips = ex.x_chips + ex.x_chips_gain
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = 'X' .. string.format('%.2f', ex.x_chips), colour = G.C.MOUNTAIN })
      else
        if ex.last_hand_type then
          local bonus = ex.x_chips - 1.0
          if bonus > 0 then
            ex.x_chips = 1.0 + (bonus / 2)
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = '¡Cadena rota! X' .. string.format('%.2f', ex.x_chips), colour = G.C.MOUNTAIN })
          end
        end
        ex.last_hand_type = ctx.scoring_name
      end
    end
  end
})

-- Paul Appleton (8)
local Paul_Appleton = J({
  name = "Paul Appleton",
  pos = { x = 9, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 8,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Eric Purpleton (9)
local Eric_Purpleton = J({
  name = "Eric Purpleton",
  pos = { x = 10, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 9,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Edgar Partinus (10)
local Edgar_Partinus = J({
  name = "Edgar_Partinus",
  pos = { x = 11, y = 0 },
  soul_pos = {x = 11, y = 1},
  config = { extra = { straights_count = 0, straight_cycle = { -0.2, 0.1, 0.5, 1, 2.5, 1, 0.5, 0.1 } } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    local cycle_pos = (ex.straights_count % 8) + 1
    local modifier = ex.straight_cycle[cycle_pos]
    local modifier_display = (modifier * 100) .. "%"
    if modifier >= 0 then modifier_display = "+" .. modifier_display end

    local cards_needed = cycle_pos
    local nivel_map = { 'Edgar_Nivel1', 'Edgar_Nivel2', 'Edgar_Nivel3', 'Edgar_Nivel4', 'Edgar_Nivel5', 'Edgar_Nivel4', 'Edgar_Nivel3', 'Edgar_Nivel2' }
    info_queue[#info_queue + 1] = { set = 'Other', key = nivel_map[cycle_pos], vars = { cards_needed } }

    return { vars = {
      modifier_display
    } }
  end,
  rarity = "ina_top",
  pools = { ["Knights of Queen"] = true },
  cost = 7,
  atlas = "top",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pnumber = 10,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  add_to_deck = function(self, card, from_debuff)
    G.GAME.edgar_partinus_active = card
  end,
  remove_from_deck = function(self, card, from_debuff)
    G.GAME.edgar_partinus_active = nil
  end,
  calculate = function(self, card, ctx)
    if ctx.joker_main and ctx.scoring_hand and not ctx.blueprint then
      local ex = card.ability.extra
      local cycle_pos = (ex.straights_count % 8) + 1
      local is_straight = (#ctx.scoring_hand >= 5 and ctx.poker_hands and (ctx.poker_hands["Straight"] or ctx.poker_hands["Straight Flush"])) or
                         (#ctx.scoring_hand == cycle_pos and is_straight_sequence(ctx.scoring_hand))

      if is_straight then
        local modifier = ex.straight_cycle[cycle_pos]
        ex.straights_count = ex.straights_count + 1
        card_eval_status_text(card, 'extra', nil, nil, nil, { message = '¡Excalibur!', colour = G.C.WIND })

        if modifier ~= 0 then
          return { Xchip_mod = 1 + modifier, Xmult_mod = 1 + modifier, card = card }
        end
      end
    end
  end
})

-- Philip Arwen (11)
local Philip_Arwen = J({
  name = "Philip Arwen",
  pos = { x = 12, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_3,
  pnumber = 11,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Servilius Jeeves (12)
local Servilius_Jeeves = J({
  name = "Servilius Jeeves",
  pos = { x = 0, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Martin Squall (13)
local Martin_Squall = J({
  name = "Martin Squall",
  pos = { x = 1, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Nick Woodgate (14)
local Nick_Woodgate = J({
  name = "Nick_Woodgate",
  pos = { x = 2, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 14,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mikey Richards (15)
local Mikey_Richards = J({
  name = "Mikey_Richards",
  pos = { x = 3, y = 7 },
  config = { extra = { hands_scored = 0, target_hands = 3, cards_to_add = 8 } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    return { vars = { ex.target_hands, ex.cards_to_add, ex.hands_scored } }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 15,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.after and not ctx.blueprint then
      local ex = card.ability.extra
      ex.hands_scored = ex.hands_scored + 1

      if ex.hands_scored >= ex.target_hands and G.discard and #G.discard.cards > 0 then
        ex.hands_scored = 0
        local num_to_move = math.min(#G.discard.cards, ex.cards_to_add)

        card_eval_status_text(card, 'extra', nil, nil, nil, { message = '¡Ciclo del Bosque!', colour = G.C.FOREST })
        play_sound('cardSlide1', 1.1, 0.8)

        for i = 1, num_to_move do
          local idx = math.random(1, #G.discard.cards)
          local chosen_card = G.discard.cards[idx]
          G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1 * i,
            func = function()
              if chosen_card.area == G.discard then
                G.discard:remove_card(chosen_card)
                G.hand:add_card(chosen_card)
              end
              return true
            end
          }))
        end
      end
    end
  end
})

-- Sirius Pounding (16)
local Sirius_Pounding = J({
  name = "Sirius Pounding",
  pos = { x = 4, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Knights of Queen"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ENGLAND,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Knights of Queen",
  list = {
    David_Buckingham,
    Lance_Ralton,
    Gary_Mane,
    Edgar_Partinus,
    Mikey_Richards
  }
}
