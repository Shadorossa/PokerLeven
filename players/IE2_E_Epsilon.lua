-- Dvalin
local Dvalin = {
  name = "Dvalin",
  pos = { x = 4, y = 0 },
  soul_pos = { x = 4, y = 1 },
  config = { extra = { pposition = "GK", chip_mod = 150, barriers_added = 1, xmult_mod = 0.5, barriers_consumed = 1 } },
  loc_vars = function(self, info_queue, center)
      local is_gk = center.ability.extra.pposition == "GK"
      local barriers = G.GAME.current_round and G.GAME.current_round.barriers or 0
      local current_xmult = 1 + (barriers * center.ability.extra.xmult_mod)
      return { vars = { 
          center.ability.extra.chip_mod, 
          center.ability.extra.barriers_added, 
          center.ability.extra.xmult_mod, 
          center.ability.extra.barriers_consumed,
          current_xmult,
          is_gk and "GK" or "FW"
      } }
  end,
  rarity = "ina_top", -- Destacado
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "top",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.joker_main and context.scoring_hand then
        if card.ability.extra.pposition == "GK" then
            Pokerleven.ease_barriers(card.ability.extra.barriers_added)
            return {
                message = localize{type='variable',key='a_chips',vars={card.ability.extra.chip_mod}},
                chip_mod = card.ability.extra.chip_mod,
                colour = G.C.CHIPS
            }
        elseif card.ability.extra.pposition == "FW" then
            local barriers = G.GAME.current_round.barriers or 0
            local cost = card.ability.extra.barriers_consumed
            if barriers >= cost then
                Pokerleven.ease_barriers(-cost)
                local xmult = 1 + (barriers * card.ability.extra.xmult_mod)
                return {
                    message = localize{type='variable',key='a_xmult',vars={xmult}},
                    Xmult_mod = xmult,
                    colour = G.C.MULT
                }
            end
        end
    end
  end,
  update = function(self, card, dt)
      if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
          local target_pos = Pokerleven.is_in_left_half(card) and "GK" or "FW"
          if card.ability.extra.pposition ~= target_pos then
             apply_property_sticker(card, target_pos, "position")
          end
      end
  end
}

-- Kenville
local Kenville = {
  name = "Kenville",
  pos = { x = 1, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Mole
local Mole = {
  name = "Mole",
  pos = { x = 2, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Kayson
local Kayson = {
  name = "Kayson",
  pos = { x = 3, y = 5 },
  config = { extra = { chip_mod = 50, current_chips = 0, destroyed_this_round = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod, center.ability.extra.current_chips } }
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
        local destroyed_count = context.removed and #context.removed or 0
        if destroyed_count > 0 and not card.ability.extra.destroyed_this_round then
            card.ability.extra.destroyed_this_round = true
            card.ability.extra.current_chips = card.ability.extra.current_chips + card.ability.extra.chip_mod
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS})
        end
    end
    if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
        card.ability.extra.destroyed_this_round = false
        if card.ability.extra.current_chips > 0 then
            card.ability.extra.current_chips = 0
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
    if context.joker_main and card.ability.extra.current_chips > 0 then
        return {
            message = localize{type='variable',key='a_chips',vars={card.ability.extra.current_chips}},
            chip_mod = card.ability.extra.current_chips
        }
    end
  end
}

-- Tytan
local Tytan = {
  name = "Tytan",
  pos = { x = 4, y = 5 },
  config = { extra = { chip_mod = 10, current_chips = 0 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod, center.ability.extra.current_chips } }
  end,
  rarity = 1, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.remove_playing_cards and not context.blueprint then
        local destroyed_count = context.removed and #context.removed or 0
        if destroyed_count > 0 then
            card.ability.extra.current_chips = card.ability.extra.current_chips + (card.ability.extra.chip_mod * destroyed_count)
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS})
        end
    end
    if context.joker_main and card.ability.extra.current_chips > 0 then
        return {
            message = localize{type='variable',key='a_chips',vars={card.ability.extra.current_chips}},
            chip_mod = card.ability.extra.current_chips
        }
    end
  end
}

