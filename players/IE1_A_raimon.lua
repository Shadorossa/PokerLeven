-- Mark Evans
local Mark = J({
  name = "Mark",
  pos = { x = 0, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pnumber = 1,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Nathan Swift
local Nathan = J({
  name = "Nathan",
  pos = { x = 1, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 2,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Jack Wallside
local Jack = J({
  name = "Jack",
  pos = { x = 2, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pnumber = 3,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Jim Wraith
local Jim = J({
  name = "Jim",
  pos = { x = 3, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Tod Ironside
local Tod = J({
  name = "Tod",
  pos = { x = 4, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pnumber = 5,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Steve Grim
local Steve = J({
  name = "Steve",
  pos = { x = 5, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Timmy (Tim Saunders)
local Timmy = J({
  name = "Timmy",
  pos = { x = 6, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pnumber = 7,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Sam Kincaid
local Sam = J({
  name = "Sam",
  pos = { x = 7, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pnumber = 8,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Paul Peabody
local Peabody = J({
  name = "Peabody",
  pos = { x = 8, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pnumber = 8, -- Note: dorsal 8/88 in your list
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Maxwell Carson
local Max = J({
  name = "Max",
  pos = { x = 9, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 9,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Axel Blaze
local Axel = J({
  name = "Axel",
  pos = { x = 10, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 10,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Kevin Dragonfly
local Kevin = J({
  name = "Kevin",
  pos = { x = 11, y = 0 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 11,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- William Glass (Willy)
local Willy = J({
  name = "Willy",
  pos = { x = 0, y = 1 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Bobby Shearer
local Bobby = J({
  name = "Bobby",
  pos = { x = 1, y = 1 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Jude Sharp
local Jude_Raimon = J({
  name = "Jude_Raimon",
  pos = { x = 2, y = 1 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 14,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Erik Eagle
local Erik = J({
  name = "Erik",
  pos = { x = 3, y = 1 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

-- Shadow Cimmerian
local Shadow = J({
  name = "Shadow",
  pos = { x = 4, y = 1 },
  config = { extra = { chip_mod = 20 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.chip_mod } }
  end,
  rarity = 1,
  pools = { ["ina_team_Raimon"] = true },
  cost = 3,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pnumber = 21,
  pteam = "ina_team_Raimon",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if Pokerleven.is_joker_turn(context) and context.cardarea == G.jokers and context.joker_main and context.scoring_hand then
      return {
        chips = card.ability.extra.chip_mod
      }
    end
  end,
})

return {
  name = "Raimon",
  list = { Mark, Nathan, Jack, Jim, Tod, Steve, Timmy, Sam, Peabody, Max, Axel, Kevin, Willy, Bobby, Jude, Erik, Shadow }
}
