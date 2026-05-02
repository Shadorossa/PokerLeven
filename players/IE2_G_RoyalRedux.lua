local King_Redux = J({
  name = "King_Redux",
  pos = { x = 2, y = 6 },
  config = { extra = { barriers = 2, chip_mod = 100, hands_lost = 1, blind_count = 0, trigger_at = 3 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = {
      ex.barriers, ex.chip_mod, ex.hands_lost,
      ex.chip_mod * (G.GAME and G.GAME.round_resets and G.GAME.round_resets.hands or 1),
      ex.trigger_at, ex.blind_count
    } }
  end,
  rarity = 3,
  pools = { ["Royal Academy Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = true,
  aux_ina = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then
        Pokerleven.ease_barriers(ex.barriers)
    elseif Pokerleven.is_joker_turn(ctx) then
        local h = (G.GAME and G.GAME.round_resets and G.GAME.round_resets.hands) or 1
        local c = ex.chip_mod * h
        return { message = localize { type = 'variable', key = 'a_chips', vars = { c } }, chip_mod = c, colour = G.C.BLUE }
    elseif Pokerleven.is_joker_end_of_round(ctx) and not ctx.blueprint then
        ex.blind_count = ex.blind_count + 1
        if ex.blind_count >= ex.trigger_at then
            ex.blind_count = 0
            G.GAME.round_resets.hands = math.max(1, G.GAME.round_resets.hands - ex.hands_lost)
            return { message = localize { type = 'variable', key = 'a_handsize_minus', vars = { ex.hands_lost } }, colour = G.C.RED }
        end
    end
  end
})

local Beltzer = J({
  name = "Beltzer",
  pos = { x = 3, y = 6 },
  config = { extra = { chip_gain = 15, current_chips = 0 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.chip_gain, ex.current_chips } }
  end,
  rarity = 1,
  pools = { ["Royal Academy Redux"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  aux_ina = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.discard and not ctx.blueprint then
        local oc = ctx.other_card
        if oc == ctx.full_hand[1] then
            local lowest = ctx.full_hand[1]
            for _, v in ipairs(ctx.full_hand) do if v:get_id() < lowest:get_id() then lowest = v end end
            lowest:start_dissolve()
            ex.current_chips = ex.current_chips + ex.chip_gain
            return { message = "+" .. ex.chip_gain .. " Chips", colour = G.C.BLUE }
        end
    elseif Pokerleven.is_joker_turn(ctx) and ex.current_chips > 0 then
        return { chip_mod = ex.current_chips, colour = G.C.BLUE }
    end
  end
})

local Blade = J({
  name = "Blade",
  pos = { x = 4, y = 6 },
  config = { extra = { discards_gain = 1, triggered = false } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.discards_gain } }
  end,
  rarity = 1,
  pools = { ["Royal Academy Redux"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  aux_ina = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then
        ex.triggered = false
    end

    if ctx.joker_main and not ctx.blueprint and ctx.scoring_name and string.find(ctx.scoring_name, 'Flush') and not ex.triggered then
        ex.triggered = true
        ease_discard(ex.discards_gain)
        return { message = "+" .. ex.discards_gain .. " Descartes", colour = G.C.RED }
    end
  end
})

local Argie = J({
  name = "Argie",
  pos = { x = 5, y = 6 },
  config = { extra = { xmult = 1.2 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.xmult } }
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  aux_ina = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.joker_main and G.GAME.current_round.barriers and G.GAME.current_round.barriers > 0 then
        return { x_mult = ex.xmult }
    end
  end
})

local Bamboo = J({
  name = "Bamboo",
  pos = { x = 6, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue + 1] = G.P_CENTERS.c_fool
    return {}
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = false,
  aux_ina = true,
})

local Messer = J({
  name = "Messer",
  pos = { x = 7, y = 6 },
  config = { extra = { scry_mod = 2, play_limit_loss = 1 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.scry_mod, ex.play_limit_loss } }
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = false,
  aux_ina = true,
  add_to_deck = function(self, card, from_debuff)
    local ex = card.ability.extra
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) + ex.scry_mod
    if G.hand and G.hand.config then
        G.hand.config.highlighted_limit = math.max(1, G.hand.config.highlighted_limit - ex.play_limit_loss)
        if G.hand.highlighted and #G.hand.highlighted > G.hand.config.highlighted_limit then G.hand:unhighlight_all() end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    local ex = card.ability.extra
    G.GAME.scry_amount = (G.GAME.scry_amount or 0) - ex.scry_mod
    if G.hand and G.hand.config then
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + ex.play_limit_loss
    end
  end
})

local Spark = J({
  name = "Spark",
  pos = { x = 8, y = 6 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = false,
  aux_ina = true,
})

local get_UIBox_info_ref = Card.get_UIBox_info
function Card:get_UIBox_info()
    local res = get_UIBox_info_ref(self)
    if self.ability and self.ability.set == 'Booster' then
        local spark = get_joker_with_key('j_ina_Spark')
        if spark and not spark.debuff then
            if not self.ability.spark_peek then
                local p = (self.config.center.key:find('planet') and 'Planet' or
                           self.config.center.key:find('spectral') and 'Spectral' or
                           self.config.center.key:find('standard') and 'Default' or 'Tarot')
                pseudoseed_push('spark_' .. (self.ID or 0))
                local dummy = create_card(p, G.consumeables, nil, nil, nil, nil, nil, 'spark')
                self.ability.spark_peek = dummy.config.center.key
                dummy:remove()
                pseudoseed_pop()
            end
            if self.ability.spark_peek then
                G.info_queue[#G.info_queue+1] = G.P_CENTERS.self.ability.spark_peek
            end
        end
    end
    return res
end

local card_set_ability_ref = Card.set_ability
function Card:set_ability(center, initial, delay_sprites)
    card_set_ability_ref(self, center, initial, delay_sprites)
    if self.ability and self.ability.set == 'Booster' then
        self.ability.spark_peek = nil
    end
end

local Sparrow = J({
  name = "Sparrow",
  pos = { x = 9, y = 6 },
  config = { extra = { money = 4 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.money } }
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.MF,
  pgender = C.F,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Number,
  blueprint_compat = false,
  aux_ina = true,
  update = function(self, card, dt)
    if G.jokers and G.jokers.cards and card.area == G.jokers then
        if not Pokerleven.is_state_changed(card, {G.jokers}) then return end
        local l, r = card:get_left_joker(), card:get_right_joker()
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card then
                if not card.debuff and (v == l or v == r) then
                    v.sparrow_debuffed = true
                    if not v.debuff then v:set_debuff(true) end
                elseif v.sparrow_debuffed then
                    v.sparrow_debuffed = nil
                    v:set_debuff(false)
                end
            end
        end
    end
  end,
  remove_from_deck = function(self, card, from_debuff)
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v.sparrow_debuffed then
                v.sparrow_debuffed = nil
                v:set_debuff(false)
            end
        end
    end
  end,
  calc_dollar_bonus = function(self, card)
    if card.debuff then return 0 end
    local count = 0
    if G.jokers and G.jokers.cards then
        for _, v in ipairs(G.jokers.cards) do
            if v.sparrow_debuffed then count = count + 1 end
        end
    end
    return (count > 0 and count * card.ability.extra.money or 0)
  end
})

local Jamm = J({
  name = "Jamm",
  pos = { x = 10, y = 6 },
  config = { extra = { xmult = 2.5 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.xmult } }
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  aux_ina = true,
  update = function(self, card, dt)
    if G.jokers and G.jokers.cards and card.area == G.jokers then 
        if not Pokerleven.is_state_changed(card, {Pokerleven.get_jokers_hash()}) then return end
        for _, v in ipairs(G.jokers.cards) do
            if v ~= card then
                if not card.debuff and (is_type(v, C.Mountain) or is_type(v, C.Wind)) then
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
            if v.jamm_debuffed then
                v.jamm_debuffed = nil
                v:set_debuff(false)
            end
        end
    end
  end,
  calculate = function(self, card, ctx)
    local oj, ex = ctx.other_joker, card.ability.extra
    if oj and oj ~= card and not card.debuff and not oj.debuff and (is_type(oj, C.Fire) or is_type(oj, C.Forest)) then
        G.E_MANAGER:add_event(Event({
            func = function()
                oj:juice_up(0.5, 0.5)
                return true
            end
        }))
        return { message = localize { type = 'variable', key = 'a_xmult', vars = { ex.xmult } }, Xmult_mod = ex.xmult }
    end
  end
})

local Caleb_Redux = J({
  name = "Caleb_Redux",
  pos = { x = 11, y = 6 },
  config = { extra = { current_Xmult = 1, xmult_gain = 0.5, redux_turns = 0, turns_needed = 4 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    info_queue[#info_queue + 1] = G.P_CENTERS.j_ina_King_Redux
    info_queue[#info_queue + 1] = G.P_CENTERS.j_ina_Samford_Redux
    return { vars = { ex.current_Xmult, ex.xmult_gain, ex.turns_needed, ex.turns_needed - (ex.redux_turns or 0) } }
  end,
  rarity = 3,
  pools = { ["Royal Academy Redux"] = true },
  cost = 8,
  atlas = "Jokers02",
  ptype = C.Fire,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pcaptain = C.CAPTAIN,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  aux_ina = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then
        local ba, des, delay_amt = Pokerleven.ina_bench_area, false, 0
        local count = ba and ba.cards and #ba.cards or 0
        for i = count, 1, -1 do
            local b = ba.cards[i]
            if is_team(b, "ina_team_RoyalRedux") then
                ex.current_Xmult, des = ex.current_Xmult + ex.xmult_gain, true
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = delay_amt,
                    func = function()
                        b:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))
                delay_amt = delay_amt + 0.15
            end
        end
        if des then
            card_eval_status_text(card, 'extra', nil, nil, nil, { message = localize { type = 'variable', key = 'a_xmult', vars = { ex.current_Xmult } } })
        end
    elseif Pokerleven.is_joker_turn(ctx) and ex.current_Xmult > 1 then
        return { message = localize { type = 'variable', key = 'a_xmult', vars = { ex.current_Xmult } }, Xmult_mod = ex.current_Xmult }
    end
  end
})

local Samford_Redux = J({
  name = "Samford_Redux",
  pos = { x = 12, y = 6 },
  config = { extra = { Xmult_mod = 1, current_Xmult = 1 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.Xmult_mod, ex.current_Xmult } }
  end,
  rarity = 3,
  pools = { ["Royal Academy Redux"] = true },
  cost = 8,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  techtype = C.UPGRADES.Plus,
  blueprint_compat = true,
  aux_ina = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.setting_blind and not ctx.blueprint then
        local dl = (G.GAME and G.GAME.current_round and G.GAME.current_round.discards_left) or 0
        Pokerleven.consume_all_for_stat(card, dl, function(a) ease_discard(-a, nil, true) end, 'current_Xmult', ex.Xmult_mod, 1, 'a_xmult', G.C.MULT)
    elseif Pokerleven.is_joker_turn(ctx) and ex.current_Xmult > 1 then
        return { message = localize { type = 'variable', key = 'a_xmult', vars = { ex.current_Xmult } }, Xmult_mod = ex.current_Xmult }
    end
  end
})

local Cellar = J({
  name = "Cellar",
  pos = { x = 0, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 6,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.GK,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = false,
  aux_ina = true,
})

local corrupt_joker_ref = Pokerleven.corrupt_joker
function Pokerleven.corrupt_joker(target)
    local cellar = get_joker_with_key('j_ina_Cellar')
    if cellar and not cellar.debuff and target ~= cellar then
        card_eval_status_text(cellar, 'extra', nil, nil, nil, { message = localize('k_safe_ex'), colour = G.C.GREEN })
        cellar:start_dissolve({ G.C.RED }, nil, 1.6)
        return true
    end
    return corrupt_joker_ref(target)
end

local card_start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colour, silent, delay, m_card)
    if self.ability and self.ability.set == 'Joker' and not self.ability.eternal then
        local cellar = get_joker_with_key('j_ina_Cellar')
        if cellar and not cellar.debuff and self ~= cellar then
            card_eval_status_text(cellar, 'extra', nil, nil, nil, { message = localize('k_safe_ex'), colour = G.C.GREEN })
            cellar:start_dissolve({ G.C.RED }, nil, 1.6)
            return
        end
    end
    card_start_dissolve_ref(self, dissolve_colour, silent, delay, m_card)
end

local Zenn = J({
  name = "Zenn",
  pos = { x = 1, y = 7 },
  config = { extra = { mult = 40 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    return { vars = { ex.mult } }
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.FW,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  aux_ina = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.joker_main and #ctx.scoring_hand == 1 then
        return { mult = ex.mult, message = localize { type = 'variable', key = 'a_mult', vars = { ex.mult } } }
    end
  end
})

-- Little
local Little = J({
  name = "Little",
  pos = { x = 2, y = 7 },
  config = { extra = {} },
  loc_vars = function(self, info_queue, center)
    return {}
  end,
  rarity = 1,
  pools = { ["Royal Academy Redux"] = true },
  cost = 5,
  atlas = "Jokers02",
  ptype = C.Wind,
  pposition = C.DF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  calculate = function(self, card, ctx)
  end
})

local Cossimo = J({
  name = "Cossimo",
  pos = { x = 3, y = 7 },
  config = { extra = { xmult_per_bench = 0.5 } },
  loc_vars = function(self, info_queue, center)
    local ex = center.ability.extra
    local count = 0
    if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
        for _, v in ipairs(Pokerleven.ina_bench_area.cards) do
            if is_team(v, "ina_team_RoyalRedux") then count = count + 1 end
        end
    end
    return { vars = { ex.xmult_per_bench, 1 + count * ex.xmult_per_bench } }
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Forest,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = true,
  aux_ina = true,
  calculate = function(self, card, ctx)
    local ex = card.ability.extra
    if ctx.joker_main then
        local count = 0
        if Pokerleven.ina_bench_area and Pokerleven.ina_bench_area.cards then
            for _, v in ipairs(Pokerleven.ina_bench_area.cards) do
                if is_team(v, "ina_team_RoyalRedux") then count = count + 1 end
            end
        end
        local tx = 1 + count * ex.xmult_per_bench
        if tx > 1 then return { x_mult = tx } end
    end
  end
})

local Color = J({
  name = "Color",
  pos = { x = 4, y = 7 },
  loc_vars = function(self, info_queue, center)
    info_queue[#info_queue + 1] = G.P_CENTERS.c_sigil
    local s = G.GAME and G.GAME.ina_color_suit and localize(G.GAME.ina_color_suit, 'suits_singular') or "Ninguno"
    return { vars = { s } }
  end,
  rarity = 2,
  pools = { ["Royal Academy Redux"] = true },
  cost = 7,
  atlas = "Jokers02",
  ptype = C.Mountain,
  pposition = C.MF,
  pgender = C.M,
  pnation = C.JAPAN,
  pyear = C.YEAR_2,
  pteam = "ina_team_RoyalRedux",
  blueprint_compat = false,
  aux_ina = true,
  calculate = function(self, card, ctx)
    if ctx.joker_main and ctx.scoring_name and string.find(ctx.scoring_name, 'Flush') then
        G.GAME.ina_color_suit = ctx.scoring_hand[1].base.suit
        return { message = localize(G.GAME.ina_color_suit, 'suits_singular'), colour = G.C.ORANGE }
    end
  end
})

return {
    name = "Royal Academy Redux",
    list = { King_Redux, Beltzer, Blade, Argie, Messer, Spark, Sparrow, Jamm, CalebR, Samford_Redux, Cellar, Zenn, Cossimo, Color, Bamboo, Little }
}

