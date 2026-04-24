local Dvalin = J({
    name = "Dvalin",
    pos = { x = 3, y = 0 },
    soul_pos = { x = 3, y = 1 },
    config = { extra = { pposition = "GK", pos_left = "GK", pos_right = "FW", chip_mod = 150, barriers_added = 1 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue + 1] = { set = "Other", key = "RolChange", vars = { ex.pos_left, ex.pos_right } }
        info_queue[#info_queue + 1] = { set = "Other", key = "Position_Evolution" }
        return { vars = { ex.chip_mod, ex.barriers_added } }
    end,
    rarity = "ina_top",
    pools = { ["Epsilon"] = true },
    cost = 7,
    atlas = "top",
    ptype = C.Fire,
    pposition = C.GK,
    pteam = "ina_team_Epsilon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) then
            Pokerleven.ease_barriers(ex.barriers_added); return { message = localize { type = 'variable', key = 'a_chips', vars = { ex.chip_mod } }, chip_mod =
            ex.chip_mod, colour = G.C.CHIPS }
        end
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
            if not Pokerleven.is_state_changed(card, { G.jokers }) then return end
            if not Pokerleven.is_in_left_half(card) then
                local zell_plus = get_joker_with_key('j_ina_Zell_Plus')
                if zell_plus then ina_backend_evolve(zell_plus, 'j_ina_Zell') end
                ina_backend_evolve(card, 'j_ina_Dvalin_Plus') 
            end
        end
    end
})

local Dvalin_Plus = J({
    name = "Dvalin_Plus",
    pos = { x = 4, y = 0 },
    soul_pos = { x = 4, y = 1 },
    config = { extra = { pposition = "FW", pos_left = "GK", pos_right = "FW", xmult_mod = 0.5, barriers_consumed = 1 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue + 1] = { set = "Other", key = "RolChange", vars = { ex.pos_left, ex.pos_right } }
        return { vars = { 1 + ((G.GAME and G.GAME.current_round and G.GAME.current_round.barriers or 0) * ex.xmult_mod), ex.barriers_consumed, ex.xmult_mod } }
    end,
    rarity = "ina_top",
    pools = { ["Epsilon"] = false },
    cost = 7,
    atlas = "top",
    ptype = C.Wind,
    pposition = C.FW,
    pteam = "ina_team_Epsilon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) then
            local b = G.GAME.current_round.barriers or 0
            if b >= ex.barriers_consumed then
                Pokerleven.ease_barriers(-ex.barriers_consumed)
                local v = 1 + b * ex.xmult_mod
                return { message = localize { type = 'variable', key = 'a_xmult', vars = { v } }, Xmult_mod = v, colour =
                G.C.MULT }
            end
        end
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
            if not Pokerleven.is_state_changed(card, { G.jokers }) then return end
            if Pokerleven.is_in_left_half(card) then ina_backend_evolve(card, 'j_ina_Dvalin') end
        end
    end,
    custom_pool_func = true,
    in_pool = function() return false end
})

-- Kenville
local Kenville = J({
    name = "Kenville",
    pos = { x = 1, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Kenville_Evolution' }
        return {} 
    end,
    rarity = 2,
    pools = { ["Epsilon"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    pteam = "ina_team_Epsilon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.individual and ctx.cardarea == G.play and not ctx.blueprint then
            local oc = ctx.other_card
            if not oc then return end
            local id = oc:get_id()
            if id == 2 or id == 3 or id == 4 then
                local target_ranks = { { id = 14, val = 'Ace', nom = 11 }, { id = 13, val = 'King', nom = 10 } }
                local diff = Pokerleven.simulate_rank_difference(card, ctx, target_ranks)
                if diff then diff.card = card; return diff end
            end
        elseif ctx.end_of_round and G.GAME.last_hand_played == 'High Card' and not ctx.blueprint then
            ina_backend_evolve(card, 'j_ina_Kenville_Plus')
        end
    end
})

local Kenville_Plus = J({
    name = "Kenville_Plus",
    pos = { x = 12, y = 5 },
    config = { extra = { timer = 2 } },
    loc_vars = function(self, info_queue, center) return { vars = { center.ability.extra.timer } } end,
    rarity = 2,
    pools = { ["Epsilon"] = false },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.DF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.individual and ctx.cardarea == G.play and not ctx.blueprint then
            local oc = ctx.other_card
            local id = oc:get_id()
            if id == 2 or id == 3 or id == 4 then
                local target_ranks = { { id = 14, val = 'Ace', nom = 11 }, { id = 13, val = 'King', nom = 10 } }
                local diff = Pokerleven.simulate_rank_difference(card, ctx, target_ranks)
                if diff then
                    local editions = {'foil', 'holo', 'polychrome'}
                    local chosen = editions[math.random(#editions)]
                    if chosen == 'foil' then diff.chips = (diff.chips or 0) + 50
                    elseif chosen == 'holo' then diff.mult = (diff.mult or 0) + 10
                    elseif chosen == 'polychrome' then diff.x_mult = (diff.x_mult or 1) * 1.5 end
                    diff.card = card; return diff
                end
            end
        elseif ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition then
            card.ability.extra.timer = card.ability.extra.timer - 1
            if card.ability.extra.timer <= 0 then ina_backend_evolve(card, 'j_ina_Kenville') end
        end
    end
})

-- Mole
local Mole = J({
    name = "Mole",
    pos = { x = 2, y = 5 },
    config = { extra = { transfers = 0, target_transfers = 20, pending_enhancements = {} } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Mole_Evolution', vars = { ex.transfers, ex.target_transfers } }
        return { vars = { ex.transfers, ex.target_transfers } }
    end,
    rarity = 1,
    pools = { ["Epsilon"] = true },
    cost = 5,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.DF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.discard and not ctx.blueprint then
            local oc = ctx.other_card
            local center = oc.config.center
            if center.key ~= 'm_none' then
                table.insert(card.ability.extra.pending_enhancements, center.key)
                oc:set_ability(G.P_CENTERS.m_none)
                card.ability.extra.transfers = card.ability.extra.transfers + 1
                if card.ability.extra.transfers >= card.ability.extra.target_transfers then
                    ina_backend_evolve(card, 'j_ina_Mole_Plus')
                end
                return { anim = 'dissolve', card = card }
            end
        end
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and #card.ability.extra.pending_enhancements > 0 and G.hand then
            for i = #G.hand.cards, 1, -1 do
                local c = G.hand.cards[i]
                if c.config.center.key == 'm_none' and not c.highlighted then
                    local enh = table.remove(card.ability.extra.pending_enhancements)
                    c:set_ability(G.P_CENTERS[enh])
                    c:juice_up()
                    if #card.ability.extra.pending_enhancements == 0 then break end
                end
            end
        end
    end
})

local Mole_Plus = J({
    name = "Mole_Plus",
    pos = { x = 0, y = 6 },
    config = { extra = { pending_data = {} } },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Epsilon"] = false },
    cost = 5,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.DF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.discard and not ctx.blueprint then
            local oc = ctx.other_card
            local data = { enh = oc.config.center.key, edition = oc.edition, seal = oc.seal }
            if data.enh ~= 'm_none' or data.edition or data.seal then
                table.insert(card.ability.extra.pending_data, data)
                oc:set_ability(G.P_CENTERS.m_none)
                oc:set_edition(nil, true)
                oc.seal = nil
                return { anim = 'dissolve', card = card }
            end
        end
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and #card.ability.extra.pending_data > 0 and G.hand then
            for i = #G.hand.cards, 1, -1 do
                local c = G.hand.cards[i]
                if c.config.center.key == 'm_none' and not c.edition and not c.seal and not c.highlighted then
                    local data = table.remove(card.ability.extra.pending_data)
                    if data.enh ~= 'm_none' then c:set_ability(G.P_CENTERS[data.enh]) end
                    if data.edition then c:set_edition(data.edition, true) end
                    if data.seal then c:set_seal(data.seal, true) end
                    c:set_seal('Gold', true)
                    c:juice_up()
                    if #card.ability.extra.pending_data == 0 then break end
                end
            end
        end
    end
})

-- Kayson
local Kayson = J({
    name = "Kayson",
    pos = { x = 3, y = 5 },
    config = { extra = { reduction = 0.05, boss_wins = 0, target_boss_wins = 5 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Kayson_Evolution', vars = { ex.boss_wins, ex.target_boss_wins } }
        return { vars = { ex.reduction * 100, ex.boss_wins, ex.target_boss_wins } }
    end,
    rarity = 1,
    pools = { ["Epsilon"] = true },
    cost = 6,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.DF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.before and not ctx.blueprint then
            local is_difficult = (ctx.scoring_name == 'Full House' or ctx.scoring_name == 'Four of a Kind' or ctx.scoring_name == 'Flush')
            if is_difficult then
                G.kayson_next_reduction = (G.kayson_next_reduction or 0) + card.ability.extra.reduction
                return { message = "-" .. (card.ability.extra.reduction * 100) .. "% Next Blind", colour = G.C.RED }
            end
        elseif ctx.end_of_round and G.GAME.blind.boss and not ctx.blueprint and not ctx.individual and not ctx.repetition then
            card.ability.extra.boss_wins = card.ability.extra.boss_wins + 1
            if card.ability.extra.boss_wins >= card.ability.extra.target_boss_wins then
                ina_backend_evolve(card, 'j_ina_Kayson_Plus')
            end
        end
    end
})

local Kayson_Plus = J({
    name = "Kayson_Plus",
    pos = { x = 1, y = 6 },
    config = { extra = { reduction = 0.15, timer = 1 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.reduction * 100, center.ability.extra.timer } }
    end,
    rarity = 1,
    pools = { ["Epsilon"] = false },
    cost = 6,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.DF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.before and not ctx.blueprint then
             G.kayson_next_reduction = (G.kayson_next_reduction or 0) + card.ability.extra.reduction
             return { message = "-" .. (card.ability.extra.reduction * 100) .. "% Next Blind", colour = G.C.RED }
        elseif ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition then
            card.ability.extra.timer = card.ability.extra.timer - 1
            if card.ability.extra.timer <= 0 then ina_backend_evolve(card, 'j_ina_Kayson') end
        end
    end
})

-- Tytan
local Tytan = J({
    name = "Tytan",
    pos = { x = 4, y = 5 },
    config = { extra = { chips = 80, scored_count = 0, target_count = 10 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Tytan_Evolution', vars = { ex.scored_count, ex.target_count } }
        return { vars = { ex.chips, ex.scored_count, ex.target_count } }
    end,
    rarity = 1,
    pools = { ["Epsilon"] = true },
    cost = 5,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.DF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.individual and ctx.cardarea == G.play then
            if SMODS.has_enhancement(ctx.other_card, 'm_stone') or SMODS.has_enhancement(ctx.other_card, 'm_steel') then
                card.ability.extra.scored_count = card.ability.extra.scored_count + 1
                if card.ability.extra.scored_count >= card.ability.extra.target_count then
                    ina_backend_evolve(card, 'j_ina_Tytan_Plus')
                end
                return { chips = card.ability.extra.chips, card = card }
            end
        end
    end
})

local Tytan_Plus = J({
    name = "Tytan_Plus",
    pos = { x = 2, y = 6 },
    config = { extra = { chips = 120, x_mult = 0.2, timer = 3 } },
    loc_vars = function(self, info_queue, center)
        return { vars = { center.ability.extra.chips, center.ability.extra.x_mult, center.ability.extra.timer } }
    end,
    rarity = 1,
    pools = { ["Epsilon"] = false },
    cost = 5,
    atlas = "Jokers02",
    ptype = C.Mountain,
    pposition = C.DF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.individual and ctx.cardarea == G.play then
            if SMODS.has_enhancement(ctx.other_card, 'm_stone') or SMODS.has_enhancement(ctx.other_card, 'm_steel') then
                return { chips = card.ability.extra.chips, x_mult = 1 + card.ability.extra.x_mult, card = card }
            end
        elseif ctx.end_of_round and not ctx.blueprint and not ctx.individual and not ctx.repetition then
            card.ability.extra.timer = card.ability.extra.timer - 1
            if card.ability.extra.timer <= 0 then ina_backend_evolve(card, 'j_ina_Tytan') end
        end
    end
})

-- Fedora
local Fedora = J({
    name = "Fedora",
    pos = { x = 5, y = 5 },
    config = { extra = { mult_per_discard = 10, discarded_this_blind = 0, planets_used = 0, target_planets = 3 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Fedora_Evolution', vars = { ex.planets_used, ex.target_planets } }
        return { vars = { ex.mult_per_discard, ex.mult_per_discard * (ex.discarded_this_blind or 0), ex.planets_used } }
    end,
    rarity = 2,
    pools = { ["Epsilon"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.MF,
    pteam = "ina_team_Epsilon",
    techtype = C.UPGRADES.Number,
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.using_consumeable and ctx.consumeable.ability.set == 'Planet' and not ctx.blueprint then
            ex.planets_used = ex.planets_used + 1
            if ex.planets_used >= ex.target_planets then ina_backend_evolve(card, 'j_ina_Fedora_Plus') end
        elseif (ctx.setting_blind or ctx.skip_blind) and not ctx.blueprint then
            if ctx.setting_blind then ex.discarded_this_blind = 0 end
        elseif ctx.discard and not ctx.blueprint then
            ex.discarded_this_blind = (ex.discarded_this_blind or 0) + 1
        elseif ctx.individual and ctx.cardarea == G.play then
            if ctx.other_card and ctx.other_card.config.center.key == 'm_ina_chaotic' then
                local m = ex.mult_per_discard * (ex.discarded_this_blind or 0)
                if m > 0 then return { mult = m, card = card } end
            end
        end
    end
})

local Fedora_Plus = J({
    name = "Fedora_Plus",
    pos = { x = 3, y = 6 },
    config = { extra = { x_mult = 2 } },
    loc_vars = function(self, info_queue, center) return { vars = { center.ability.extra.x_mult } } end,
    rarity = 2,
    pools = { ["Epsilon"] = false },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Fire,
    pposition = C.MF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.joker_main then
            local dvalin = get_joker_with_key('j_ina_Dvalin_Plus')
            if dvalin then return { x_mult = card.ability.extra.x_mult } end
        end
    end
})

-- Krypto
local Krypto = J({
    name = "Krypto",
    pos = { x = 6, y = 5 },
    config = { extra = { target_chaotic = 5 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        local count = 0
        if G.playing_cards then for _, c in ipairs(G.playing_cards) do if c.config.center.key == 'm_ina_chaotic' then count = count + 1 end end end
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Krypto_Evolution', vars = { count, ex.target_chaotic } }
        return { vars = { ex.target_chaotic } } 
    end,
    rarity = 1,
    pools = { ["Epsilon"] = true },
    cost = 6,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.repetition and ctx.cardarea == G.play then
            local has_chaotic = false
            for _, c in ipairs(G.hand.cards) do if c.config.center.key == 'm_ina_chaotic' then has_chaotic = true; break end end
            if has_chaotic and ctx.other_card == ctx.scoring_hand[math.ceil(#ctx.scoring_hand/2)] then
                return { message = localize('k_again_ex'), repetitions = 1, card = ctx.other_card }
            end
        end
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
            local count = 0
            for _, c in ipairs(G.playing_cards) do if c.config.center.key == 'm_ina_chaotic' then count = count + 1 end end
            if count >= card.ability.extra.target_chaotic then
                ina_backend_evolve(card, 'j_ina_Krypto_Plus')
            end
        end
    end
})

local Krypto_Plus = J({
    name = "Krypto_Plus",
    pos = { x = 4, y = 6 },
    config = { extra = { target_chaotic = 5 } },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Epsilon"] = false },
    cost = 6,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.MF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.repetition and ctx.cardarea == G.play then
            local has_chaotic = false
            for _, c in ipairs(G.hand.cards) do if c.config.center.key == 'm_ina_chaotic' then has_chaotic = true; break end end
            if has_chaotic then
                return { message = localize('k_again_ex'), repetitions = 1, card = ctx.other_card }
            end
        end
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
            local count = 0
            for _, c in ipairs(G.playing_cards) do if c.config.center.key == 'm_ina_chaotic' then count = count + 1 end end
            if count < card.ability.extra.target_chaotic then
                ina_backend_evolve(card, 'j_ina_Krypto')
            end
        end
    end
})

-- Sworm
local Sworm = J({
    name = "Sworm",
    pos = { x = 7, y = 5 },
    config = { extra = { odds = 3 } },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Sworm_Evolution' }
        return { vars = { G.GAME.probabilities.normal or 1, center.ability.extra.odds } }
    end,
    rarity = 1,
    pools = { ["Epsilon"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.MF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.after and ctx.cardarea == G.jokers and not card.debuff and not ctx.blueprint then
            local s = {}; for _, v in ipairs(ctx.full_hand) do if card:odds_triggered('sworm') then s[#s + 1] = v end end
            if Pokerleven.rescue_cards(s) then return { message = localize('k_safe_ex'), colour = G.C.DARK_EDITION } end
        elseif ctx.end_of_round and G.GAME.current_round.discards_used == 0 and not ctx.blueprint then
            ina_backend_evolve(card, 'j_ina_Sworm_Plus')
        end
    end
})

local Sworm_Plus = J({
    name = "Sworm_Plus",
    pos = { x = 5, y = 6 },
    config = { extra = { odds = 1 } },
    loc_vars = function(self, info_queue, center) return {} end,
    rarity = 1,
    pools = { ["Epsilon"] = false },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Forest,
    pposition = C.MF,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.after and ctx.cardarea == G.jokers and not card.debuff and not ctx.blueprint then
            local s = {}; for _, v in ipairs(ctx.full_hand) do s[#s + 1] = v end
            if Pokerleven.rescue_cards(s) then 
                for _, c in ipairs(s) do c:set_ability(G.P_CENTERS.m_steel) end
                return { message = localize('k_steel'), colour = G.C.GREY } 
            end
        end
    end
})

-- Mercury
local Mercury = J({
    name = "Mercury",
    pos = { x = 8, y = 5 },
    config = { extra = { required_stones = 2, mercuries = 0, target_mercuries = 5 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Mercury_Evolution', vars = { ex.mercuries, ex.target_mercuries } }
        return { vars = { ex.required_stones, ex.mercuries } }
    end,
    rarity = 2,
    pools = { ["Epsilon"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.pre_discard and ctx.full_hand and #ctx.full_hand == 2 and not ctx.blueprint then
            if ctx.full_hand[1]:get_id() == ctx.full_hand[2]:get_id() then
                convert_cards_to(ctx.full_hand, { mod_conv = "m_stone" })
                return { message = localize("ina_convert"), colour = G.C.DARK_EDITION }
            end
        elseif ctx.using_consumeable and ctx.consumeable.ability.set == 'Planet' and ctx.consumeable.config.center.key == 'c_mercury' and not ctx.blueprint then
            card.ability.extra.mercuries = card.ability.extra.mercuries + 1
            if card.ability.extra.mercuries >= card.ability.extra.target_mercuries then ina_backend_evolve(card, 'j_ina_Mercury_Plus') end
        elseif ctx.joker_main then
            local stones = 0
            for _, v in ipairs(ctx.scoring_hand) do if SMODS.has_enhancement(v, 'm_stone') then stones = stones + 1 end end
            if stones == 2 and #ctx.scoring_hand == 2 then
                return { chips = 100, mult = 10, message = localize('k_pair') }
            end
        end
    end
})

local Mercury_Plus = J({
    name = "Mercury_Plus",
    pos = { x = 6, y = 6 },
    config = { extra = { chips = 100, x_mult = 1.5 } },
    loc_vars = function(self, info_queue, center) return { vars = { center.ability.extra.chips, center.ability.extra.x_mult } } end,
    rarity = 2,
    pools = { ["Epsilon"] = false },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.pre_discard and ctx.full_hand and #ctx.full_hand == 2 and not ctx.blueprint then
            if ctx.full_hand[1]:get_id() == ctx.full_hand[2]:get_id() then
                convert_cards_to(ctx.full_hand, { mod_conv = "m_stone" })
                return { message = localize("ina_convert"), colour = G.C.DARK_EDITION }
            end
        elseif ctx.individual and ctx.cardarea == G.play then
            if SMODS.has_enhancement(ctx.other_card, 'm_stone') then
                return { chips = card.ability.extra.chips, x_mult = card.ability.extra.x_mult, card = card }
            end
        elseif ctx.joker_main then
            local stones = 0
            for _, v in ipairs(ctx.scoring_hand) do if SMODS.has_enhancement(v, 'm_stone') then stones = stones + 1 end end
            if stones == 2 and #ctx.scoring_hand == 2 then
                return { message = localize('k_pair'), colour = G.C.CHIPS }
            end
        end
    end
})

-- Metron
local Metron = J({
    name = "Metron",
    pos = { x = 9, y = 5 },
    config = { extra = { exp_gain = 0.015, current_exp = 1, target_exp = 1.3 } },
    loc_vars = function(self, info_queue, center)
        local ex = center.ability.extra
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Metron_Evolution', vars = { ex.current_exp, ex.target_exp } }
        return { vars = { ex.exp_gain, ex.current_exp } }
    end,
    rarity = 2,
    pools = { ["Epsilon"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.before and not ctx.blueprint then
            ex.current_exp = ex.current_exp + ex.exp_gain
            if ex.current_exp >= ex.target_exp then ina_backend_evolve(card, 'j_ina_Metron_Plus') end
            return { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }
        elseif Pokerleven.is_joker_turn(ctx) then
            local current_chips = G.GAME.current_round.current_hand.chips or 1
            local chip_diff = math.floor((current_chips ^ ex.current_exp) - current_chips)
            return { chip_mod = chip_diff, colour = G.C.CHIPS }
        end
    end
})

local Metron_Plus = J({
    name = "Metron_Plus",
    pos = { x = 7, y = 6 },
    config = { extra = { exp_gain = 0.04, current_exp = 1.3 } },
    loc_vars = function(self, info_queue, center) return { vars = { center.ability.extra.exp_gain, center.ability.extra.current_exp } } end,
    rarity = 2,
    pools = { ["Epsilon"] = false },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if ctx.before and not ctx.blueprint then
            ex.current_exp = ex.current_exp + ex.exp_gain
            return { message = localize('k_upgrade_ex'), colour = G.C.CHIPS }
        elseif Pokerleven.is_joker_turn(ctx) then
            local current_chips = G.GAME.current_round.current_hand.chips or 1
            local chip_diff = math.floor((current_chips ^ ex.current_exp) - current_chips)
            return { chip_mod = chip_diff, colour = G.C.CHIPS }
        end
    end
})

-- Zell
local Zell = J({
    name = "Zell",
    pos = { x = 10, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center)
        info_queue[#info_queue + 1] = { set = 'Other', key = 'Position_Evolution' }
        return { vars = { #find_player_team("ina_team_Epsilon") } } 
    end,
    rarity = 3,
    pools = { ["Epsilon"] = true },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.FW,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.before and not ctx.blueprint then
            local count = #find_player_team("ina_team_Epsilon")
            if count > 0 then
                level_up_hand(card, 'High Card', true, count)
                return { message = localize('k_level_up_ex'), colour = G.C.CHIPS }
            end
        end
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
            if not Pokerleven.is_state_changed(card, { G.jokers }) then return end
            if not Pokerleven.is_in_left_half(card) then
                local dvalin_plus = get_joker_with_key('j_ina_Dvalin_Plus')
                if dvalin_plus then ina_backend_evolve(dvalin_plus, 'j_ina_Dvalin') end
                ina_backend_evolve(card, 'j_ina_Zell_Plus') 
            end
        end
    end
})

local Zell_Plus = J({
    name = "Zell_Plus",
    pos = { x = 11, y = 5 },
    config = { extra = {} },
    loc_vars = function(self, info_queue, center) return { vars = { #find_player_team("ina_team_Epsilon") } } end,
    rarity = 3,
    pools = { ["Epsilon"] = false },
    cost = 7,
    atlas = "Jokers02",
    ptype = C.Wind,
    pposition = C.GK,
    pteam = "ina_team_Epsilon",
    blueprint_compat = true,
    calculate = function(self, card, ctx)
        if ctx.before and not ctx.blueprint then
            local count = #find_player_team("ina_team_Epsilon")
            if count > 0 then
                for _, v in pairs(G.GAME.hands) do v.level = v.level + count end
                return { message = localize('k_level_up_ex'), colour = G.C.CHIPS }
            end
        end
    end,
    update = function(self, card, dt)
        if G.STAGE == G.STAGES.RUN and card.area == G.jokers then
            if not Pokerleven.is_state_changed(card, { G.jokers }) then return end
            if Pokerleven.is_in_left_half(card) then ina_backend_evolve(card, 'j_ina_Zell') end
        end
    end
})

return {
    name = "Epsilon",
    list = { 
        Dvalin, Dvalin_Plus, 
        Kenville, Kenville_Plus, 
        Fedora, Fedora_Plus, 
        Sworm, Sworm_Plus, 
        Mercury, Mercury_Plus, 
        Metron, Metron_Plus, 
        Zell, Zell_Plus, 
        Mole, Mole_Plus, 
        Kayson, Kayson_Plus, 
        Tytan, Tytan_Plus, 
        Krypto, Krypto_Plus 
    }
}
