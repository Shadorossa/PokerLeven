local chaotic_card = SMODS.Enhancement({
    key = "chaotic",
        loc_txt = {
        name = "Carta caótica",
        text = { "Sin efectos",}
    },
    atlas = "enhancements01",
    pos = { x = 0, y = 0 },
    config = {},
    no_suit = true,
    no_rank = true,
    always_scores = true,
    replace_base_card = true,
    loc_vars = function(self, info_queue, center) return {vars = {}} end,
    calculate = function(self, card, ctx)
        local ret = {}
        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do if j.config.center.chaotic_effect and not j.debuff then
                j.config.center.chaotic_effect(j, card, ctx, ret)
            end end
        end
        if ret.remove then card.shattered = true end
        return next(ret) and ret or nil
    end
})
