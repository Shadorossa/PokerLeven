-- Poseidon
local Poseidon = J({
  name = "Poseidon",
  pos = { x = 1, y = 12 },
  config = { extra = { min_face = 3, barriers_added = 1, chip_mod = 40, barriers = 1 } },
  loc_vars = function(self, info_queue, center)
    table.insert(info_queue, { set = "Other", key = "Frontal" })
    local barriers = center.ability.extra.barriers_added
    local chip_mod = center.ability.extra.chip_mod
    local min_face = center.ability.extra.min_face

    local current_barriers = G.GAME.current_round.barriers or 0
    local actual_chip_mod = current_barriers * chip_mod
    return { vars = { barriers, min_face, chip_mod, actual_chip_mod } }
  end,
  rarity = 3,
  pools = { ["ina_team_Zeus"] = true },
  cost = 8,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 1,
  techtype = C.UPGRADES.Number,
  pteam = "ina_team_Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context)
        and card:is_leftmost_joker()
        and card:has_enough_barriers() then
      local current_barriers = G.GAME.current_round.barriers
      local chip_mod = current_barriers * card.ability.extra.chip_mod
      card_eval_status_text(card, 'extra', nil, nil, nil, Pokerleven.ease_barriers(-current_barriers))
      return {
        chips = chip_mod
      }
    end

    if Pokerleven.is_joker_turn(context)
        and #context.scoring_hand > 2
        and Pokerleven.are_all_face(context) then
      local barriers = card.ability.extra.barriers_added
      return Pokerleven.ease_barriers(barriers)
    end
  end
})

