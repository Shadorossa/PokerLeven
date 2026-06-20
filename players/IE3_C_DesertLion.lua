-- Nasir Mustafa (1)
local Nasir_Mustafa = J({
  name = "Nasir Mustafa",
  pos = { x = 6, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 1,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Faraz Farooq (2)
local Faraz_Farooq = J({
  name = "Faraz Farooq",
  pos = { x = 7, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_3,
  pnumber = 2,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bilal Kalil (3)
local Bilal_Kalil = J({
  name = "Bilal Kalil",
  pos = { x = 8, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Desert Lion"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pnumber = 3,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jamila Wali (4)
local Jamila_Wali = J({
  name = "Jamila_Wali",
  pos = { x = 9, y = 2 },
  config = { extra = { defense = 0, defense_rate = 0.02 } },
  loc_vars = function(self, info, center)
    return { vars = { math.floor(center.ability.extra.defense * 100), math.floor(center.ability.extra.defense_rate * 100) } }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.end_of_round and ctx.main_eval and not ctx.blueprint then
      card.ability.extra.defense = card.ability.extra.defense + card.ability.extra.defense_rate
      return {
        message = localize('k_upgrade'),
        colour = G.C.FILTER
      }
    end
  end
})

-- Musa Sylla (5)
local Musa_Sylla = J({
  name = "Musa Sylla",
  pos = { x = 10, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_3,
  pnumber = 5,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Yusuf Massoud (6)
local Yusuf_Massoud = J({
  name = "Yusuf Massoud",
  pos = { x = 11, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sulayk Sulaiman (7)
local Sulayk_Sulaiman = J({
  name = "Sulayk Sulaiman",
  pos = { x = 12, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sayid Armand (8)
local Sayid_Armand = J({
  name = "Sayid Armand",
  pos = { x = 0, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_3,
  pnumber = 8,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Mansur Jasim (9)
local Mansur_Jasim = J({
  name = "Mansur Jasim",
  pos = { x = 1, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 9,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Zack Abdulla (10)
local Zack_Abdulla = J({
  name = "Zack_Abdulla",
  pos = { x = 2, y = 3 },
  config = { extra = { global_debuff = 0.82, fw_boost = 1.42 } },
  loc_vars = function(self, info, center)
    return { vars = { math.floor((1 - center.ability.extra.global_debuff) * 100), math.floor((center.ability.extra.fw_boost - 1) * 100) } }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 10,
  pteam = "ina_team_DesertLion",
  blueprint_compat = false,
  update = function(self, card, dt)
    if G.jokers and G.jokers.cards and card.area == G.jokers then
      if not card.debuff then
        for _, v in ipairs(G.jokers.cards) do
          if v ~= card then
            if v.ability and v.ability.extra and v.ability.extra.pposition == C.FW then
              Pokerleven.apply_stat_multiplier(v, 'abdulla', card.ability.extra.fw_boost)
            else
              Pokerleven.apply_stat_multiplier(v, 'abdulla', card.ability.extra.global_debuff)
            end
          end
        end
      else
        for _, v in ipairs(G.jokers.cards) do
          Pokerleven.remove_stat_multiplier(v, 'abdulla')
        end
      end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and G.jokers.cards then
      for _, v in ipairs(G.jokers.cards) do
        Pokerleven.remove_stat_multiplier(v, 'abdulla')
      end
    end
  end
})

-- Majdi Ismail (11)
local Majdi_Ismail = J({
  name = "Majdi Ismail",
  pos = { x = 3, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 11,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Talal Hamad (12)
local Talal_Hamad = J({
  name = "Talal Hamad",
  pos = { x = 4, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hasan Ahmed (13)
local Hasan_Ahmed = J({
  name = "Hasan Ahmed",
  pos = { x = 5, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Khalfan Jibril (14)
local Khalfan_Jibril = J({
  name = "Khalfan_Jibril",
  pos = { x = 6, y = 3 },
  config = { extra = { mult_copy = 0.5 } },
  loc_vars = function(self, info, center)
    return { vars = { math.floor(center.ability.extra.mult_copy * 100) } }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 14,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if Pokerleven.is_joker_turn(ctx) then
      if G.jokers and G.jokers.cards then
        for i, v in ipairs(G.jokers.cards) do
          if v == card and i > 1 then
            local left_joker = G.jokers.cards[i - 1]
            if left_joker and left_joker.ability and left_joker.ability.extra then
              local left_mult = left_joker.ability.extra.mult or 0
              local copied_mult = math.floor(left_mult * card.ability.extra.mult_copy)
              if copied_mult > 0 then
                return Pokerleven.create_mult_return(copied_mult)
              end
            end
            break
          end
        end
      end
    end
  end
})

-- Rajab Ismail (15)
local Rajab_Ismail = J({
  name = "Rajab Ismail",
  pos = { x = 7, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_1,
  pnumber = 15,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Adel Siddique (16)
local Adel_Siddique = J({
  name = "Adel Siddique",
  pos = { x = 8, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Desert Lion"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.QATAR,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_DesertLion",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Desert Lion",
  list = {
    Jamila_Wali,
    Zack_Abdulla,
    Khalfan_Jibril
  }
}
