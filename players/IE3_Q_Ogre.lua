local Lars = J({
  name = "Lars",
  pos = { x = 0, y = 20 },
  config = { extra = {} },
  loc_vars = function(self, info, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.GK,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Bump = J({
  name = "Bump",
  pos = { x = 1, y = 20 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Lump = J({
  name = "Lump",
  pos = { x = 2, y = 20 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Radd = J({
  name = "Radd",
  pos = { x = 3, y = 20 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Jynx = J({
  name = "Jynx",
  pos = { x = 4, y = 20 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Oni = J({
  name = "Oni",
  pos = { x = 5, y = 20 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Drachen = J({
  name = "Drachen",
  pos = { x = 6, y = 20 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Ichabod = J({
  name = "Ichabod",
  pos = { x = 7, y = 20 },
  config = { extra = {} },
  loc_vars = function(self, info, center) return { vars = {} } end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Malice = J({
  name = "Malice",
  pos = { x = 8, y = 20 },
  config = { extra = { odds = 2, mult_low = 1.1, mult_high = 1.2 } },
  loc_vars = function(self, info, center)
    local ex = center.ability.extra; return { vars = { G.GAME.probabilities.normal, ex.odds, ex.mult_high, ex.mult_low } }
  end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex, other = card.ability.extra, ctx.other_card
    if ctx.individual and ctx.cardarea == G.play and other.edition and other.edition.key == 'e_ina_lethal' and not other.debuff then
      local pow = pseudorandom('malice') < G.GAME.probabilities.normal / ex.odds and ex.mult_high or ex.mult_low
      return { pow_mult = pow, card = card }
    end
  end
})

local Bash = J({
  name = "Bash",
  pos = { x = 9, y = 20 },
  config = { extra = { odds = 4 } },
  loc_vars = function(self, info, center) return { vars = { G.GAME.probabilities.normal, center.ability.extra.odds } } end,
  rarity = 2,
  pools = { ["Ogre"] = true },
  cost = 7,
  atlas = "Jokers03",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex, count = card.ability.extra, 0
    if G.playing_cards then
      for _, v in ipairs(G.playing_cards) do
        if v.edition and v.edition.key == 'e_ina_lethal' then
          count =
              count + 1
        end
      end
    end
    local is_full = #G.playing_cards > 0 and count == #G.playing_cards
    if ctx.retrigger_joker_check and not ctx.retrigger_joker and is_full and G.GAME.current_round.hands_left == 0 then
      if ctx.other_card.edition and ctx.other_card.edition.key == 'e_ina_lethal' then
        return { message = localize('k_again_ex'), repetitions = 1, card = card }
      end
    elseif ctx.joker_main and G.GAME.current_round.hands_left == 0 and not is_full then
      if pseudorandom('bash') < G.GAME.probabilities.normal / ex.odds then
        local elig = {}; for _, v in ipairs(ctx.scoring_hand) do
          if not (v.edition and v.edition.key == 'e_ina_lethal') then
            elig[#elig + 1] =
                v
          end
        end
        local c_c = #elig > 0 and pseudorandom_element(elig, pseudoseed('bash_c')) or nil
        local d_c = #ctx.scoring_hand > 1 and pseudorandom_element(ctx.scoring_hand, pseudoseed('bash_d')) or nil
        if d_c == c_c then d_c = nil end
        if c_c then c_c:set_edition({ e_ina_lethal = true }, true) end
        if d_c then d_c:start_dissolve() end
        return { message = "Lethal!", colour = G.C.DARK_EDITION }
      end
    end
  end
})

local Callous = J({
  name = "Callous",
  pos = { x = 10, y = 20 },
  config = { extra = { lethal_mult = 1 } },
  loc_vars = function(self, info, center)
    local count = 0; if G.playing_cards then
      for _, v in ipairs(G.playing_cards) do
        if v.edition and v.edition.key == 'e_ina_lethal' then
          count =
              count + 1
        end
      end
    end; return { vars = { 1 + count * center.ability.extra.lethal_mult, center.ability.extra.lethal_mult } }
  end,
  rarity = 1,
  pools = { ["Ogre"] = true },
  cost = 5,
  atlas = "Jokers03",
  ptype = C.Mountain,
  pposition = C.FW,
  pteam = "ina_team_Ogre",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
    local ex, count = card.ability.extra, 0
    if ctx.joker_main and card.area and G.jokers and card.area == G.jokers and G.playing_cards then
      for _, v in ipairs(G.playing_cards) do if v.edition and v.edition.key == 'e_ina_lethal' then count = count + 1 end end
      if count > 0 then
        local tot = 1 + count * ex.lethal_mult
        return { message = localize { type = 'variable', key = 'a_xmult', vars = { tot } }, Xmult_mod = tot }
      end
    end
  end
})
return {
  name = "Ogre",
  list = { Lars, Bump, Lump, Radd, Jynx, Oni, Drachen, Ichabod, Malice, Bash, Callous }
}
