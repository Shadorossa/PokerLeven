-- Gene Whalon (1)
local Gene_Whalon = J({
  name = "Gene Whalon",
  pos = { x = 3, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_3,
  pnumber = 1,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- David Waterman (2)
local David_Waterman = J({
  name = "David Waterman",
  pos = { x = 4, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 2,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Sonny Shore (3)
local Sonny_Shore = J({
  name = "Sonny Shore",
  pos = { x = 5, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_1,
  pnumber = 3,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Kjell Snapper (4)
local Kjell_Snapper = J({
  name = "Kjell Snapper",
  pos = { x = 6, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 4,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Ken Crackham (5) - Kraken
local Ken_Crackham = J({
  name = "Ken_Crackham",
  pos = { x = 7, y = 1 },
  config = { extra = { retrigger_count = 2, potency = 0.15 } },
  loc_vars = function(self, info, center)
    return { vars = { center.ability.extra.retrigger_count, math.floor(center.ability.extra.potency * 100) } }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 5,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if Pokerleven.is_individual_play_card(ctx) then
      if ctx.other_card and ctx.other_card.ability and ctx.other_card.ability.extra and
         ctx.other_card.ability.extra.ptype == C.Forest then
        return {
          message = localize('k_retrigger'),
          retrigger = card.ability.extra.retrigger_count,
          colour = G.C.BLUE
        }
      end
    end
  end
})

-- Shawn Princeton (6)
local Shawn_Princeton = J({
  name = "Shawn Princeton",
  pos = { x = 8, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 6,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Matt Fischer (7)
local Matt_Fischer = J({
  name = "Matt Fischer",
  pos = { x = 9, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 7,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hank Tennyson (8)
local Hank_Tennyson = J({
  name = "Hank Tennyson",
  pos = { x = 10, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 8,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Dolph Hensen (9)
local Dolph_Hensen = J({
  name = "Dolph Hensen",
  pos = { x = 11, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 2,
  pools = { ["Big Waves"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pnumber = 9,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Hamilton Reith (10)
local Hamilton_Reith = J({
  name = "Hamilton Reith",
  pos = { x = 12, y = 1 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 10,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Joe Dawes (11)
local Joe_Dawes = J({
  name = "Joe Dawes",
  pos = { x = 0, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_3,
  pnumber = 11,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Quincy Horace (12)
local Quincy_Horace = J({
  name = "Quincy Horace",
  pos = { x = 1, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 12,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Holly Summers (13)
local Holly_Summers = J({
  name = "Holly_Summers",
  pos = { x = 2, y = 2 },
  config = { extra = { mult_gain = 4, mult = 0 } },
  loc_vars = function(self, info, center)
    return { vars = { center.ability.extra.mult_gain, center.ability.extra.mult } }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 13,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    if ctx.before and ctx.cardarea == G.jokers and not ctx.blueprint then
      card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
      return Pokerleven.create_mult_return(card.ability.extra.mult)
    end

    if Pokerleven.is_joker_turn(ctx) then
      return Pokerleven.create_mult_return(card.ability.extra.mult)
    end

    if (ctx.discard or (ctx.destroyed and ctx.destroyed > 0)) and not ctx.blueprint then
      card.ability.extra.mult = 0
      return {
        message = localize('k_reset'),
        colour = G.C.MULT
      }
    end
  end
})

-- Derek Rabson (14)
local Derek_Rabson = J({
  name = "Derek Rabson",
  pos = { x = 3, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_3,
  pnumber = 14,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Barack Daniels (15)
local Barack_Daniels = J({
  name = "Barack Daniels",
  pos = { x = 4, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 15,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

-- Bruce Marlin (16)
local Bruce_Marlin = J({
  name = "Bruce Marlin",
  pos = { x = 5, y = 2 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Big Waves"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.AUSTRALIA,
  pyear = C.YEAR_2,
  pnumber = 16,
  pteam = "ina_team_BigWaves",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Big Waves",
  list = {
    Ken_Crackham,
    Holly_Summers
  }
}
