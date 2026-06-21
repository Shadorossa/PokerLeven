local game_start_run_ref = Game.start_run
function Game:start_run(args)
    self.ina_manager_area = CardArea(
        0,
        0,
        self.CARD_W * 0.91,
        self.CARD_H * 0.45,
        {
            card_limit = 1,
            type = 'joker',
            highlight_limit = 1,
            card_w = self.CARD_W * 0.45
        }
    )
    Pokerleven.ina_manager_area = G.ina_manager_area

    self.ina_spirits_area = CardArea(
        0,
        0,
        self.CARD_W * 2.3,
        self.CARD_H * 0.45,
        {
            card_limit = 5,
            type = 'joker',
            highlight_limit = 1,
            card_w = self.CARD_W * 0.45
        }
    )
    G.ina_spirits_area = self.ina_spirits_area
    Pokerleven.ina_spirits_area = G.ina_spirits_area

    self.ina_bench_area = CardArea(
        0,
        0,
        self.CARD_W * 3.6,
        self.CARD_H * 0.95,
        {
            card_limit = 3,
            type = 'joker',
            highlight_limit = 1
        }
    )
    Pokerleven.ina_bench_area = G.ina_bench_area

    self.fedora_void = CardArea(
        -100, -100, 1, 1,
        {
            card_limit = 500,
            type = 'deck',
            highlight_limit = 0,
        }
    )
    G.fedora_void = self.fedora_void

    game_start_run_ref(self, args)

    Pokerleven.set_base_rarities(0.69, 0.25, 0.05)

    Pokerleven.ina_spirits_uibox = UIBox {
        definition = Pokerleven.create_UIBox_spirits_area(),
        config = {
            align = 'bm',
            offset = { x = 1.25, y = 0.1 },
            major = self.jokers,
            bond = 'Weak'
        } }

    self.ina_extra_buttons = UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                padding = 0.05,
                colour = G.C.CLEAR
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        align = "cm",
                        minw = 0.6,
                        minh = 0.6,
                        padding = 0.05,
                        r = 0.1,
                        hover = true,
                        colour = G.ARGS.LOC_COLOURS and G.ARGS.LOC_COLOURS["bench"] or HEX("4ca0a5"),
                        shadow = true,
                        button = "ina_open_bench",
                        func = "ina_show_bench",
                        draw_layer = 1,
                    },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = "B",
                                scale = 0.45,
                                colour = G.C.UI.TEXT_LIGHT
                            }
                        },
                    }
                },
            }
        },
        config = {
            align = "cr",
            offset = { x = 0.15, y = -0.4 },
            major = self.jokers,
            bond = 'Weak'
        }
    }

    self.ina_extra_buttons_f = UIBox {
        definition = {
            n = G.UIT.ROOT,
            config = {
                align = "cm",
                padding = 0.05,
                colour = G.C.CLEAR
            },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        align = "cm",
                        minw = 0.6,
                        minh = 0.6,
                        padding = 0.05,
                        r = 0.1,
                        hover = true,
                        colour = HEX("1b5e20"), -- Field green or a soccer theme colour
                        shadow = true,
                        button = "ina_formation_btn",
                        draw_layer = 1,
                    },
                    nodes = {
                        {
                            n = G.UIT.T,
                            config = {
                                text = "F",
                                scale = 0.45,
                                colour = G.C.UI.TEXT_LIGHT
                            }
                        },
                    }
                }
            }
        },
        config = {
            align = "cr",
            offset = { x = 0.15, y = 0.4 },
            major = self.jokers,
            bond = 'Weak'
        }
    }
    self.HUD:recalculate()

    Pokerleven.ina_manager_uibox = UIBox {
        definition = Pokerleven.create_UIBox_manager_area(),
        config = {
            align = 'cl',
            offset = { x = -0.2, y = 0 },
            major = self.ina_spirits_area,
            bond = 'Weak'
        } }

    self.ina_bench = UIBox {
        definition = Pokerleven.create_UIBox_bench_area(),
        config = {
            align = 'tli',
            offset = { x = 0, y = -5 },
            major = self.jokers,
            bond = 'Weak',
            instance_type = "CARD" },
    }

    self.ina_bench.states.visible = false
    G.GAME.ina_show_bench = G.GAME.ina_show_bench or false

    Pokerleven.bench_open = false
    Pokerleven.bench_forced = false

    LeakScope.snap("start_run")
