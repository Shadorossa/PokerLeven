-- CUSTOM PROBABILITIES HOOK
local original_get_probability_vars = SMODS.get_probability_vars
function SMODS.get_probability_vars(trigger_obj, base_numerator, base_denominator, identifier, from_roll)
    if identifier == "lucky_mult" then
        return G.GAME.probabilities.normal, 5
    elseif identifier == "lucky_money" then
        local lucky = G.GAME.probabilities.new_lucky or G.GAME.probabilities.normal
        return lucky, 15
    elseif identifier == "glass" then
        local glass = G.GAME.probabilities.new_glass_denom or 4
        return G.GAME.probabilities.normal, glass
    end
    return original_get_probability_vars(trigger_obj, base_numerator, base_denominator, identifier, from_roll)
end

-- * Strat cards used on run counter
local original_card_use = Card.use_consumeable
function Card:use_consumeable(area, copier)
    if self.ability.set == "Strat" then
        G.GAME.strat_cards_used = (G.GAME.strat_cards_used or 0) + 1
    end
    return original_card_use(self, area, copier)
end

-- Sael Double Shop Hook
local exit_shop_ref = G.FUNCS.exit_shop
G.FUNCS.exit_shop = function(e)
    if G.GAME and G.GAME.ina_sael_active then
        G.GAME.ina_sael_active = false

        -- Logic to skip the blind but enter shop again
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                -- Skip the next blind (Small Blind)
                if G.GAME.blind_on_deck == 'Small' then
                    G.FUNCS.skip_blind()
                    -- Force back to shop for the "double shop"
                    G.STATE = G.STATES.SHOP
                    G.GAME.shop:recalculate()
                end
                return true
            end
        }))
    else
        exit_shop_ref(e)
    end
end

-- Gaiel Auto-Skip Hook
local function do_gaiel_victory(gaiel, sb_chips, e)
    if G.ina_gaiel_skipping then return end
    G.ina_gaiel_skipping = true

    G.GAME.gaiel_savings = G.GAME.gaiel_savings - sb_chips

    G.E_MANAGER:add_event(Event({
        func = function()
            -- Etiqueta x2: Damos una doble para que el skip nativo sea doble
            add_tag(Tag('tag_double'))

            -- Generar 2 Espectrales Negativas
            for i = 1, 2 do
                local card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'gaiel')
                card:set_edition('e_negative', true)
                card:add_to_deck()
                G.consumeables:emplace(card)
            end

            gaiel:juice_up(0.8, 0.8)
            play_sound('timpani')

            -- Llamar al skip nativo para la transición
            G.FUNCS.skip_blind(e)

            G.ina_gaiel_skipping = nil
            return true
        end
    }))
end

local select_blind_ref = G.FUNCS.select_blind
G.FUNCS.select_blind = function(e)
    if G.GAME and G.GAME.blind_on_deck == 'Small' and not G.ina_gaiel_skipping then
        local gaiel = get_joker_with_key('j_ina_Gaiel')
        if gaiel and not gaiel.debuff then
            local savings = G.GAME.gaiel_savings or 0
            local ante = G.GAME.ante or 1
            local factor = (G.GAME.stack_vars and G.GAME.stack_vars.small_blind_amount) or 1
            local amount = get_blind_amount(ante)
            local sb_chips = (type(amount) == 'number' and type(factor) == 'number') and (amount * factor) or 0

            if sb_chips > 0 and savings >= sb_chips then
                do_gaiel_victory(gaiel, sb_chips, e)
                return
            end
        end
    end
    if select_blind_ref then select_blind_ref(e) end
end

local skip_blind_ref = G.FUNCS.skip_blind
G.FUNCS.skip_blind = function(e)
    if G.GAME and G.GAME.blind_on_deck == 'Small' and not G.ina_gaiel_skipping then
        local gaiel = get_joker_with_key('j_ina_Gaiel')
        if gaiel and not gaiel.debuff then
            local savings = G.GAME.gaiel_savings or 0
            local ante = G.GAME.ante or 1
            local factor = (G.GAME.stack_vars and G.GAME.stack_vars.small_blind_amount) or 1
            local amount = get_blind_amount(ante)
            local sb_chips = (type(amount) == 'number' and type(factor) == 'number') and (amount * factor) or 0

            if sb_chips > 0 and savings >= sb_chips then
                do_gaiel_victory(gaiel, sb_chips, e)
                return
            end
        end
    end
    if skip_blind_ref then skip_blind_ref(e) end
end

local original_unlock_card = unlock_card

function unlock_card(card)
    if card.set == 'Joker' and not card.ptype then
        return
    end
    original_unlock_card(card)
end

-- Coral Protection Hook
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, shelf_life, drumroll)
    local athena_active = false
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            if j.config.center.key == 'j_ina_Athena' and not j.debuff and j.ability.extra and j.ability.extra.time_frozen then
                athena_active = true
                break
            end
        end
    end
    if athena_active then
        self:juice_up()
        return
    end

    local coral = get_joker_with_key('j_ina_Coral')
    if coral and not coral.debuff and (self.edition or self.seal) then
        self:juice_up()
        return
    end
    start_dissolve_ref(self, dissolve_colours, silent, shelf_life, drumroll)
