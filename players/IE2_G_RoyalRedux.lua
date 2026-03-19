-- Joseph King
local KingR = J({
  name = "KingR",
  pos = { x = 9, y = 6 },
  config = { extra = { barriers = 2, chip_mod = 100, hands_lost = 1 } },
  loc_vars = function(self, info_queue, center)
    local max_hands = G.GAME and G.GAME.round_resets and G.GAME.round_resets.hands or 1
    return { vars = { center.ability.extra.barriers, center.ability.extra.chip_mod, center.ability.extra.hands_lost, center.ability.extra.chip_mod * max_hands } }
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        Pokerleven.ease_barriers(card.ability.extra.barriers)
    end
    if context.joker_main and context.scoring_hand then
        local chips = card.ability.extra.chip_mod * G.GAME.round_resets.hands
        return {
            message = localize{type='variable',key='a_chips',vars={chips}},
            chip_mod = chips,
            colour = G.C.CHIPS
        }
    end
    if context.end_of_round and not context.individual and not context.repetition and not context.blueprint then
        if G.GAME.blind.boss then
            G.GAME.round_resets.hands = math.max(1, G.GAME.round_resets.hands - card.ability.extra.hands_lost)
            ease_hands_played(-card.ability.extra.hands_lost)
            return {
                message = "-" .. card.ability.extra.hands_lost .. " Mano" .. (card.ability.extra.hands_lost > 1 and "s" or ""),
                colour = G.C.RED
            }
        end
    end
  end
})