end

Pokerleven.create_UIBox_bench_area = function()
    local t = {
        n = G.UIT.ROOT,
        config = { align = 'cm', r = 0.1, colour = G.C.CLEAR, padding = 0 },
        nodes = {
            {
                n = G.UIT.O,
                config = {
                    object = Pokerleven.ina_bench_area,
                }
            },
        }
    }
    return t
end

Pokerleven.create_UIBox_manager_area = function()
    return {
        n = G.UIT.ROOT,
        config = { align = 'cm', r = 0.1, colour = G.C.CLEAR, padding = 0.2 },
        nodes = {
            {
                n = G.UIT.O,
                config = {
                    object = Pokerleven.ina_manager_area,
                    draw_layer = 1
                }
            },
        }
    }
end

Pokerleven.create_UIBox_spirits_area = function()
    return {
        n = G.UIT.ROOT,
        config = { align = 'cm', r = 0.1, colour = G.C.CLEAR, padding = 0.1 },
        nodes = {
            {
                n = G.UIT.O,
                config = {
                    object = Pokerleven.ina_spirits_area,
                    draw_layer = 1
                }
            },
        }
    }
end

---Opens Bench area
G.FUNCS.ina_open_bench = function(e)
    Pokerleven.open_bench(true, not G.ina_bench.states.visible)
end

---Shows bench button
G.FUNCS.ina_show_bench = function(e)
    if Pokerleven.ina_bench_area and #Pokerleven.ina_bench_area.cards > 0 then
        G.GAME.ina_show_bench = true
    end
    if G.GAME.ina_show_bench then
        e.states.visible = true
    else
        e.states.visible = false
    end
end
G.FUNCS.ina_show_bench_button = G.FUNCS.ina_show_bench

---Open the bench
---@param forced? boolean
---@param open? boolean
---@param delay_close? boolean
Pokerleven.open_bench = function(forced, open, delay_close)
    if open and not Pokerleven.bench_open then
        Pokerleven.bench_open = true
        Pokerleven.bench_forced = Pokerleven.bench_forced or forced and true
        G.E_MANAGER:add_event(Event({
            blockable = false,
            func = function()
                G.jokers.states.visible = false
                G.ina_bench.states.visible = true
                G.ina_bench.alignment.offset.y = 0
                return true
            end
        }))
        LeakScope.snap("open_bench")
    elseif not open and (not Pokerleven.bench_forced or forced) and Pokerleven.bench_open then
        Pokerleven.bench_open = false
        Pokerleven.bench_forced = false
        G.E_MANAGER:add_event(Event({
            blockable = false,
            trigger = "after",
            delay = 0.15 + (delay_close or 0),
            func = function()
                G.E_MANAGER:add_event(Event({
                    trigger = "ease",
                    delay = 0.5,
                    ref_table = G.ina_bench.alignment.offset,
                    ref_value = "y",
                    ease_to = -5,
                }))
                G.E_MANAGER:add_event(Event({
                    blockable = false,
                    trigger = "after",
                    delay = 0.5,
                    func = function()
                        G.jokers.states.visible = true
                        G.ina_bench.alignment.offset.y = -5
                        G.ina_bench.states.visible = false
                        Pokerleven.ina_bench_area:unhighlight_all()
                        return true
                    end
                }))
                return true
            end
        }))
        LeakScope.snap("close_bench")
    end
end

local remove_from_area_ref = CardArea.remove_card
function CardArea:remove_card(card, ...)
    if card and card.children and card.children.use_button then
        card.children.use_button.config.parent = nil
        card.children.use_button:remove()
        card.children.use_button = nil
    end
    return remove_from_area_ref(self, card, ...)
end

