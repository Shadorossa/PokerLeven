-- Convert cards
conversion_event_helper = function(func, delay, immediate)
    if immediate then
        func()
    else
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = delay or 0.1,
            func = function()
                func()
                return true
            end
        }))
    end
end

convert_cards_to = function(cards, t, noflip, immediate)
    if not cards then return end
    if cards and cards.is and cards:is(Card) then cards = { cards } end
    if not t.seal and not noflip then
        for i = 1, #cards do
            conversion_event_helper(function()
                cards[i]:flip(); cards[i]:juice_up(0.3, 0.3)
            end)
        end
        delay(0.2)
    end
    for i = 1, #cards do
        if t.mod_conv then
            conversion_event_helper(function() cards[i]:set_ability(G.P_CENTERS[t.mod_conv]) end, nil, immediate)
        end
        if t.edition then
            conversion_event_helper(function() cards[i]:set_edition(t.edition, true) end, nil, immediate)
        end
        if t.suit_conv then
            conversion_event_helper(function() cards[i]:change_suit(t.suit_conv) end, nil, immediate)
        end
        if t.seal then
            conversion_event_helper(function() cards[i]:set_seal(t.seal, nil, true) end, nil, immediate)
        end
        if t.random then
            vary_rank(cards[i], nil, nil, immediate)
        end
        if t.set_rank then
            conversion_event_helper(function()
                local new_card = SMODS.change_base(cards[i], nil, t.set_rank)
                if new_card then cards[i] = new_card end
            end, nil, immediate)
        end
        if t.up or t.down then
            vary_rank(cards[i], not t.up, nil, immediate)
        end
        if t.bonus_chips then
            local bonus_add = function()
                cards[i].ability.perma_bonus = cards[i].ability.perma_bonus or 0
                cards[i].ability.perma_bonus = cards[i].ability.perma_bonus + t.bonus_chips
            end
            conversion_event_helper(bonus_add, nil, immediate)
        end
    end
    if not t.seal and not noflip then
        for i = 1, #cards do
            conversion_event_helper(function()
                cards[i]:flip(); cards[i]:juice_up(0.3, 0.3)
            end, 0.2)
        end
    end
    if not noflip then delay(0.3) end
    if noflip then
        for i = 1, #cards do
            conversion_event_helper(function() cards[i]:juice_up(0.3, 0.3) end, 0.2)
        end
    end
    if cards == G.hand.highlighted then
        conversion_event_helper(function() G.hand:unhighlight_all() end)
    end
end

vary_rank = function(card, decrease, seed, immediate)
    -- if it doesn't have a rank/suit within SMODS, don't do anything
    if not card.base or not card.base.value or not card.base.suit or not SMODS.Ranks[card.base.value] then return end

    local next_rank = nil
    if decrease == nil then
        -- randomize rank (decrease is nil)
        local poss_ranks = {}
        for _, v in pairs(G.P_CARDS) do
            if v.suit == card.base.suit then
                table.insert(poss_ranks, v.value)
            end
        end
        if #poss_ranks > 0 then
            next_rank = pseudorandom_element(poss_ranks, pseudoseed(seed or 'random_rank'))
        end
    elseif decrease then
        -- only need to do this due to prev being a bad table (should be fixed in the next update)
        local poss_ranks = {}
        for _, v in pairs(SMODS.Ranks[card.base.value].prev) do
            if SMODS.Ranks[v] and type(SMODS.Ranks[v].next) == "table" then
                for _, _r in pairs(SMODS.Ranks[v].next) do
                    if _r == card.base.value then
                        table.insert(poss_ranks, v)
                        break
                    end
                end
            end
        end
        if #poss_ranks > 0 then
            next_rank = pseudorandom_element(poss_ranks, pseudoseed(seed or 'decrease_rank'))
        end

        -- once prev table is fixed can use this:
        --[[
    if #SMODS.Ranks[card.base.value].prev > 0 then
      next_rank = pseudorandom_element(SMODS.Ranks[card.base.value].prev, pseudoseed(seed or 'decrease_rank'))
    end
    --]]
    else
        if #SMODS.Ranks[card.base.value].next > 0 then
            next_rank = pseudorandom_element(SMODS.Ranks[card.base.value].next, pseudoseed(seed or 'increase_rank'))
        end
    end

    if immediate then
        card = SMODS.change_base(card, nil, next_rank)
    else
        G.E_MANAGER:add_event(Event({
            func = function()
                card = SMODS.change_base(card, nil, next_rank)
                return true
            end
        }))
    end
