local Majin_Pegasus = J({
    name = "Majin_Pegasus",
    pos = { x = 0, y = 0 },
    config = { extra = { charges = 5, max_charges = 5, stat_mult = 1.3, charges_spent = 0, tech_level = 0 } },
    loc_vars = function(self, info_queue, center) local ex = center.ability.extra; return {vars = {ex.charges, ex.max_charges, math.floor((ex.stat_mult - 1) * 100 + 0.5), ex.charges_spent or 0, math.max(1, math.ceil(ex.max_charges * 0.25 * math.max(1, ex.tech_level or 0)))}} end,
    rarity = 2,
    special = "Spirit",
    ptype = C.Wind,
    techtype = C.UPGRADES.Spirit,
    pools = { ["Spirit"] = true },
    cost = 8,
    atlas = "Spirits01",
    update = function(self, card, dt)
        if card.area == Pokerleven.ina_spirits_area then
            Pokerleven.update_spirit_aura(card, C.Wind)
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        Pokerleven.remove_spirit_aura(card)
    end,
    calculate = function(self, card, ctx)
        local ret = Pokerleven.manage_spirit_charges(card, ctx)
        if ret then return ret end
    end
})

return {
    name = "Spirit",
    list = { Majin_Pegasus }
}