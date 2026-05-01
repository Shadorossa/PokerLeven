local Rocky = J({
  name = "Rocky Black",
  pos = { x = 8, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Diver = J({
  name = "Chad Taylor",
  pos = { x = 9, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hills = J({
  name = "Victor Hills",
  pos = { x = 10, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Hurley = J({
  name = "Hurley Kane",
  pos = { x = 11, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_3,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Redding = J({
  name = "Hector Redding",
  pos = { x = 12, y = 11 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Fordline = J({
  name = "Mackenzie Fordline",
  pos = { x = 0, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Soundtown = J({
  name = "Cadence Soundtown",
  pos = { x = 1, y = 12 },
  config = { extra = { 
    current_xmult = 1, 
    tuning = 1, -- 0: Low, 1: Med, 2: High
    base_vol = 50, 
    vol_set = false,
    targets = {high = {}, med = {}}
  } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    local tuning_str = "Medio"
    local tuning_col = G.C.ORANGE
    if ex.tuning == 2 then tuning_str = "¡ALTO!"; tuning_col = G.C.GREEN
    elseif ex.tuning == 0 then tuning_str = "Bajo"; tuning_col = G.C.RED end
    
    return { vars = { tuning_str, ex.current_xmult, tuning_col } }
  end,
  rarity = 3,
  pools = { ["Mary Times"] = true },
  cost = 10,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  add_to_deck = function(self, card, from_debuff)
    if not card.ability.extra.vol_set then
        card.ability.extra.base_vol = G.SETTINGS.music_volume or 50
        card.ability.extra.vol_set = true
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if card.ability.extra.vol_set then
        G.SETTINGS.music_volume = card.ability.extra.base_vol
    end
  end,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    
    -- Generate conditions at start of round
    if ctx.setting_blind and not ctx.blueprint then
        local possible = {
            {type = 'suit', val = 'Hearts'}, {type = 'suit', val = 'Diamonds'}, {type = 'suit', val = 'Clubs'}, {type = 'suit', val = 'Spades'},
            {type = 'count', val = 1}, {type = 'count', val = 2}, {type = 'count', val = 3}, {type = 'count', val = 4}, {type = 'count', val = 5},
            {type = 'hand', val = 'Pair'}, {type = 'hand', val = 'Two Pair'}, {type = 'hand', val = 'Three of a Kind'}, 
            {type = 'hand', val = 'Straight'}, {type = 'hand', val = 'Flush'}, {type = 'hand', val = 'Full House'}
        }
        pseudoshuffle(possible, pseudoseed('soundtown_shuffle'))
        ex.targets.high = {possible[1], possible[2]}
        ex.targets.med = {possible[3], possible[4], possible[5], possible[6]}
        ex.tuning = 1 -- Reset to med at start
    end

    if Pokerleven.is_joker_turn(ctx) then
        return {
            Xmult_mod = ex.current_xmult,
            message = localize{type='variable',key='a_xmult',vars={ex.current_xmult}}
        }
    end

    if ctx.after and not ctx.blueprint then
        local hand_type = ctx.scoring_name
        local card_count = #ctx.scoring_hand
        local has_suit = function(s) 
            for _, c in ipairs(ctx.scoring_hand) do if c:is_suit(s) then return true end end
            return false
        end

        local check_cond = function(cond)
            if cond.type == 'suit' then return has_suit(cond.val)
            elseif cond.type == 'count' then return card_count == cond.val
            elseif cond.type == 'hand' then return hand_type == cond.val end
            return false
        end

        local new_tuning = 0
        local is_high = false
        for _, c in ipairs(ex.targets.high) do if check_cond(c) then is_high = true; break end end
        
        if is_high then
            new_tuning = 2
            ex.current_xmult = ex.current_xmult + 2
        else
            local is_med = false
            for _, c in ipairs(ex.targets.med) do if check_cond(c) then is_med = true; break end end
            if is_med then
                new_tuning = 1
                ex.current_xmult = ex.current_xmult + 0.25
            else
                new_tuning = 0
                ex.current_xmult = math.max(1, ex.current_xmult - 0.5)
            end
        end

        ex.tuning = new_tuning
        
        -- Adjust volume
        local offset = (ex.tuning - 1) * 20
        G.SETTINGS.music_volume = math.max(0, math.min(100, ex.base_vol + offset))
        
        return {
            message = new_tuning == 2 and "¡Sintonía ALTA!" or (new_tuning == 0 and "Sintonía Baja..." or "Sintonía Media"),
            colour = new_tuning == 2 and G.C.GREEN or (new_tuning == 0 and G.C.RED or G.C.ORANGE)
        }
    end
  end
})

local Delight = J({
  name = "Dora Delight",
  pos = { x = 2, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_1,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Contented = J({
  name = "Tom Contented",
  pos = { x = 3, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Easton = J({
  name = "Joston Easton",
  pos = { x = 4, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Shark = J({
  name = "Spring Millpond",
  pos = { x = 5, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Cooley = J({
  name = "Gaston Cooley",
  pos = { x = 6, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Breakfast = J({
  name = "Bevan Breakfast",
  pos = { x = 7, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Griddle = J({
  name = "Jack Griddle",
  pos = { x = 8, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Andagi = J({
  name = "Stan Andagi",
  pos = { x = 10, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

local Talent = J({
  name = "Coral Talent",
  pos = { x = 11, y = 12 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return { vars = {} }
  end,
  rarity = 1,
  pools = { ["Mary Times"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_MaryTimes",
  blueprint_compat = true,
  calculate = function(self, card, ctx) end
})

return {
  name = "Mary Times",
  list = { Soundtown }
}