end

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

--- Get the cards of a suite in played_hand
---@param suite string
---@param hand Card[]|table[]
---@return number
function Pokerleven.get_cards_of_suite(suite, hand)
    local count = 0
    for _, played_card in ipairs(hand) do
        if played_card:is_suit(suite) then
            count = count + 1
        end
    end
    return count
end

---Changes the current barriers. If you use it as a return it will print a message
---@param mod any
---@param instant any
---@return table Loc the message to print on the joker calling this method
function Pokerleven.ease_barriers(mod, instant)
    local function _mod(mod)
        local barrier_UI = G.HUD and G.HUD:get_UIE_by_ID('barrier_text_UI')
        mod = mod or 0
        local text = '+'
        local col = G.ARGS.LOC_COLOURS['mountain']
        if mod < 0 then
            text = '-'
            col = G.C.RED
        end

        G.GAME.current_round.barriers = (G.GAME.current_round.barriers or 0) + mod
        G.GAME.current_round.barriers = math.max(G.GAME.current_round.barriers, 0)

        if barrier_UI and barrier_UI.config and barrier_UI.config.object and barrier_UI.config.object.update then
            barrier_UI.config.object:update()
        end

        G.HUD:recalculate()

        attention_text({
            text = text .. tostring(math.abs(mod)),
            scale = 0.8,
            hold = 0.7,
            cover = barrier_UI and barrier_UI.parent,
            cover_colour = col,
            align = 'cm',
        })

        play_sound('tarot1')
    end

    if instant then
        _mod(mod)
    else
        G.E_MANAGER:add_event(Event({
            trigger = 'immediate',
            func = function()
                _mod(mod)
                return true
            end
        }))
    end
    return {
        message = localize('ina_generate_barriers'),
        colour = G.C.ORANGE
    }
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

local original_unlock_card = unlock_card

function unlock_card(card)
    if card.set == 'Joker' and not card.ptype then
        return
    end
    original_unlock_card(card)
end

Pokerleven.select_random_seal = function(seed)
    return pseudorandom_element(C.SEALS, seed)
end

Pokerleven.set_random_seals_to_highlighted_hand = function(seed)
    for i = 1, #G.hand.highlighted do
        local seal = Pokerleven.select_random_seal(seed)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.1,
            func = function()
                G.hand.highlighted[i]:set_seal(seal, true);
                return true
            end
        }))
    end
end

Pokerleven.get_all_type_pos_combinations = function()
    local combinations = {}
    local c_set = {}
    for _, t in ipairs(C.ALL_TYPES) do
        for _, p in ipairs(C.ALL_POSITIONS) do
            local key = C.INA_UPGRADE_TECHNIQUE_KEY .. t .. "_" .. p
            if #Pokerleven.find_player_type_and_position(t, p) > 0 and not c_set[key] then
                table.insert(combinations, key)
                c_set[key] = true
            end
        end
    end

    return combinations
end

Pokerleven.get_random_type_pos_held = function()
    local combinations = Pokerleven.get_all_type_pos_combinations()
    local selected_combination = pseudorandom_element(combinations, pseudoseed('training'))
    return selected_combination;
end

