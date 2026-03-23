local Majin_Pegasus = J({
    name = "Majin_Pegasus",
    pos = { x = 0, y = 0 },
    config = { extra = { charges = 5, max_charges = 5, stat_mult = 1.1, charges_spent = 0, tech_level = 0 } },
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

return {
    name = "Spirit",
    list = { Majin_Pegasus, Surtur }
}