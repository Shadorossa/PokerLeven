local zeus = B({
    object_type = "Blind",
    name = "Zeus",
    key = "zeus",
    pos = { x = 0, y = 0 },
    boss = { showdown = true },
    discovered = false,
    mult = 2,
    atlas = "finalBossBlinds",
    order = 1,
    boss_colour = HEX("ffa726"),
    in_pool = function(self)
        if G.GAME.round_resets.ante == 8 then
            return true
        end
        return false
    end,
    calculate = function(self, blind, context)
        if not blind.disabled then
            if context.debuff_hand then
                blind.triggered = false
                if G.GAME.hands[context.scoring_name].level > 1 then
                    blind.triggered = true
                    if not context.check then
                        local level_down = -G.GAME.hands[context.scoring_name].level + 1
                        return {
                            level_up = level_down
                        }
                    end
                end
            end
        end
    end
})

local zeus_caido = B({
    object_type = "Blind",
    name = "ina-zeus_caido",
    key = "zeus_caido",
    pos = { x = 0, y = 1 },
    boss = {
        showdown = true,
    },
    config = { extra_percent = 0.15 },
    discovered = false,
    mult = 2,
    atlas = "finalBossBlinds",
    order = 1,
    boss_colour = HEX("ffa726"),
    collection_loc_vars = function(self)
        return {
            vars = {
                self.config.extra_percent * 100
            },
            key = self.key
        }
    end,
    loc_vars = function(self)
        return {
            vars = {
                self.config.extra_percent * 100
            },
            key = self.key
        }
    end,
    ina_credits = {
        art = { "Shadorossa" }
    },
    drawn_to_hand = function(self)
        G.GAME.blind.chips = G.GAME.blind.chips + G.GAME.blind.chips * self.config.extra_percent
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        play_sound('gong', 0.76, 1.2)
    end,
    in_pool = function(self)
        return G.GAME.round_resets.ante == 16
    end
})

local ogre = B({
    object_type = "Blind",
    name = "ina-ogre",
    key = "ogre",
    pos = { x = 0, y = 6 }, 
    boss = { showdown = true },
    discovered = false,
    mult = 2,
    atlas = "finalBossBlinds",
    order = 3,
    boss_colour = HEX("384654"),
    in_pool = function(self)
        if G.GAME.round_resets.ante == 8 then return pseudorandom('ogre_spawn') < 0.001
        elseif G.GAME.round_resets.ante == 24 then return true end
        return false
    end,
    defeat = function(self)
        if not G.GAME.ogre_defeated then
            G.GAME.ogre_defeated = true
            G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {}
            G.GAME.perscribed_bosses[24] = 'bl_ina_ogre'
        end
    end,
    press_play = function(self)
        if G.GAME.round_resets.ante <= 8 then
            if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do v.ogre_active = false end end
        end
    end,
    recalc_debuff = function(self, card, from_blind)
        if G.GAME.round_resets.ante >= 24 and card.area == G.jokers then
            local r, ex = card.config.center.rarity, card.ability.extra
            if r == 1 or r == 2 or not ex or type(ex) ~= 'table' or not ex.tech_level or ex.tech_level < 1 then return true end
        end
        return false
    end,
    calculate = function(self, blind, ctx)
        if blind.disabled then return end
        if G.GAME.round_resets.ante <= 8 then
            if ctx.discard then
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 1.25)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                G.GAME.blind:wiggle()
                G.E_MANAGER:add_event(Event({func = function() attention_text({text = localize('ina_ogre_discard'), scale = 0.8, hold = 1, cover = G.GAME.blind, cover_colour = G.C.RED, align = 'cm'}); return true end}))
                return
            elseif ctx.after and not ctx.blueprint then
                local des = false
                if G.jokers and G.jokers.cards then
                    for i = #G.jokers.cards, 1, -1 do
                        local v = G.jokers.cards[i]
                        if not v.ogre_active and not v.ability.eternal then
                            v.ogre_idle = (v.ogre_idle or 0) + 1; if v.ogre_idle >= 2 then v:start_dissolve({G.C.RED}, nil, 1.6); des = true end
                        else v.ogre_idle = 0 end
                    end
                end
                if des then G.GAME.blind:wiggle(); G.E_MANAGER:add_event(Event({func = function() attention_text({text = localize('ina_ogre_destroy'), scale = 0.8, hold = 1, cover = G.GAME.blind, cover_colour = G.C.RED, align = 'cm'}); return true end})) end
            end
        elseif G.GAME.round_resets.ante >= 24 then
            if ctx.after and not ctx.blueprint then
                if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do G.GAME.blind:debuff_card(v) end end
                G.GAME.ogre_turn_counter = (G.GAME.ogre_turn_counter or 0) + 1
                if G.GAME.ogre_turn_counter >= 2 then
                    G.GAME.ogre_turn_counter = 0; local l_joker = G.jokers and G.jokers.cards and G.jokers.cards[1]
                    if l_joker and not l_joker.ability.eternal then
                        l_joker:sell_card(); G.GAME.blind:wiggle()
                        G.E_MANAGER:add_event(Event({func = function() attention_text({text = localize('ina_ogre_sell'), scale = 0.8, hold = 1, cover = G.GAME.blind, cover_colour = G.C.RED, align = 'cm'}); return true end}))
                    end
                end
            end
        end
    end,
    loc_vars = function(self)
        if G.GAME and G.GAME.round_resets and G.GAME.round_resets.ante >= 24 then return { key = 'bl_ina_ogre_24' } else return { key = 'bl_ina_ogre_8' } end
    end,
    collection_loc_vars = function(self) return { key = 'bl_ina_ogre_8' } end
})

