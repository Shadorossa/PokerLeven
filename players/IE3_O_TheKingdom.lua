-- Falcão Da Silva (1)
local Falcao_Da_Silva = J({
  name = "Falcão Da Silva",
  pos = { x = 3, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["The Kingdom"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_3,
  pnumber = 1,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Carlos Lagarto (2)
local Carlos_Lagarto = J({
  name = "Carlos Lagarto",
  pos = { x = 4, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_3,
  pnumber = 2,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Antonio Bagre (3)
local Antonio_Bagre = J({
  name = "Antonio Bagre",
  pos = { x = 5, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 3,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Monstro Ximenes (4) - "Insaciable" - Sigue jugando después de superar el blind
local Monstro_Ximenes = J({
  name = "Monstro Ximenes",
  pos = { x = 6, y = 17 },
  config = { extra = { blind_exceeded = false } },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_3,
  pnumber = 4,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra

    if ctx.after and not ctx.blueprint then
      local total_chips = G.GAME.chips or 0
      local blind_chips = G.GAME.blind.chips or 0

      if blind_chips > 0 and total_chips >= blind_chips and not ex.blind_exceeded then
        ex.blind_exceeded = true
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = '🔥 INSACIABLE: Sigue jugando con tus manos restantes',
          colour = G.C.FIRE
        })
      end
    end
  end
})

if not SMODS then SMODS = {} end
if not SMODS.original_blind_exceeded then
  SMODS.original_blind_exceeded = function(self)
    return (G.GAME.chips or 0) >= (G.GAME.blind.chips or 0)
  end

  local original_update_hand_played = Game.update_hand_played
  function Game:update_hand_played(dt)
    original_update_hand_played(self, dt)

    if G.STATE == G.STATES.HAND_PLAYED then
      local monstro = SMODS.find_card('j_ina_Monstro_Ximenes')[1]
      if monstro and monstro.ability.extra.blind_exceeded then
        if (G.GAME.chips or 0) >= (G.GAME.blind.chips or 0) and (G.GAME.hands_left or 0) > 0 then
          G.STATE = G.STATES.DRAW_TO_HAND
        end
      end
    end
  end
end

-- Formiga Clemens (5)
local Formiga_Clemens = J({
  name = "Formiga Clemens",
  pos = { x = 7, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Presa Passos (6)
local Presa_Passos = J({
  name = "Presa Passos",
  pos = { x = 8, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bolboreta Barboza (7) - "Transformación" - Copia habilidades
local Bolboreta_Barboza = J({
  name = "Bolboreta Barboza",
  pos = { x = 9, y = 17 },
  config = { extra = { last_copied = 'Ninguno', copy_active = false } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    return { vars = { ex.last_copied } }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra

    if ctx.after and not ctx.blueprint then
      local last_joker = nil
      if G.jokers and G.jokers.cards then
        for i = #G.jokers.cards, 1, -1 do
          if G.jokers.cards[i].ability.name ~= 'j_ina_Bolboreta_Barboza' then
            last_joker = G.jokers.cards[i]
            break
          end
        end
      end

      if last_joker then
        local joker_name = last_joker.ability.name or 'Desconocido'
        if ex.last_copied ~= joker_name then
          ex.last_copied = joker_name
          ex.copy_active = true
          card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = '🦋 Transformación: ' .. (last_joker.ability.label or 'Habilidad'),
            colour = G.C.WIND
          })
        end
      end
    end

    if ctx.joker_main and ctx.scoring_hand and not ctx.blueprint and ex.copy_active then
      local last_joker = nil
      if G.jokers and G.jokers.cards then
        for i = #G.jokers.cards, 1, -1 do
          if G.jokers.cards[i].ability.name == ex.last_copied then
            last_joker = G.jokers.cards[i]
            break
          end
        end
      end

      if last_joker and last_joker.calculate then
        local result = last_joker:calculate({
          cardarea = ctx.cardarea,
          scoring_hand = ctx.scoring_hand,
          other_card = ctx.other_card,
          individual = ctx.individual,
          end_of_round = ctx.end_of_round,
          joker_main = true,
          blueprint = ctx.blueprint,
          poker_hands = ctx.poker_hands,
          scoring_name = ctx.scoring_name,
        })

        if result then
          return result
        end
      end
    end
  end
})

-- Coruja Cerezo (8)
local Coruja_Cerezo = J({
  name = "Coruja Cerezo",
  pos = { x = 10, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 8,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Leonardo Almeida (9)
local Leonardo_Almeida = J({
  name = "Leonardo Almeida",
  pos = { x = 11, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 9,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mac Robingo (10)
local Mac_Robingo = J({
  name = "Mac Robingo",
  pos = { x = 12, y = 17 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["The Kingdom"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pnumber = 10,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gato Carvalho (11)
local Gato_Carvalho = J({
  name = "Gato Carvalho",
  pos = { x = 0, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_3,
  pnumber = 11,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Xavier Ribeiro (12)
local Xavier_Ribeiro = J({
  name = "Xavier Ribeiro",
  pos = { x = 1, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ulisses Nogueira (13)
local Ulisses_Nogueira = J({
  name = "Ulisses Nogueira",
  pos = { x = 2, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_3,
  pnumber = 13,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gervasio Oliveira (14)
local Gervasio_Oliveira = J({
  name = "Gervasio Oliveira",
  pos = { x = 3, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_3,
  pnumber = 14,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Tigre Mendes (15)
local Tigre_Mendes = J({
  name = "Tigre Mendes",
  pos = { x = 4, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 15,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Grillo Santos (16)
local Grillo_Santos = J({
  name = "Grillo Santos",
  pos = { x = 5, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Kingdom"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.BRAZIL,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "The Kingdom",
  list = {
    Monstro_Ximenes,
    Bolboreta_Barboza
  }
}
