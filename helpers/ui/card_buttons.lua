local can_select_card_ref = G.FUNCS.can_select_card
G.FUNCS.can_select_card = function(e)
    local card = e.config.ref_table
    if card.ability.set ~= 'Joker' then
        can_select_card_ref(e)
    elseif Pokerleven.is_manager(card) then
        if (card.edition and card.edition.negative) or
            #Pokerleven.ina_manager_area.cards < Pokerleven.ina_manager_area.config.card_limit then
            e.config.colour = G.C.GREEN
            e.config.button = 'use_card'
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    elseif Pokerleven.is_spirit(card) then
        if (card.edition and card.edition.negative) or
            #Pokerleven.ina_spirits_area.cards < Pokerleven.ina_spirits_area.config.card_limit then
            e.config.colour = G.C.GREEN
            e.config.button = 'use_card'
        else
            e.config.colour = G.C.UI.BACKGROUND_INACTIVE
            e.config.button = nil
        end
    else
        can_select_card_ref(e)
    end
end

---Creates button ui for custom cards
---@param card Card Card you want to create buttons on
---@param args table Table of configs for creating custom buttons
---@return table
Pokerleven.create_custom_buttons = function(card, args)
    local args = args or {}
    local sell = nil
    local use = nil
    local bench = nil

    local is_small = Pokerleven.is_manager(card) or Pokerleven.is_spirit(card)
    local s_fac = is_small and 0.55 or 1

    if args.sell then
        sell = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = { ref_table = card, align = "cr", padding = 0.1 * s_fac, r = 0.08, minw = 1.25 * s_fac, hover = true, shadow = true, colour = G.C.UI.BACKGROUND_INACTIVE, one_press = true, button = 'sell_card', func = 'can_sell_card', handy_insta_action = "sell" },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 * s_fac } },
                        {
                            n = G.UIT.C,
                            config = { align = "tm" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 * s_fac },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('b_sell'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4 * s_fac, shadow = true } }
                                    }
                                },
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm" },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = localize('$'), colour = G.C.WHITE, scale = 0.4 * s_fac, shadow = true } },
                                        { n = G.UIT.T, config = { ref_table = card, ref_value = 'sell_cost_label', colour = G.C.WHITE, scale = 0.55 * s_fac, shadow = true } }
                                    }
                                }
                            }
                        }
                    }
                },
            }
        }
    end
    if args.bench or args.unbench then
        bench = {
            n = G.UIT.C,
            config = { align = "cr" },
            nodes = {
                {
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "cr",
                        padding = 0.1 * s_fac,
                        r = 0.08,
                        minw = 1.25 * s_fac,
                        hover = true,
                        shadow = true,
                        colour = G.C.UI.BACKGROUND_INACTIVE,
                        one_press = true,
                        button = args.bench and 'bench_card' or 'unbench_card',
                        func = args.bench and 'can_bench_card' or 'can_unbench_card',
                        handy_insta_action = "use"
                    },
                    nodes = {
                        { n = G.UIT.B, config = { w = 0.1, h = 0.6 * s_fac } },
                        {
                            n = G.UIT.C,
                            config = { align = "cr" },
                            nodes = {
                                {
                                    n = G.UIT.R,
                                    config = { align = "cm", maxw = 1.25 * s_fac },
                                    nodes = {
                                        { n = G.UIT.T, config = { text = args.bench and localize('ina_bench') or localize('ina_unbench'), colour = G.C.UI.TEXT_LIGHT, scale = 0.4 * s_fac, shadow = true } }
                                    }
                                }
                            }
                        }
                    }
                },
            }
        }
    end

    return {
        n = G.UIT.ROOT,
        config = {
            align = "cr",
            padding = 0,
            colour = G.C.CLEAR
        },
        nodes = {
            {
                n = G.UIT.C,
                config = { padding = 0.05, align = 'cl' },
                nodes = {
                    sell and {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { sell }
                    } or nil,
                    bench and {
                        n = G.UIT.R,
                        config = { align = 'cl' },
                        nodes = { bench }
                    } or nil
                }
            }
        }
    }
end