local destructores = B({
    object_type = "Blind",
    name = "ina-destructores",
    key = "destructores",
    pos = { x = 0, y = 3 }, 
    boss = { showdown = true },
    discovered = false,
    mult = 2,
    atlas = "finalBossBlindsChr",
    order = 5,
    boss_colour = HEX("5C3A21"),
    in_pool = function(self) return G.GAME.round_resets.ante >= 32 end,
    set_blind = function(self)
        if G.jokers and G.jokers.cards then for _, v in ipairs(G.jokers.cards) do
            local ex = v.ability and v.ability.extra
            if ex and type(ex) == 'table' and ex.tech_level and ex.tech_level > 1 then
                local diff = ex.tech_level - 1; ex.tech_level = 1
                for k, tv in pairs(technique_values) do if ex[k] ~= nil and v.config.center.config.extra[k] ~= nil then
                    local r, f = round_value(ex[k] + (v.ability[k .. "_frac"] or 0) - v.config.center.config.extra[k] * tv * diff, k)
                    ex[k], v.ability[k .. "_frac"] = r, f or nil
                end end; clear_stickers(v); set_sticker(v); v:juice_up()
            end
        end end
        G.hand:change_size(-3)
    end,
    disable = function(self) G.hand:change_size(3) end,
    press_play = function(self) Pokerleven.ease_barriers(-math.min(4, G.GAME.current_round.barriers or 0)) end,
    calculate = function(self, blind, ctx)
        if blind.disabled then return end
        if ctx.after and not ctx.blueprint then
            if G.GAME.chips < math.floor(G.GAME.blind.chips * 0.9) then
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 1.25); G.GAME.blind.chip_text = number_format(G.GAME.blind.chips); G.GAME.blind:wiggle()
                G.E_MANAGER:add_event(Event({func = function() attention_text({text = localize('ina_destructores_protect'), scale = 0.8, hold = 1, cover = G.GAME.blind, cover_colour = G.C.RED, align = 'cm'}); return true end}))
            end
        end
    end
})

return {
    name = "Boss Blinds",
    list = { zeus, zeus_caido, ogre, destructores }
}