-- Apollo
local Apollo = J({
  name = "Apollo",
  pos = { x = 2, y = 12 },
  config = { extra = { chip_mod = 14, alt_chip_mod = 4, mult_mod_low = 3, current_chips = 0, current_mult = 0, triggered = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod, center.ability.extra.alt_chip_mod, center.ability.extra.current_chips, center.ability.extra.mult_mod_low, center.ability.extra.current_mult } }
  end,
  rarity = 1,
  pools = { ["ina_team_Zeus"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 2,
  techtype = C.UPGRADES.Plus,
  pteam = "ina_team_Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and card.ability.extra.current_chips > 0 then
      return {
        message = 'Divino!',
        chip_mod = card.ability.extra.current_chips,
        colour = G.C.GOLD,
        mult_mod = card.ability.extra.current_mult
      }
    end

    if context.before and context.cardarea == G.jokers and context.scoring_hand
        and next(context.poker_hands["Two Pair"]) then
      local hour = tonumber(os.date("%H"))
      local mod = card.ability.extra.alt_chip_mod

      if hour >= 14 and hour < 19 then
        mod = card.ability.extra.chip_mod
        card.ability.extra.current_mult = card.ability.extra.current_mult + card.ability.extra.mult_mod_low
      end

      card.ability.extra.current_chips = card.ability.extra.current_chips + mod

      return {
        message = localize("k_upgrade_ex"),
        colour = G.C.CHIPS
      }
    end
  end
})

-- Hephestus
local Hephestus = J({
  name = "Hephestus",
  pos = { x = 3, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
  end,
  rarity = 2,
  pools = { ["ina_team_Zeus"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 3,
  techtype = C.UPGRADES.Number,
  pteam = "ina_team_Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.blind_defeated and not context.blueprint then
      local count = #Pokerleven.find_player_type_and_position("Fire", "DF")

      if count > 0 and G.deck and G.deck.cards and #G.deck.cards > 0 then
        table.unpack = table.unpack or unpack

        local candidates = { table.unpack(G.deck.cards) }

        for i = 1, count do
          if #candidates == 0 then break end

          local steelCard = pseudorandom_element(candidates, pseudoseed("steel_card_" .. i))
          if steelCard then
            convert_cards_to(steelCard, { mod_conv = "m_steel", true, true })
            card_eval_status_text(steelCard, 'extra', nil, nil, nil,
              { message = localize("ina_convert"), colour = G.C.MULT })

            for j, c in ipairs(candidates) do
              if c == steelCard then
                table.remove(candidates, j)
                break
              end
            end
          end
        end
      end
    end
  end
})

-- Ares
local Ares = J({
  name = "Ares",
  pos = { x = 4, y = 12 },
  rarity = 1,
  pools = { ["ina_team_Zeus"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 4,
  pteam = "ina_team_Zeus",
  calculate = function(self, card, context) end
})

-- Dionysus
local Dionysus = J({
  name = "Dionysus",
  pos = { x = 5, y = 12 },
  rarity = 1,
  pools = { ["ina_team_Zeus"] = true },
  cost = 4,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 5,
  pteam = "ina_team_Zeus",
  calculate = function(self, card, context) end
})

-- Artemis
local Artemis = J({
  name = "Artemis",
  pos = { x = 6, y = 12 },
  config = { extra = { current_chips = 0, chip_mod = 10 } },
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue + 1] = { set = 'Other', key = 'Harvester' }
    return { vars = { center.ability.extra.chip_mod, center.ability.extra.current_chips } }
  end,
  rarity = 2,
  pools = { ["ina_team_Zeus"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 6,
  techtype = C.UPGRADES.Plus,
  pteam = "ina_team_Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.discard and context.other_card.ability["ina_harvest_sticker"] == true then
      card.ability.extra.current_chips =
          card.ability.extra.current_chips + card.ability.extra.chip_mod
      return {
        message = localize("ina_harvest"),
        colour = G.C.MULT,
      }
    end
    if context.individual
        and context.cardarea == G.play
        and context.scoring_hand
        and context.other_card ~= nil
        and context.other_card:is_face() then
      context.other_card.ability["ina_harvest_sticker"] = true
      return {
        message = localize("ina_seed"),
        colour = G.C.MULT,
        card = context.other_card
      }
    end

    if context.scoring_hand and Pokerleven.is_joker_turn(context)
        and card.ability.extra.current_chips > 0 then
      card.ability.extra.triggered = true
      return {
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.current_chips } },
        colour = G.C.CHIPS,
        chip_mod = card.ability.extra.current_chips,
      }
    end
  end,
})

-- Hermes
local Hermes = J({
  name = "Hermes",
  pos = { x = 7, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2,
  pools = { ["ina_team_Zeus"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 7,
  pteam = "ina_team_Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.individual and context.other_card and G.GAME.current_round.hands_played == 0
        and context.cardarea == G.play and context.scoring_hand
        and next(context.poker_hands["Pair"]) and #context.scoring_hand == 2 then
      convert_cards_to(context.other_card, {
        mod_conv = "m_gold"
      }, false, false)
      return {
        message = localize("ina_convert"),
        colour = G.C.XMULT,
        card = context.other_card,
      }
    end
  end
})

-- Athena
local Athena = J({
  name = "Athena",
  pos = { x = 8, y = 12 },
  config = { extra = { freeze_active = true, time_frozen = false, used_this_round = false, preview_cards = {} } },
  loc_vars = function(self, info_queue, center)
    local status = center.ability.extra.used_this_round and "Usado" or "Listo"
    return { vars = { status } }
  end,
  rarity = 1,
  pools = { ["ina_team_Zeus"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pdorsal = 8,
  pteam = "ina_team_Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
    -- Reset at the start of each blind
    if context.setting_blind and not context.blueprint then
      card.ability.extra.used_this_round = false
      card.ability.extra.time_frozen = false
      card.ability.extra.preview_cards = {}

      if card:is_rightmost_joker() then
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = '⏰ Tiempo Congelado',
          colour = G.C.DARK_EDITION
        })
      end
    end

    -- Before hand is played: if rightmost and freeze available, save state
    if context.before and context.cardarea == G.jokers
        and not context.blueprint
        and card:is_rightmost_joker()
        and not card.ability.extra.used_this_round then

      card.ability.extra.time_frozen = true
      card.ability.extra.used_this_round = true
      card.ability.extra.preview_cards = {}
      card.ability.extra.saved_chips = G.GAME.chips

      -- Save cards about to be played
      if context.full_hand then
        for _, c in ipairs(context.full_hand) do
          table.insert(card.ability.extra.preview_cards, c)
        end
      end
    end

    -- After hand completes: if time was frozen, show preview then rewind
    if context.after and not context.blueprint
        and card.ability.extra.time_frozen
        and card:is_rightmost_joker() then

      -- Revert chips
      if card.ability.extra.saved_chips then
        G.GAME.chips = card.ability.extra.saved_chips
      end
      -- Restore hand count
      ease_hands_played(1)

      -- Return cards to hand
      if G.hand and card.ability.extra.preview_cards then
        for i, c in ipairs(card.ability.extra.preview_cards) do
          if c.area == G.play then
            G.play:remove_card(c)
            draw_card(nil, G.hand, i*100/#card.ability.extra.preview_cards, 'up', true, c)
            c.facing = 'front'
            c.states.visible = true
            c.states.drag.can = true
            c.states.collide.can = true
            c.states.hover.can = true
            c.states.click.can = true
          end
        end
      end

      card_eval_status_text(card, 'extra', nil, nil, nil, {
        message = '👁️ Vistazo del Destino',
        colour = G.C.DARK_EDITION
      })
      card_eval_status_text(card, 'extra', nil, nil, nil, {
        message = '⏪ Retroceso Temporal',
        colour = G.C.DARK_EDITION
      })
    end
  end,
})

-- Demeter
local Demeter = J({
  name = "Demeter",
  pos = { x = 9, y = 12 },
  config = { extra = { mult_mod_low = 4, chip_mod = 10 } },
  loc_vars = function(self, info_queue, center)
    local remaining_discards = G.GAME and G.GAME.current_round and G.GAME.current_round.discards_left or 0
    return {
      vars = {
        center.ability.extra.mult_mod_low,
        center.ability.extra.chip_mod,
        remaining_discards * center.ability.extra.mult_mod_low,
        remaining_discards * center.ability.extra.chip_mod
      }
    }
  end,
  rarity = 1,
  pools = { ["ina_team_Zeus"] = true },
  cost = 5,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 9,
  techtype = C.UPGRADES.Number,
  pteam = "ina_team_Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) then
      local remaining_discards = G.GAME.current_round.discards_left or 0
      local extra_mult = card.ability.extra.mult_mod_low * remaining_discards
      local extra_chips = card.ability.extra.chip_mod * remaining_discards

      if extra_mult > 0 or extra_chips > 0 then
        return {
          message = localize("ina_divine"),
          colour = G.C.MULT,
          mult_mod = extra_mult,
          chip_mod = extra_chips,
        }
      end
    end
  end
})

-- Aphrodite (CapitÃ¡n)
---@param card Card
local swap_random_to_fw_or_mf = function(card)
  local POS_FW = "FW"
  local POS_MF = "MF"

  local selected_pos = #find_player_position(POS_FW)
      > #find_player_position(POS_MF) and POS_FW or POS_MF

  apply_property_sticker(card, selected_pos, "position")

  card_eval_status_text(card, 'extra', nil, nil, nil,
    { message = selected_pos, colour = G.C.DARK_EDITION })
end

local get_byron_xmult = function(card, selected_position)
  local MULT_KEYS = {
    MF = "byron_mult_mf",
    FW = "byron_mult_fw"
  }

  local position_count = #find_player_position(selected_position)
  local zeus_count = #find_player_team("ina_team_Zeus")

  local mult_key = MULT_KEYS[selected_position] or MULT_KEYS.MF
  local selected_mult = card.ability.extra[mult_key]

  local turns_left = (selected_position == "FW")
      and G.GAME.current_round.discards_left
      or G.GAME.current_round.hands_left

  local factor = position_count + zeus_count
  local Xmult_mod = 1 + selected_mult * factor * turns_left
  return Xmult_mod
end

---@param card Card
---@param selected_position string
local select_byron_ability = function(card, selected_position)
  local Xmult_mod = get_byron_xmult(card, selected_position)

  return {
    message = localize {
      type = 'variable',
      key = 'a_xmult',
      vars = { Xmult_mod }
    },
    colour = G.C.MULT,
    Xmult_mod = Xmult_mod
  }
end

-- Aphrodite
local Aphrodite = J({
  name = "Aphrodite",
  pos = { x = 0, y = 2 },
  soul_pos = { x = 0, y = 3 },
  config = { extra = { byron_mult_fw = 0.6, byron_mult_mf = 0.3 } },
  loc_vars = function(self, info_queue, center)
    local position = center.ability.extra.pposition
    return { vars = { center.ability.extra.byron_mult_fw, center.ability.extra.byron_mult_mf, get_byron_xmult(center, position) } }
  end,
  rarity = 4,
  cost = 15,
  atlas = "legendary01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pdorsal = 10,
  pcaptain = C.CAPTAIN,
  techtype = C.UPGRADES.Plus,
  pteam = "ina_team_Zeus",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_end_of_round(context) then
      return swap_random_to_fw_or_mf(card)
    end

    if Pokerleven.is_joker_turn(context) then
      byron_position = card.ability.extra.pposition
      return select_byron_ability(card, byron_position)
    end
  end,
  unlocked = false,
  check_for_unlock = function(self, args)
    if G and G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante and G.GAME.round_resets.ante > 8 then
      unlock_card(self)
    end
  end
})

-- Hera
local Hera = J({
  name = "Hera",
  pos = { x = 10, y = 12 },
  rarity = 2,
  pools = { ["ina_team_Zeus"] = true },
  cost = 7,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pdorsal = 11,
  pteam = "ina_team_Zeus",
  calculate = function(self, card, context) end
})

-- Reservas (S)
local Icarus = J({ name = "Icarus", pos = { x = 11, y = 12 }, rarity = 1, pools = { ["ina_team_Zeus"] = true }, cost = 4, atlas = "Jokers01", ptype = C.Wind, pposition = C.GK, pgender = C.M, pnation = C.JAPAN, pyear = C.YEAR_2, pdorsal = 12, pteam = "ina_team_Zeus", calculate = function(self, card, context) end })
local Achilles = J({ name = "Achilles", pos = { x = 12, y = 12 }, rarity = 1, pools = { ["ina_team_Zeus"] = true }, cost = 4, atlas = "Jokers01", ptype = C.Mountain, pposition = C.FW, pgender = C.M, pnation = C.JAPAN, pyear = C.YEAR_1, pdorsal = 13, pteam = "ina_team_Zeus", calculate = function(self, card, context) end })
local Heracles = J({ name = "Heracles", pos = { x = 0, y = 13 }, rarity = 1, pools = { ["ina_team_Zeus"] = true }, cost = 4, atlas = "Jokers01", ptype = C.Fire, pposition = C.DF, pgender = C.M, pnation = C.JAPAN, pyear = C.YEAR_2, pdorsal = 14, pteam = "ina_team_Zeus", calculate = function(self, card, context) end })
local Chronos = J({ name = "Chronos", pos = { x = 1, y = 13 }, rarity = 1, pools = { ["ina_team_Zeus"] = true }, cost = 4, atlas = "Jokers01", ptype = C.Forest, pposition = C.DF, pgender = C.M, pnation = C.JAPAN, pyear = C.YEAR_2, pdorsal = 15, pteam = "ina_team_Zeus", calculate = function(self, card, context) end })
local Medusa = J({ name = "Medusa", pos = { x = 2, y = 13 }, rarity = 1, pools = { ["ina_team_Zeus"] = true }, cost = 4, atlas = "Jokers01", ptype = C.Mountain, pposition = C.MF, pgender = C.M, pnation = C.JAPAN, pyear = C.YEAR_3, pdorsal = 16, pteam = "ina_team_Zeus", calculate = function(self, card, context) end })

return {
  name = "Zeus",
  list = {
    Poseidon, Apollo, Hephestus, Artemis,
    Hermes, Athena, Demeter, Aphrodite
  }
}