local card_remove_from_area_ref = Card.remove_from_area
function Card:remove_from_area()
    if self.area == Pokerleven.ina_bench_area and
        self.edition and self.edition.card_limit then
        Pokerleven.ina_bench_area.config.card_limit =
            Pokerleven.ina_bench_area.config.card_limit - (self.edition.card_limit - 1)
        if Pokerleven.ina_bench_area.config.card_limit < 1 then
            Pokerleven.ina_bench_area.config.card_limit = 1
        end
    end
    card_remove_from_area_ref(self)
end

local cardarea_align_cards_ref = CardArea.align_cards
function CardArea:align_cards()
    cardarea_align_cards_ref(self)
    if self == Pokerleven.ina_manager_area or self == Pokerleven.ina_spirits_area then
        for _, card in ipairs(self.cards) do
            local diff_w = card.T.w - G.CARD_W * 0.45
            card.T.w = G.CARD_W * 0.45
            card.T.h = G.CARD_H * 0.45
            card.T.x = card.T.x + 0.5 * diff_w
            card.T.y = self.T.y + 0.5*self.T.h - 0.5*card.T.h

            if card.children.center then card.children.center.T.w, card.children.center.T.h = card.T.w, card.T.h end
            if card.children.front then card.children.front.T.w, card.children.front.T.h = card.T.w, card.T.h end
            if card.children.back then card.children.back.T.w, card.children.back.T.h = card.T.w, card.T.h end
            if card.ability and card.ability.extra and type(card.ability.extra) == 'table' and (card.ability.extra.tech_level or 0) > 0 then
                if set_sticker then set_sticker(card) end
            end
        end
    elseif self == Pokerleven.ina_bench_area then
        self.T.w = G.jokers.T.w
    end
end

---Returns true if card is a manager
---@param card Card joker to deliberate if it's a manager
Pokerleven.is_manager = function(card)
    return card.ability and
        type(card.ability.extra) == "table" and
        card.ability.extra.special == "Manager"
end


---Adds card to managers area
---@param card table|Card|true card to add to the manager area
Pokerleven.add_to_managers = function(card)
    if card.edition and card.edition.card_limit then
        Pokerleven.ina_manager_area.config.card_limit = Pokerleven.ina_manager_area.config.card_limit +
            card.edition.card_limit
    end

    card.T.w = G.CARD_W * 0.45
    card.T.h = G.CARD_H * 0.45

    Pokerleven.ina_manager_area:emplace(card)
    card:add_to_deck()

    if card.children.center then card.children.center.T.w, card.children.center.T.h = card.T.w, card.T.h end
    if card.children.front then card.children.front.T.w, card.children.front.T.h = card.T.w, card.T.h end
    if card.children.back then card.children.back.T.w, card.children.back.T.h = card.T.w, card.T.h end
end

---Returns true if card is a spirit
---@param card Card joker to deliberate if it's a spirit
Pokerleven.is_spirit = function(card)
    return card.ability and
        type(card.ability.extra) == "table" and
        card.ability.extra.special == "Spirit"
end

---Adds card to spirits area
---@param card table|Card|true card to add to the spirits area
Pokerleven.add_to_spirits = function(card)
    if card.edition and card.edition.card_limit then
        Pokerleven.ina_spirits_area.config.card_limit = Pokerleven.ina_spirits_area.config.card_limit +
            card.edition.card_limit
    end

    card.T.w = G.CARD_W * 0.45
    card.T.h = G.CARD_H * 0.45

    Pokerleven.ina_spirits_area:emplace(card)
    card:add_to_deck()

    if card.children.center then card.children.center.T.w, card.children.center.T.h = card.T.w, card.T.h end
    if card.children.front then card.children.front.T.w, card.children.front.T.h = card.T.w, card.T.h end
    if card.children.back then card.children.back.T.w, card.children.back.T.h = card.T.w, card.T.h end
end