end

-- Kayson Blind Reduction Hook
local set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    set_blind_ref(self, blind, reset, silent)
    if G.GAME and G.GAME.kayson_next_reduction and G.GAME.kayson_next_reduction > 0 then
        self.chips = math.floor(self.chips * (1 - G.GAME.kayson_next_reduction))
        self.chip_text = number_format(self.chips)
        G.GAME.kayson_next_reduction = 0
    end
end

-- Color Joker Hook: Detect Spectral card usage
local use_consumeable_ref = Card.use_consumeable
function Card:use_consumeable(area, copier)
    if self.config.center.key == 'c_sigil' then
        G.ina_color_force_suit = true
    end
    local res = use_consumeable_ref(self, area, copier)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        func = function()
            G.ina_color_force_suit = nil
            return true
        end
    }))
    return res
end

-- Color Joker Hook: Force suit changes ONLY for random spectral effects
local change_base_ref = SMODS.change_base
function SMODS.change_base(card, suit, rank)
    local color = get_joker_with_key('j_ina_Color')
    if color and not color.debuff and suit and G.GAME and G.GAME.ina_color_suit and G.ina_color_force_suit then
        suit = G.GAME.ina_color_suit
    end
    return change_base_ref(card, suit, rank)
end

local c_card_ref = create_card
function create_card(type, area, skip_mat, edit, apply, seed, proto, genes)
    if type == 'Tarot' and area == G.pack_cards and (not area.cards or #area.cards == 0) then
        local bamboo = get_joker_with_key('j_ina_Bamboo')
        if bamboo and not bamboo.debuff then proto = G.P_CENTERS['c_fool']; sendDebugMessage("Bamboo forced Fool") end
    end

    local card = c_card_ref(type, area, skip_mat, edit, apply, seed, proto, genes)
    return card
end

-- Athena: Hook ease_chips to prevent scoreboard increase during time freeze
local original_ease_chips = ease_chips
function ease_chips(mod)
    local athena_active = false
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            if j.config.center.key == 'j_ina_Athena' and not j.debuff and j.ability.extra and j.ability.extra.time_frozen then
                athena_active = true
                break
            end
        end
    end
    if athena_active then
        return
    end
    original_ease_chips(mod)
end

-- Athena: Hook Game.update to reset time freeze once the hand scoring resolves and selecting resumes
local original_game_update = Game.update
function Game.update(self, dt)
    original_game_update(self, dt)
    if G.STATE == G.STATES.SELECTING_HAND then
        if G.jokers and G.jokers.cards then
            for _, j in ipairs(G.jokers.cards) do
                if j.config.center.key == 'j_ina_Athena' and j.ability.extra and j.ability.extra.time_frozen then
                    j.ability.extra.time_frozen = false
                end
            end
        end
    end
end

-- Main menu (Stolen from Cryptid)
local game_main_menu_ref = Game.main_menu
function Game:main_menu(change_context)
    local ret = game_main_menu_ref(self, change_context)

    G.SPLASH_BACK:define_draw_steps({
        {
            shader = "splash",
            send = {
                { name = "time",       ref_table = G.TIMERS, ref_value = "REAL_SHADER" },
                { name = "vort_speed", val = 0.4 },
                { name = "colour_1",   val = HEX("5A00FF"),  ref_value = "EFFECT" },
                { name = "colour_2",   ref_table = G.C,      ref_value = "BLACK" },
            },
        },
    })

    return ret
end

-- Thaddeus Bellefax reversion: counts down each round-end and reverts the card
local card_calculate_joker_ref = Card.calculate_joker
function Card:calculate_joker(context)
    local res = card_calculate_joker_ref(self, context)

    if context.end_of_round and context.main_eval and self.thaddeus_transform and not context.blueprint then
        self.thaddeus_transform.blinds_remaining = self.thaddeus_transform.blinds_remaining - 1
        if self.thaddeus_transform.blinds_remaining <= 0 then
            local data = self.thaddeus_transform
            self:set_ability(G.P_CENTERS[data.original_key])
            if self.ability and self.ability.extra then
                self.ability.extra.used_transform = true
                self.ability.fw_sticker = false
                self.ability.mf_sticker = false
                self.ability.df_sticker = false
                self.ability.gk_sticker = false
            end
            self.thaddeus_transform = nil
            card_eval_status_text(self, 'extra', nil, nil, nil, { message = "Reversión", colour = G.C.BLUE })
            Pokerleven.refresh_concept_boosts("ZEUS", data.stat_boost, "THADDEUS")
        end
    end

    return res
end

-- Propagate set_cost to jokers so they can react (e.g. Xavier)
local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    if G.jokers and G.jokers.cards then
        for _, j in ipairs(G.jokers.cards) do
            j:calculate_joker({ set_cost = true, card = self })
        end
    end
end
