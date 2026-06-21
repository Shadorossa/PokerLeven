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
  name = "Monstro_Ximenes",
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

    if Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
      ex.blind_exceeded = false
    end
  end
})

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
  name = "Bolboreta_Barboza",
  pos = { x = 9, y = 17 },
  config = { extra = { last_copied = 'Ninguno', copy_active = false, copied_ability = nil } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    local display_name = ex.last_copied
    if display_name ~= 'Ninguno' then
      local center_obj = G.P_CENTERS[display_name]
      if center_obj then
        info_queue[#info_queue + 1] = center_obj
      end
    end
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
  pnumber = 7,
  pteam = "ina_team_TheKingdom",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    -- Guard: Only run if the game is active and the card is in G.jokers
    if not G.jokers or card.area ~= G.jokers then return end

    local ex = card.ability.extra

    -- Track last bought joker
    if ctx.buying_card and ctx.card and ctx.card.config.center.set == 'Joker' and ctx.card.config.center.key ~= 'j_ina_Bolboreta_Barboza' and not ctx.blueprint then
      ex.last_copied = ctx.card.config.center.key
      ex.copied_ability = copy_table(ctx.card.ability)
    end

    -- Activate transformation at the start of the round/blind
    if ctx.setting_blind and not ctx.blueprint then
      -- Fallback if no joker bought yet: copy rightmost joker
      if ex.last_copied == 'Ninguno' then
        if G.jokers and G.jokers.cards then
          for i = #G.jokers.cards, 1, -1 do
            local other = G.jokers.cards[i]
            if other ~= card and other.config.center.key ~= 'j_ina_Bolboreta_Barboza' then
              ex.last_copied = other.config.center.key
              ex.copied_ability = copy_table(other.ability)
              break
            end
          end
        end
      end

      if ex.last_copied ~= 'Ninguno' then
        ex.copy_active = true
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = 'Transformación!',
          colour = G.C.WIND
        })
      end
    end

    -- Copy the scoring ability of the saved joker
    if ex.copy_active and ex.last_copied ~= 'Ninguno' then
      if not ctx.setting_blind and not ctx.buying_card then
        local result, new_ability = Pokerleven.evaluate_copied_joker(card, ex.last_copied, ex.copied_ability, ctx)
        ex.copied_ability = new_ability
        if result then
          result.card = card
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