---Adds card to bench area
---@param card table|Card|true card to add to the bench area
Pokerleven.add_to_bench = function(card)
    if card.edition and card.edition.card_limit then
        Pokerleven.ina_bench_area.config.card_limit = Pokerleven.ina_bench_area.config.card_limit +
            card.edition.card_limit - 1
    end
    if (#Pokerleven.ina_bench_area.cards < Pokerleven.ina_bench_area.config.card_limit or card.edition and card.edition.negative) then
        Pokerleven.ina_bench_area:emplace(card)
    end
end

-- Hook for new buttons on jokers / cards
local card_highlight_ref = Card.highlight
function Card:highlight(is_highlighted)
    if self.area and self.area.config.type == "joker"
        and self.area ~= G.consumeables
        and (self.area == G.jokers
            or self.area == Pokerleven.ina_bench_area
            or self.area == Pokerleven.ina_manager_area
            or self.area == Pokerleven.ina_spirits_area) then
        self.highlighted = is_highlighted

        if self.highlighted then
            if self.children.use_button then
                self.children.use_button.config.parent = nil
                self.children.use_button:remove()
                self.children.use_button = nil
            end

            local params = {}
            if Pokerleven.is_manager(self) then
                params.sell = true
            elseif Pokerleven.is_spirit(self) then
                params.sell = true
            elseif self.area ~= G.ina_bench_area then
                params.sell = true
                params.bench = true
            else
                params.sell = true
                params.unbench = true
            end

            local x_off = (Pokerleven.is_manager(self) or Pokerleven.is_spirit(self)) and -0.15 or -0.4

            self.children.use_button = UIBox {
                definition = Pokerleven.create_custom_buttons(self, params),
                config = {
                    align = "cr",
                    offset = { x = x_off, y = 0 },
                    parent = self,
                }
            }
        else
            if self.children.use_button then
                self.children.use_button.config.parent = nil
                self.children.use_button:remove()
                self.children.use_button = nil
            end
        end
    else
        card_highlight_ref(self, is_highlighted)
    end
end

G.FUNCS.can_toggle_bench_card = function(e, area, button_name, active_colour)
    local card = e.config.ref_table
    if (area.config.card_count >= area.config.card_limit and not (card.edition and card.edition.negative))
        or (G.hand and G.GAME.blind.in_blind) or (card.debuff) or card.ability.eternal then
        e.config.colour = G.C.UI.BACKGROUND_INACTIVE
        e.config.button = nil
        return false
    else
        e.config.colour = active_colour
        e.config.button = button_name
        return true
    end
end

G.FUNCS.can_bench_card = function(e)
    return G.FUNCS.can_toggle_bench_card(e, G.ina_bench_area, 'bench_card', G.ARGS.LOC_COLOURS['bench'])
end

G.FUNCS.can_unbench_card = function(e)
    return G.FUNCS.can_toggle_bench_card(e, G.jokers, 'unbench_card', G.C.ORANGE)
end

local change_bobby_sprites_if_needed = function(card, new_card)
    if card.config.center_key == 'j_ina_Bobby' then
        local coords = C.CUSTOM.Bobby_Teams[card.ability.extra.pteam]
        new_card.children.center:set_sprite_pos({ x = coords.x, y = coords.y })
    end
end

G.FUNCS.toggle_bench_card = function(e, add_func, open_bench_flag)
    local card = e.config.ref_table

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            play_sound('other1')
            card:juice_up(0.3, 0.4)
            return true
        end
    }))

    change_bobby_sprites_if_needed(card, card)

    -- G.GAME.used_jokers[card.config.center.key] = true

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            G.jokers:remove_card(card)
            card:remove_from_deck()
            add_func(card)

            Pokerleven.open_bench(true, open_bench_flag)
            return true
        end
    }))
end

G.FUNCS.bench_card = function(e)
    G.FUNCS.toggle_bench_card(e, Pokerleven.add_to_bench, true)
end

G.FUNCS.unbench_card = function(e)
    local card = e.config.ref_table

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            play_sound('other1')
            card:juice_up(0.3, 0.4)
            return true
        end
    }))

    change_bobby_sprites_if_needed(card, card)

    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            card:add_to_deck()
            Pokerleven.ina_bench_area:remove_card(card)
            G.jokers:emplace(card)
            Pokerleven.open_bench(true, false)
            return true
        end
    }))

    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.25,
        func = function()
            return true
        end
    }))
end
