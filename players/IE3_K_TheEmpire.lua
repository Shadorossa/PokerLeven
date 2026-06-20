-- Nacho Ortega (1) - "Millón de Manos" - Defensa PvP
local Nacho_Ortega = J({
  name = "Nacho_Ortega",
  pos = { x = 4, y = 12 },
  config = { extra = { reduction_per_hand = 0.03 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { self.config.extra.reduction_per_hand * 100 } }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 1,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.after and ctx.scoring_hand and SMODS.Mods["Multiplayer"] then
      local MP = SMODS.Mods["Multiplayer"].globals.MP
      if MP and MP.is_pvp_boss and MP.is_pvp_boss() then
        local hands_available = G.GAME.hands_left or 0
        if hands_available > 0 and MP.GAME and MP.GAME.enemy then
          local reduction = self.config.extra.reduction_per_hand * hands_available
          local blind_chips = G.GAME.blind.chips
          local reduced_chips = math.floor(blind_chips * (1 - reduction))

          if reduced_chips < blind_chips then
            G.GAME.blind.chips = reduced_chips
            G.GAME.blind.chip_text = number_format(reduced_chips)
            card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = 'Defensa: -' .. string.format('%.1f', reduction * 100) .. '%',
              colour = G.C.FIRE
            })
          end
        end
      end
    end
  end
})