-- Fedora
local Fedora = {
  name = "Fedora",
  pos = { x = 5, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Common
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Krypto
local Krypto = {
  name = "Krypto",
  pos = { x = 6, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Sworm
local Sworm = {
  name = "Sworm",
  pos = { x = 7, y = 5 },
  config = { extra = { odds = 3, chip_mod = 15, current_chips = 0 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { ''..(G.GAME and G.GAME.probabilities.normal or 1), center.ability.extra.odds, center.ability.extra.chip_mod, center.ability.extra.current_chips } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.after and context.cardarea == G.jokers and not context.blueprint then
        local was_successful, returned_cards = Pokerleven.iterate_and_execute_on_cards(context, {
            joker_card = card,
            probability = card.ability.extra.odds,
            seed = 'sworm',
            card_condition = function(c)
                if c.shattered or c.destroyed then return false end
                return c.config.center ~= G.P_CENTERS.c_base or c.seal ~= nil or c.edition ~= nil
            end,
            on_success = function(joker, target_card, index, total)
                joker.ability.extra.current_chips = joker.ability.extra.current_chips + joker.ability.extra.chip_mod
                Pokerleven.return_card_to_deck(target_card, G.play, index * 100 / total)
            end
        })
        if was_successful then
            return {
                message = localize('k_saved_ex'),
                colour = G.C.CHIPS,
                card = card
            }
        end
    end
    if context.joker_main and card.ability.extra.current_chips > 0 then
        return {
            message = localize{type='variable',key='a_chips',vars={card.ability.extra.current_chips}},
            chip_mod = card.ability.extra.current_chips
        }
    end
  end
}

-- Mercury
local Mercury = {
  name = "Mercury",
  pos = { x = 8, y = 5 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
}

-- Metron
local Metron = {
  name = "Metron",
  pos = { x = 9, y = 5 },
  config = { extra = { retrigger_count = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.retrigger_count } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.play then
        if G.GAME.current_round.discards_used == 0 and G.GAME.current_round.hands_played == 0 then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.retrigger_count,
                card = context.other_card
            }
        end
    end
  end
}

-- Zell
local Zell = {
  name = "Zell",
  pos = { x = 10, y = 5 },
  config = { extra = { mult_mod = 0, pposition = "FW" } },
  loc_vars = function(self, info_queue, center)
    local is_gk = center.ability.extra.pposition == "GK"
    return { vars = { center.ability.extra.mult_mod, is_gk and "GK" or "FW" } }
  end,
  rarity = 3, -- Uncommon
  pools = { ["Epsilon"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Epsilon",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.destroying_card and not context.blueprint then
        local center_idx = math.ceil(#context.full_hand / 2)
        if context.destroying_card == context.full_hand[center_idx] then
            local gained_val = math.floor(context.destroying_card.base.nominal / 2)
            if card.ability.extra.pposition == "GK" then
                ease_dollars(gained_val)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+$" .. gained_val, colour = G.C.MONEY})
            else
                card.ability.extra.mult_mod = card.ability.extra.mult_mod + gained_val
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = "+" .. gained_val .. " Mult!"})
            end
            return true
        end
    end
    if context.joker_main and card.ability.extra.mult_mod > 0 and card.ability.extra.pposition == "FW" then
        return {
            message = localize{type='variable',key='a_mult',vars={card.ability.extra.mult_mod}},
            mult_mod = card.ability.extra.mult_mod
        }
    end
  end,
  update = function(self, card, dt)
      if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
          local target_pos = Pokerleven.is_in_left_half(card) and "GK" or "FW"
          if card.ability.extra.pposition ~= target_pos then
             apply_property_sticker(card, target_pos, "position")
          end
      end
  end
}

return {
  name = "Epsilon",
  list = { Dvalin, Kayson, Tytan, Krypto, Sworm, Metron, Zell }
  -- list = { Kenville, Mole, Fedora, Mercury },
}
