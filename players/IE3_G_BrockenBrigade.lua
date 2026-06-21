-- Thorsten Welger (1) - "Malla Letal" - Sacrificio táctico con sello perecedero
local Thorsten_Welger = J({
  name = "Thorsten_Welger",
  pos = { x = 5, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_3,
  pnumber = 1,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.setting_blind and not ctx.blueprint then
      local leftmost_joker = nil
      if G.jokers and G.jokers.cards and #G.jokers.cards > 0 then
        for i, j in ipairs(G.jokers.cards) do
          if j.config.center.key ~= 'j_ina_Thorsten_Welger' then
            leftmost_joker = j
            break
          end
        end
      end

      if leftmost_joker then
        local is_negative = leftmost_joker.edition and leftmost_joker.edition.negative
        local is_perishable = leftmost_joker.ability and leftmost_joker.ability.perishable
        
        if not is_negative and not is_perishable then
          leftmost_joker:set_edition('e_negative', true)
          leftmost_joker.ability.perishable = true
          leftmost_joker.ability.perish_tally = 5
          card_eval_status_text(card, 'extra', nil, nil, nil, {
            message = 'Negativo y Perecedero!',
            colour = G.C.FOREST
          })
          play_sound('tarot2', 1.2, 0.5)
        end
      end
    end
  end
})

-- Alexander Hausen (2)
local Alexander_Hausen = J({
  name = "Alexander Hausen",
  pos = { x = 6, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_3,
  pnumber = 2,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Heinrich Farber (3)
local Heinrich_Farber = J({
  name = "Heinrich Farber",
  pos = { x = 7, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 3,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kurt Zawel (4)
local Kurt_Zawel = J({
  name = "Kurt Zawel",
  pos = { x = 8, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Lukas Schmidt (5)
local Lukas_Schmidt = J({
  name = "Lukas Schmidt",
  pos = { x = 9, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Theodor Ulrich (6)
local Theodor_Ulrich = J({
  name = "Theodor Ulrich",
  pos = { x = 10, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jan Oster (7)
local Jan_Oster = J({
  name = "Jan Oster",
  pos = { x = 11, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_3,
  pnumber = 7,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Niklas Kuster (8)
local Niklas_Kuster = J({
  name = "Niklas Kuster",
  pos = { x = 12, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 8,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jonas Polk (9)
local Jonas_Polk = J({
  name = "Jonas Polk",
  pos = { x = 0, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Brocken Brigade"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pnumber = 9,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Maximilian Müller (10)
local Maximilian_Muller = J({
  name = "Maximilian Müller",
  pos = { x = 1, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_1,
  pnumber = 10,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Peter Naumann (11)
local Peter_Naumann = J({
  name = "Peter Naumann",
  pos = { x = 2, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_1,
  pnumber = 11,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Gerhard Enders (12)
local Gerhard_Enders = J({
  name = "Gerhard Enders",
  pos = { x = 3, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Erwin Völz (13)
local Erwin_Volz = J({
  name = "Erwin Völz",
  pos = { x = 4, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Jens Hoffman (14)
local Jens_Hoffman = J({
  name = "Jens Hoffman",
  pos = { x = 5, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 14,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ernst Fliender (15)
local Ernst_Fliender = J({
  name = "Ernst Fliender",
  pos = { x = 6, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 15,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Emmanuel Ewerz (16)
local Emmanuel_Ewerz = J({
  name = "Emmanuel Ewerz",
  pos = { x = 7, y = 8 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Brocken Brigade"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.GERMANY,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_BrockenBrigade",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Brocken Brigade",
  list = {
    Thorsten_Welger
  }
}