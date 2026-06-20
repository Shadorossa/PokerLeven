local original_evaluate_poker_hand = evaluate_poker_hand

evaluate_poker_hand = function(cards, hand_type, handname)
  local result = original_evaluate_poker_hand(cards, hand_type, handname)

  if G.GAME and G.jokers then
    local edgar = nil
    for _, joker in ipairs(G.jokers.cards) do
      if joker.ability.name == 'Edgar_Partinus' then
        edgar = joker
        break
      end
    end

    if edgar then
      local ex = edgar.ability.extra
      local cycle_pos = (ex.straights_count % 8) + 1
      local cards_needed = cycle_pos

      if #cards == cards_needed and #cards < 5 then
        local is_consecutive, sorted_cards = Pokerleven.check_short_straight(cards)
        if is_consecutive then
          -- Check if it's also a Flush
          local is_flush = true
          local suits = {"Spades", "Hearts", "Clubs", "Diamonds"}
          local common_suit = nil
          for _, s in ipairs(suits) do
            local all_have_suit = true
            for _, c in ipairs(sorted_cards) do
              if not c:is_suit(s, nil, true) then
                all_have_suit = false
                break
              end
            end
            if all_have_suit then
              common_suit = s
              break
            end
          end
          is_flush = (common_suit ~= nil)

          if is_flush then
            result["Straight Flush"] = { sorted_cards }
            result["Straight"] = { sorted_cards }
            result.top = result["Straight Flush"]
          else
            result["Straight"] = { sorted_cards }
            result.top = result["Straight"]
          end
        end
      end
    end
  end

  return result
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
  name = "David Buckingham",
  pos = { x = 4, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
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
  calculate = function(self, card, ctx) end
})

-- Lance Ralton (4)
local Lance_Ralton = J({
  name = "Lance Ralton",
  pos = { x = 5, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
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
  calculate = function(self, card, ctx) end
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
  name = "Gary Mane",
  pos = { x = 8, y = 6 },
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
  pnumber = 7,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
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
    local ex = center.ability.extra
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
    if ctx.joker_main and ctx.scoring_hand then
      local ex = card.ability.extra
      local cycle_pos = (ex.straights_count % 8) + 1
      local cards_needed = cycle_pos
      local scoring_cards = #ctx.scoring_hand
      if scoring_cards == cards_needed or scoring_cards == 5 then
        local is_straight = false

        if scoring_cards >= 5 then
          is_straight = ctx.poker_hands and (ctx.poker_hands["Straight"] or ctx.poker_hands["Straight Flush"])
        else
          is_straight = Pokerleven.check_short_straight(ctx.scoring_hand)
        end

        if is_straight then
          local modifier = ex.straight_cycle[cycle_pos]
          ex.straights_count = ex.straights_count + 1

          -- Trigger Excalibur message and sound effect
          card_eval_status_text(card, 'extra', nil, nil, nil, { message = "Excalibur!", colour = G.C.WIND })

          if modifier ~= 0 then
            return {
              Xchip_mod = 1 + modifier,
              Xmult_mod = 1 + modifier,
              card = card
            }
          end
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
  name = "Nick Woodgate",
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
  name = "Mikey Richards",
  pos = { x = 3, y = 7 },
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
  pnumber = 15,
  pteam = "ina_team_KnightsOfQueen",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
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
    Edgar_Partinus
  }
}
