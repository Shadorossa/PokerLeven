SMODS.Shader({ key = 'evolution', path = 'evolution.fs' }):register()

SMODS.DrawStep({
    key = 'evolution',
    order = 71,
    func = function(card, layer)
        if not card.evolution_timer then return end

        card.ARGS.send_to_shader = card.ARGS.send_to_shader or {}
        card.ARGS.send_to_shader[1] = math.min(card.VT.r * 3, 1) + math.sin(G.TIMERS.REAL / 28) + 1 +
            (card.juice and card.juice.r * 20 or 0) + card.tilt_var.amt
        card.ARGS.send_to_shader[2] = G.TIMERS.REAL
        card.ARGS.send_to_shader[3] = card.evolution_timer

        card.children.center:draw_shader('ina_evolution', nil, card.ARGS.send_to_shader)
    end,
    conditions = { vortex = false, facing = 'front' },
})

SMODS.DrawStep({
    key = 'ina_small_sticker',
    order = 90,
    func = function(card, layer)
        if card.ability and card.ability.ina_small_sticker then
            local sticker_key = card.ability.ina_small_sticker
            local sticker = G.shared_stickers[sticker_key]
            if sticker and card.VT and sticker.VT then
                local old_x, old_y, old_r, old_scale = sticker.VT.x, sticker.VT.y, sticker.VT.r, sticker.VT.scale
                
                sticker.VT.x = card.VT.x + card.VT.w/2 - sticker.VT.w/2
                sticker.VT.y = card.VT.y + card.VT.h/2 - sticker.VT.h/2
                sticker.VT.r = card.VT.r
                sticker.VT.scale = card.VT.scale * (card.T.w / G.CARD_W)
                
                sticker:draw_shader('dissolve', nil, nil, true)
                
                sticker.VT.x = old_x
                sticker.VT.y = old_y
                sticker.VT.r = old_r
                sticker.VT.scale = old_scale
            end
        end
    end,
    conditions = { facing = 'front' },
})