-- Beltzer
local Beltzer = J({
  name = "Beltzer",
  pos = { x = 10, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Blade
local Blade = J({
  name = "Blade",
  pos = { x = 11, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Argie
local Argie = J({
  name = "Argie",
  pos = { x = 12, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Bamboo
local Bamboo = J({
  name = "Bamboo",
  pos = { x = 0, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Messer
local Messer = J({
  name = "Messer",
  pos = { x = 1, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Spark
local Spark = J({
  name = "Spark",
  pos = { x = 2, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Sparrow
local Sparrow = J({
  name = "Sparrow",
  pos = { x = 3, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Jamm
local Jamm = J({
  name = "Jamm",
  pos = { x = 4, y = 7 },
  config = { extra = { xmult = 1.25 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.xmult } }
  end,
  rarity = 2, -- Uncommon
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  update = function(self, card, dt)
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card then
                local is_target = not card.debuff and (is_type(v, C.Mountain) or is_type(v, C.Wind))
                if is_target then
                    v.jamm_debuffed = true
                    if not v.debuff then v:set_debuff(true) end
                elseif v.jamm_debuffed then
                    v.jamm_debuffed = nil
                    v:set_debuff(false)
                end
            end
        end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v.jamm_debuffed then v.jamm_debuffed = nil; v:set_debuff(false) end
        end
    end
  end,
  calculate = function(self, card, context)
    if context.other_joker and context.other_joker ~= card and not card.debuff and not context.other_joker.debuff 
    and (is_type(context.other_joker, C.Fire) or is_type(context.other_joker, C.Forest)) then
        G.E_MANAGER:add_event(Event({func = function() context.other_joker:juice_up(0.5, 0.5); return true end}))
        return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.xmult}},
            Xmult_mod = card.ability.extra.xmult
        }
    end
  end
})

-- Caleb Stonewall
local CalebR = J({
  name = "CalebR",
  pos = { x = 5, y = 7 },
  config = { extra = { current_xmult = 1, xmult_gain = 0.5, buff_mod = 1.25 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.current_xmult, center.ability.extra.xmult_gain, (center.ability.extra.buff_mod - 1) * 100 } }
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 8,
  atlas = "Jokers01",
  ptype = C.Fire,
  pposition = C.MF,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        local destroyed_any = false
        local buffed_any = false
        
        if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
            for i = #Pokerleven.ina_bench_area.cards, 1, -1 do
                local bench_card = Pokerleven.ina_bench_area.cards[i]
                if is_team(bench_card, "Royal Academy") or is_team(bench_card, "Royal Redux") then
                    if bench_card.config.center_key == "j_ina_KingR" then
                        bench_card.ability.extra.chip_mod = math.floor((bench_card.ability.extra.chip_mod or 0) * card.ability.extra.buff_mod)
                        card_eval_status_text(bench_card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.CHIPS})
                        buffed_any = true
                    elseif bench_card.config.center_key == "j_ina_SamfordR" then
                        bench_card.ability.extra.xmult_mod = (bench_card.ability.extra.xmult_mod or 0) * card.ability.extra.buff_mod
                        card_eval_status_text(bench_card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex'), colour = G.C.MULT})
                        buffed_any = true
                    else
                        card.ability.extra.current_xmult = card.ability.extra.current_xmult + card.ability.extra.xmult_gain
                        bench_card:start_dissolve({G.C.RED}, nil, 1.6)
                        destroyed_any = true
                    end
                end
            end
        end
        
        if destroyed_any then
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize{type='variable',key='a_xmult',vars={card.ability.extra.current_xmult}}})
        elseif buffed_any then
            card:juice_up(0.5, 0.5)
        end
    end
    
    if context.joker_main and context.scoring_hand and card.ability.extra.current_xmult > 1 then
        return {
            message = localize{type='variable',key='a_xmult',vars={card.ability.extra.current_xmult}},
            Xmult_mod = card.ability.extra.current_xmult
        }
    end
  end
})

-- David Samford
local SamfordR = J({
  name = "SamfordR",
  pos = { x = 6, y = 7 },
  config = { extra = { xmult_mod = 1, current_xmult = 1 } },
  loc_vars = function(self, info_queue, center)
    return { vars = { center.ability.extra.xmult_mod, center.ability.extra.current_xmult } }
  end,
  rarity = 3, -- Rare
  pools = { ["Royal Redux"] = true },
  cost = 8,
  atlas = "Jokers01",
  ptype = C.Forest,
  pposition = C.FW,
  pteam = "Royal Redux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  calculate = function(self, card, context)
    if context.setting_blind and not context.blueprint then
        local discards = G.GAME.current_round.discards_left
        if discards > 0 then
            card.ability.extra.current_xmult = discards * card.ability.extra.xmult_mod
            G.E_MANAGER:add_event(Event({func = function()
                ease_discard(-discards, nil, true)
                return true 
            end }))
            card_eval_status_text(card, 'extra', nil, nil, nil, {message = "X" .. card.ability.extra.current_xmult .. " Mult!", colour = G.C.MULT})
        else
            card.ability.extra.current_xmult = 1
        end
    end
    if context.joker_main and context.scoring_hand then
        if card.ability.extra.current_xmult > 1 then
            return {
                message = localize{type='variable',key='a_xmult',vars={card.ability.extra.current_xmult}},
                Xmult_mod = card.ability.extra.current_xmult
            }
        end
    end
  end
})

-- Cellar
local Cellar = J({
  name = "Cellar",
  pos = { x = 7, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.GK,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Zenn
local Zenn = J({
  name = "Zenn",
  pos = { x = 8, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Little
local Little = J({
  name = "Little",
  pos = { x = 9, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Cossimo
local Cossimo = J({
  name = "Cossimo",
  pos = { x = 10, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

-- Color
local Color = J({
  name = "Color",
  pos = { x = 11, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1, -- Common
  pools = { ["Royal Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pteam = "Royal Redux",
  blueprint_compat = true,
  calculate = function(self, card, context)
  end
})

return {
    name = "Royal Redux",
    list = { KingR, Jamm, CalebR, SamfordR }
    -- list = { Beltzer, Blade, Argie, Bamboo, Messer, Spark, Sparrow, Jamm, CalebR, SamfordR, Cellar, Zenn, Little, Cosimo, Color },
}
