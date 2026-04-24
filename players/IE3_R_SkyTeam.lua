local Anorel = J({
  name = "Anorel",
  pos = { x = 1, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Nenel = J({
  name = "Nenel",
  pos = { x = 2, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Genel = J({
  name = "Genel",
  pos = { x = 3, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ekadel = J({
  name = "Ekadel",
  pos = { x = 4, y = 18 },
  config = { extra = { odds = 3 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.jokers or card.area ~= G.jokers then return end

    if context.individual and context.cardarea == G.play then
      if pseudorandom('ekadel') < G.GAME.probabilities.normal / card.ability.extra.odds then
        if Pokerleven.rank_up(context.other_card) then
          return {
            message = localize('ina_rank_up'),
            colour = G.C.WIND
          }
        end
      end
    end
  end
})

local Lephiel = J({
  name = "Lephiel",
  pos = { x = 5, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Sachinel = J({
  name = "Sachinel",
  pos = { x = 6, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Wenel = J({
  name = "Wenel",
  pos = { x = 7, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Nuel = J({
  name = "Nuel",
  pos = { x = 8, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ientel = J({
  name = "Ientel",
  pos = { x = 9, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Gaiel = J({
  name = "Gaiel",
  pos = { x = 10, y = 18 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 3,
  pools = { ["Sky Team"] = true },
  cost = 10,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, context)
    if not G.GAME or not G.jokers or card.area ~= G.jokers then return end

    if context.after and not context.blueprint then
      local ante = (G.GAME and G.GAME.ante) or 1
      local next_sb_target = (get_blind_amount(ante) or 0) * 1.0
      local current_total = (G.GAME.chips or 0) + (context.hand_chips or 0)
      local blind_chips = (G.GAME.blind and G.GAME.blind.chips) or 0
      
      if current_total >= blind_chips + next_sb_target and not G.GAME.ina_sael_active then
        G.GAME.ina_sael_active = true
        G.E_MANAGER:add_event(Event({
          func = function()
            local tag_key = G.GAME.round_res.small_blind_tag or 'tag_rare'
            add_tag(Tag(tag_key))
            play_sound('timpani')
            return true
          end
        }))
        return {
          message = localize('ina_celestial_remate'),
          colour = G.C.WIND
        }
      end
    end
  end
})

local Sael = J({
  name = "Sael",
  pos = { x = 4, y = 2 },
  soul_pos = { x = 4, y = 3 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Sky Team"] = true },
  cost = 5,
  atlas = "ina_top",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.UNKNOWN,
  pyear = C.YEAR_3,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_SkyTeam",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Sky Team",
  list = { Ekadel, Gaiel }
}
