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
        Pokerleven.update_spirit_aura(card, C.Wind)
    end,
    remove_from_deck = function(self, card, from_debuff)
        Pokerleven.remove_spirit_aura(card)
    end,
    calculate = function(self, card, ctx)
        return Pokerleven.manage_spirit_charges(card, ctx)
    end
})

return {
    name = "Spirit",
    list = { Majin_Pegasus }
}