--- Clona una carta de juego físicamente en la zona indicada
---@param card_to_copy Card
---@param target_area table (G.deck, G.hand, G.play)
---@param count number Cantidad de copias (por defecto 1)
---@return table Lista de las cartas clonadas creadas
Pokerleven.clone_playing_card = function(card_to_copy, target_area, count)
    count = count or 1
    target_area = target_area or G.deck
    local cloned_cards = {}
    for i = 1, count do
        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
        local copy = copy_card(card_to_copy, nil, nil, G.playing_card)
        copy:add_to_deck()
        G.deck.config.card_limit = G.deck.config.card_limit + 1
        table.insert(G.playing_cards, copy)
        target_area:emplace(copy)
        copy:start_materialize()
        table.insert(cloned_cards, copy)
    end
    playing_card_joker_effects({true})
    return cloned_cards
end

--- Comprueba si las dependencias (áreas de cartas o valores) han cambiado desde el último fotograma
---@param card Card
---@param dependencies table Lista de áreas de cartas (G.jokers, G.discard) o valores primitivos (números, strings)
---@return boolean
Pokerleven.is_state_changed = function(card, dependencies)
    local current_hash = ""
    for _, dep in ipairs(dependencies) do
        if type(dep) == 'table' and (dep.cards or (dep[1] and type(dep[1]) == 'table' and dep[1].is)) then
            local list = dep.cards or dep; for _, v in ipairs(list) do current_hash = current_hash .. tostring(v.unique_val) .. (v.debuff and "1" or "0") end
            current_hash = current_hash .. ";"
        else current_hash = current_hash .. tostring(dep) .. ";" end
    end
    current_hash = current_hash .. tostring(card.debuff)
    
    if card.ability.ina_last_state_hash ~= current_hash then
        card.ability.ina_last_state_hash = current_hash
        return true
    end
    return false
end

--- Genera un hash de los jokers ignorando su orden de posición (útil para auras globales que no dependen de adyacencias)
---@param target_type string|nil Opcional. Si se provee, solo evalúa jokers de este tipo.
---@return string
Pokerleven.get_jokers_hash = function(target_type)
    local hash = ""
    if G.jokers and G.jokers.cards then
        local rel = {}
        for _, v in ipairs(G.jokers.cards) do 
            local t = (v.ability.extra and type(v.ability.extra) == 'table' and v.ability.extra.ptype) or ""
            local s_f, s_w, s_fo, s_m = v.ability.fire_sticker, v.ability.wind_sticker, v.ability.forest_sticker, v.ability.mountain_sticker
            if not target_type or (t == target_type) or (target_type == 'Fire' and s_f) or (target_type == 'Wind' and s_w) or (target_type == 'Forest' and s_fo) or (target_type == 'Mountain' and s_m) then
                local s = (s_f and "1" or "0") .. (s_w and "1" or "0") .. (s_fo and "1" or "0") .. (s_m and "1" or "0")
                rel[#rel+1] = tostring(v.unique_val)..(v.debuff and "1" or "0")..t..s
            end
        end
        table.sort(rel); hash = table.concat(rel, ";")
    end
    return hash
end

---Increases the rank of a card infinitely (cycling Ace to 2)
---@param card Card
---@return boolean true if the rank was changed
Pokerleven.rank_up = function(card)
    local next_rank = nil
    local current_rank = card.base.value
    local ranks = { '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace' }

    if current_rank == 'Ace' then
        next_rank = '2'
    else
        for i, r in ipairs(ranks) do
            if r == current_rank then
                next_rank = ranks[i + 1]
                break
            end
        end
    end

    if next_rank then
        G.E_MANAGER:add_event(Event({
            func = function()
                SMODS.change_base(card, nil, next_rank)
                card:juice_up()
                return true
            end
        }))
        return true
    end
    return false
end

-- Coral Protection Hook
local start_dissolve_ref = Card.start_dissolve
function Card:start_dissolve(dissolve_colours, silent, shelf_life, drumroll)
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