-- Thiago Torres (2)
local Thiago_Torres = J({
  name = "Thiago Torres",
  pos = { x = 5, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["The Empire"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pnumber = 2,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Felipe Palacios (3)
local Felipe_Palacios = J({
  name = "Felipe Palacios",
  pos = { x = 6, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 3,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Miquel Ros (4)
local Miquel_Ros = J({
  name = "Miquel Ros",
  pos = { x = 7, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ramón Martínez (5)
local Ramon_Martinez = J({
  name = "Ramón Martínez",
  pos = { x = 8, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Enrique Caroso (6) - "Maestro del Ritmo" - Sistema de patrón
local Enrique_Caroso = J({
  name = "Enrique_Caroso",
  pos = { x = 9, y = 12 },
  config = { extra = { pattern_progress = 0, harmony_rounds = 0, card_limit_boost = 4, required_pattern = { 'Pair', 'Three of a Kind', 'Five of a Kind' } } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    local pattern_names = { 'Par', 'Trío', 'Poker' }
    local progress = math.min(ex.pattern_progress, 3)
    local status = pattern_names[progress] or 'Reinicio'
    if ex.harmony_rounds > 0 then
      status = '🎵 Armonía: ' .. ex.harmony_rounds .. ' rondas'
    end
    return { vars = { progress, ex.card_limit_boost, status } }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_3,
  pnumber = 6,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra

    if ctx.joker_main and ctx.scoring_hand and not ctx.blueprint then
      if ex.harmony_rounds > 0 then
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = '🎵 Armonía activa +' .. ex.card_limit_boost .. ' cartas',
          colour = G.C.WIND
        })
      end
    end

    if ctx.after and not ctx.blueprint and ctx.scoring_name then
      local required = ex.required_pattern

      if ex.harmony_rounds > 0 then
        ex.harmony_rounds = ex.harmony_rounds - 1
        if ex.harmony_rounds == 0 then
          if G.hand and G.hand.config then
            G.hand.config.card_limit = math.max(G.hand.config.card_limit - ex.card_limit_boost, 5)
          end
          card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = 'Armonía terminada',
            colour = G.C.WIND
          })
        end
      else
        local pattern_step = ex.pattern_progress + 1
        if pattern_step <= #required and ctx.scoring_name == required[pattern_step] then
          ex.pattern_progress = pattern_step

          if pattern_step == 1 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = '♪ Paso 1/3: Par ✓',
              colour = G.C.WIND
            })
          elseif pattern_step == 2 then
            card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = '♪♪ Paso 2/3: Trío ✓',
              colour = G.C.WIND
            })
          elseif pattern_step == 3 then
            ex.pattern_progress = 0
            ex.harmony_rounds = 5
            if G.hand and G.hand.config then
              G.hand.config.card_limit = (G.hand.config.card_limit or 8) + ex.card_limit_boost
            end
            card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = '♪♪♪ ¡ARMONÍA ACTIVADA! +' .. ex.card_limit_boost .. ' cartas × 5 rondas',
              colour = G.C.WIND
            })
            play_sound('tarot2', 1.3, 0.8)
          end
        else
          ex.pattern_progress = 0
          if ctx.scoring_name ~= required[1] then
            card_eval_status_text(card, 'extra', nil, nil, nil, {
              message = '✗ Patrón fallido. Reinicio',
              colour = G.C.RED
            })
          end
        end
      end
    end
  end
})

-- Sergio López (7)
local Sergio_Lopez = J({
  name = "Sergio López",
  pos = { x = 10, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Roberto Torinni (8)
local Roberto_Torinni = J({
  name = "Roberto Torinni",
  pos = { x = 11, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 8,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Pablo Castiglione (9)
local Pablo_Castiglione = J({
  name = "Pablo Castiglione",
  pos = { x = 12, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 9,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Leone Balone (10)
local Leone_Balone = J({
  name = "Leone Balone",
  pos = { x = 0, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_3,
  pnumber = 10,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Diego Oro (11)
local Diego_Oro = J({
  name = "Diego Oro",
  pos = { x = 1, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 11,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Lionel Cruz (12)
local Lionel_Cruz = J({
  name = "Lionel Cruz",
  pos = { x = 2, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mario Saviola (13)
local Mario_Saviola = J({
  name = "Mario Saviola",
  pos = { x = 3, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hernán Tévez (14)
local Hernan_Tevez = J({
  name = "Hernán Tévez",
  pos = { x = 4, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 14,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Herman Samuel (15)
local Herman_Samuel = J({
  name = "Herman Samuel",
  pos = { x = 5, y = 13 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 15,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ricardo Agüero (16) - "Goleador Serial" - Racha ofensiva
local Ricardo_Aguero = J({
  name = "Ricardo_Aguero",
  pos = { x = 6, y = 13 },
  config = { extra = { streak = 0, power_per_streak = 0.30, threshold_mult = 2.5 } },
  loc_vars = function(self, info_queue, center)
    local ex = (center and type(center) == 'table' and center.ability and center.ability.extra) or self.config.extra
    local power_mult = 1 + (ex.streak * ex.power_per_streak)
    return { vars = { ex.streak, string.format('%.1f', power_mult * 100), ex.threshold_mult * 100 } }
  end,
  rarity = 1,
  pools = { ["The Empire"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.ARGENTINA,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_TheEmpire",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    local power_mult = 1 + (ex.streak * ex.power_per_streak)

    if ctx.joker_main and ctx.scoring_hand and not ctx.blueprint then
      if power_mult > 1 then
        card_eval_status_text(card, 'extra', nil, nil, nil, {
          message = '⚡ Racha ' .. ex.streak .. ' X' .. string.format('%.2f', power_mult),
          colour = G.C.MOUNTAIN
        })
        return {
          Xchip_mod = power_mult,
          Xmult_mod = power_mult,
          card = card
        }
      end
    end

    if ctx.after and not ctx.blueprint then
      local total_chips = G.GAME.chips or 0
      local blind_chips = G.GAME.blind.chips or 0

      if blind_chips > 0 then
        local ratio = total_chips / blind_chips
        if ratio > ex.threshold_mult then
          ex.streak = ex.streak + 1
          local new_power = 1 + (ex.streak * ex.power_per_streak)
          card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = '⚽ ¡GOL! Racha +1 → X' .. string.format('%.2f', new_power),
            colour = G.C.MOUNTAIN
          })
        end
      end
    end
  end
})

return {
  name = "The Empire",
  list = {
    Nacho_Ortega,
    Ricardo_Aguero,
    Enrique_Caroso
  }
}
