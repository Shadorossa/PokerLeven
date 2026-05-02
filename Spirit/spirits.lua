local Majin_Pegasus = J({
    name = "Majin_Pegasus",
    pos = { x = 0, y = 0 },
    config = { extra = { charges = 5, max_charges = 5, stat_mult = 1.02, charges_spent = 0, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {math.floor((ex.stat_mult - 1) * 100 + 0.5)}} end,
    rarity = 2,
    special = "Spirit",
    ptype = C.Wind,
    techtype = C.UPGRADES.Spirit,
    pools = { ["Spirit"] = true },
    cost = 8,
    atlas = "Spirits01",
    update = function(self, card, dt)
        if not Pokerleven.is_state_changed(card, {Pokerleven.is_spirit_active(card), Pokerleven.get_jokers_hash(C.Wind), card.ability.extra.charges, card.ability.extra.stat_mult}) then return end
        Pokerleven.update_spirit_aura(card, C.Wind)
    end,
    remove_from_deck = function(self, card, from_debuff)
        Pokerleven.remove_spirit_aura(card)
    end,
    calculate = function(self, card, ctx)
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

local Surtur = J({
    name = "Surtur",
    pos = { x = 9, y = 0 },
    config = { extra = { charges = 4, max_charges = 4, stat_gain = 0.005, accumulated_stats = 0, accumulated_levels = 0, is_active = false, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.accumulated_levels or 0, ex.stat_gain * (1 + (ex.tech_level or 0)) * 100, (ex.accumulated_stats or 0) * 100}} end,
    rarity = 2,
    special = "Spirit",
    ptype = C.Fire,
    techtype = C.UPGRADES.Spirit,
    pools = { ["Spirit"] = true },
    cost = 8,
    atlas = "Spirits01",
    update = function(self, card, dt)
        local ex, act = card.ability.extra, Pokerleven.is_spirit_active(card) and (card.ability.extra.charges > 0) and not card.debuff
        if ex.surtur_triggers then ex.accumulated_stats, ex.accumulated_levels, ex.surtur_triggers = (ex.accumulated_stats or 0) + ex.surtur_triggers * ex.stat_gain, (ex.accumulated_levels or 0) + ex.surtur_triggers, nil end
        if not Pokerleven.is_state_changed(card, {act, Pokerleven.get_jokers_hash(C.Fire), ex.charges, ex.accumulated_stats, ex.accumulated_levels}) then return end
        if act ~= ex.is_active then
            ex.is_active = act; if (ex.accumulated_levels or 0) > 0 then level_up_hand(card, 'ina_MagicHand', true, act and ex.accumulated_levels or -ex.accumulated_levels) end
        end
        if act then ex.stat_mult = 1 + (ex.accumulated_stats or 0); Pokerleven.update_spirit_aura(card, C.Fire); if (ex.accumulated_stats or 0) == 0 then card.ability.spirit_used_this_round = false end else Pokerleven.remove_spirit_aura(card) end
    end,
    remove_from_deck = function(self, card, from_debuff)
        local ex = card.ability.extra
        if ex.is_active and (ex.accumulated_levels or 0) > 0 then level_up_hand(card, 'ina_MagicHand', true, -ex.accumulated_levels); ex.is_active = false end
        Pokerleven.remove_spirit_aura(card)
    end,
    calculate = function(self, card, ctx)
        local ex = card.ability.extra
        if Pokerleven.is_joker_turn(ctx) and ctx.scoring_name == 'ina_MagicHand' and G.GAME.magic_hand_variant == 'ina_magic_fire' and ex.is_active then
            local add_st, add_lv = ex.stat_gain * (1 + (ex.tech_level or 0)), 1 + math.floor((ex.tech_level or 0) / 2)
            card.ability.spirit_used_this_round, ex.accumulated_stats, ex.accumulated_levels = true, (ex.accumulated_stats or 0) + add_st, (ex.accumulated_levels or 0) + add_lv
            level_up_hand(card, 'ina_MagicHand', true, add_lv)
            return {message = localize('k_upgrade_ex'), colour = G.C.RED}
        end
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

local Gigante = J({
    name = "Gigante",
    pos = { x = 0, y = 1 },
    config = { extra = { charges = 7, max_charges = 7, reduction_gain = 0.003, accumulated_reduction = 0, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.reduction_gain * (1 + (ex.tech_level or 0)) * 100, (ex.accumulated_reduction or 0) * 100}} end,
    rarity = 2,
    special = "Spirit",
    ptype = C.Mountain,
    techtype = C.UPGRADES.Spirit,
    pools = { ["Spirit"] = true },
    cost = 8,
    atlas = "Spirits01",
    update = function(self, card, dt)
        if not Pokerleven.is_state_changed(card, {Pokerleven.is_spirit_active(card), card.ability.extra.charges}) then return end
        Pokerleven.update_spirit_visuals(card)
    end,
    calculate = function(self, card, ctx)
        local ex, act = card.ability.extra, Pokerleven.is_spirit_active(card) and (card.ability.extra.charges > 0) and not card.debuff
        if act and dc and not ctx.blueprint and (ex.cards_devoured or 0) < (ex.max_devoured or 1) and (dc.ability and dc.ability.mountain_sticker) then
            ex.cards_devoured, card.ability.spirit_used_this_round, ex.accumulated_reduction = (ex.cards_devoured or 0) + 1, true, ex.accumulated_reduction + ex.reduction_gain
            return true
        elseif ctx.after and not ctx.blueprint then ex.cards_devoured = 0
        elseif ctx.setting_blind and not ctx.blueprint and G.GAME.blind:get_type() == 'Boss' and ex.accumulated_reduction > 0 then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2, func = function() G.GAME.blind.chips = math.max(1, math.floor(G.GAME.blind.chips * math.max(0.1, 1 - ex.accumulated_reduction))); G.GAME.blind.chip_text = number_format(G.GAME.blind.chips); G.GAME.blind:wiggle(); play_sound('gong', 0.8, 1.1); card_eval_status_text(card, 'extra', nil, nil, nil, {message = "-" .. math.floor(ex.accumulated_reduction * 100) .. "% Fichas", colour = G.C.RED}); ex.accumulated_reduction = 0; return true end}))
        end
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

local Eris = J({
    name = "Eris",
    pos = { x = 4, y = 7 },
    config = { extra = { charges = 4, max_charges = 4, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) return {vars = {Pokerleven.Universe and Pokerleven.Universe.eris_active and localize("ina_caos") or localize("ina_normal")}} end,
    rarity = 2,
    special = "Spirit",
    ptype = C.Forest,
    techtype = C.UPGRADES.Spirit,
    pools = { ["Spirit"] = true },
    cost = 8,
    atlas = "Spirits01",
    update = function(self, card, dt)
        local act = Pokerleven.is_spirit_active(card) and (card.ability.extra.charges > 0) and not card.debuff
        if act ~= card.ability.eris_active then card.ability.eris_active = act; if Pokerleven.Universe then Pokerleven.Universe.update_eris_state() end end
        if not Pokerleven.is_state_changed(card, {act, card.ability.extra.charges}) then return end; Pokerleven.update_spirit_visuals(card)
    end,
    remove_from_deck = function(self, card, from_debuff) card.ability.eris_active = false; if Pokerleven.Universe then Pokerleven.Universe.update_eris_state() end end,
    calculate = function(self, card, ctx)
        if ctx.end_of_round and ctx.main_eval and not ctx.blueprint and Pokerleven.is_spirit_active(card) and (card.ability.extra.charges > 0) and not card.debuff then
            card.ability.spirit_used_this_round = true
        end
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

local Sombra_de_Plasma_TI = J({
    name = "Sombra_de_Plasma_TI",
    pos = { x = 4, y = 6 },
    config = { extra = { charges = 2, max_charges_plasma = 2, base_mult = 8, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.base_mult * (2 ^ (ex.tech_level or 0))}} end,
    rarity = 2, special = "Spirit", ptype = C.Fire, techtype = C.UPGRADES.Spirit, pools = { ["Spirit"] = true }, cost = 8, atlas = "Spirits01",
    update = function(self, card, dt) Pokerleven.update_spirit_visuals(card) end,
    calculate = function(self, card, ctx)
        local ex, act = card.ability.extra, Pokerleven.is_spirit_active(card) and (card.ability.extra.charges > 0) and not card.debuff
        if act and ctx.other_joker and not ctx.blueprint and ctx.other_joker ~= card then
            if is_position(ctx.other_joker, C.FW) then
                card.ability.spirit_used_this_round = true
                local m = ex.base_mult * (2 ^ (ex.tech_level or 0))
                return {message = localize{type='variable',key='a_mult',vars={m}}, mult_mod = m, colour = G.C.MULT}
            end
        end
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

local Sombra_de_Plasma_RE = J({
    name = "Sombra_de_Plasma_RE",
    pos = { x = 5, y = 6 },
    config = { extra = { charges = 2, max_charges_plasma = 2, base_chips = 8, accumulated_chips = 0, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.base_chips * (2 ^ (ex.tech_level or 0)), ex.accumulated_chips}} end,
    rarity = 2, special = "Spirit", ptype = C.Wind, techtype = C.UPGRADES.Spirit, pools = { ["Spirit"] = true }, cost = 8, atlas = "Spirits01",
    update = function(self, card, dt) Pokerleven.update_spirit_visuals(card) end,
    calculate = function(self, card, ctx)
        local ex, act = card.ability.extra, Pokerleven.is_spirit_active(card) and (card.ability.extra.charges > 0) and not card.debuff
        if ctx.pre_discard and not ctx.blueprint then card.ability.espada_triggered = false end
        if act and ctx.discard and not ctx.blueprint then
            local l_id = 15
            for _, c in ipairs(ctx.full_hand) do if not c.destroyed and c:get_id() < l_id then l_id = c:get_id() end end
            if ctx.other_card:get_id() == l_id and not ctx.other_card.destroyed and not card.ability.espada_triggered then
                card.ability.espada_triggered, card.ability.spirit_used_this_round = true, true
                ex.accumulated_chips = ex.accumulated_chips + (ex.base_chips * (2 ^ (ex.tech_level or 0)))
                return {message = localize("ina_destroy"), colour = G.C.RED, remove = true}
            end
        end
        if act and Pokerleven.is_joker_turn(ctx) and not ctx.blueprint then
            local mf_c = #find_player_position(C.MF)
            if mf_c > 0 and ex.accumulated_chips > 0 then
                local ch = ex.accumulated_chips * mf_c
                return {message = localize{type='variable',key='a_chips',vars={ch}}, chip_mod = ch, colour = G.C.CHIPS}
            end
        end
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

local Sombra_de_Plasma_DF = J({
    name = "Sombra_de_Plasma_DF",
    pos = { x = 6, y = 6 },
    config = { extra = { charges = 2, max_charges_plasma = 2, base_chips = 8, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.base_chips * (2 ^ (ex.tech_level or 0))}} end,
    rarity = 2, special = "Spirit", ptype = C.Mountain, techtype = C.UPGRADES.Spirit, pools = { ["Spirit"] = true }, cost = 8, atlas = "Spirits01",
    update = function(self, card, dt) Pokerleven.update_spirit_visuals(card) end,
    calculate = function(self, card, ctx)
        local ex, act = card.ability.extra, Pokerleven.is_spirit_active(card) and (card.ability.extra.charges > 0) and not card.debuff
        if act and Pokerleven.is_joker_turn(ctx) and not ctx.blueprint then
            local b = G.GAME.current_round.barriers or 0
            if b > 0 then
                card.ability.spirit_used_this_round = true
                local ch = b * ex.base_chips * (2 ^ (ex.tech_level or 0))
                return {message = localize{type='variable',key='a_chips',vars={ch}}, chip_mod = ch, colour = G.C.CHIPS}
            end
        end
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

local Sombra_de_Plasma_PO = J({
    name = "Sombra_de_Plasma_PO",
    pos = { x = 7, y = 6 },
    config = { extra = { charges = 2, max_charges_plasma = 2, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {1 + (7 * (2 ^ (ex.tech_level or 0))) / 10}} end,
    rarity = 2, special = "Spirit", ptype = C.Forest, techtype = C.UPGRADES.Spirit, pools = { ["Spirit"] = true }, cost = 8, atlas = "Spirits01",
    update = function(self, card, dt) Pokerleven.update_spirit_visuals(card) end,
    calculate = function(self, card, ctx)
        local ex, act = card.ability.extra, Pokerleven.is_spirit_active(card) and (card.ability.extra.charges > 0) and not card.debuff
        if act and Pokerleven.is_joker_turn(ctx) and not ctx.blueprint and Pokerleven.is_joker_last_hand(ctx) and G.GAME.chips < G.GAME.blind.chips then
            local gk = #find_player_position(C.GK)
            if gk > 0 then
                card.ability.spirit_used_this_round = true
                local xm = (1 + (7 * (2 ^ (ex.tech_level or 0))) / 10) ^ gk
                return {message = localize{type='variable',key='a_xmult',vars={xm}}, Xmult_mod = xm, colour = G.C.XMULT}
            end
        end
        if ctx.end_of_round and ctx.main_eval and not ctx.blueprint and card.ability.spirit_used_this_round then Pokerleven.modify_charges(card, -1) end
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

return {
    name = "Spirit",
    list = { Majin_Pegasus, Surtur, Gigante, Eris, Sombra_de_Plasma_TI, Sombra_de_Plasma_RE, Sombra_de_Plasma_DF, Sombra_de_Plasma_PO }
}