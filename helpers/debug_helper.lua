-- Archivo de depuración para forzar situaciones específicas de testeo

local old_start_run = Game.start_run
function Game:start_run(args)
    old_start_run(self, args)
    G.E_MANAGER:add_event(Event({
        trigger = 'after', delay = 1.0,
        func = function()
            if G.jokers and not G.GAME.debug_spirit_spawned then
                G.GAME.debug_spirit_spawned = true
                local card = create_card('Joker', Pokerleven.ina_spirits_area, nil, nil, nil, nil, 'j_ina_Majin_Pegasus')
                Pokerleven.add_to_spirits(card)
            end
            return true
        end
    }))
end

-- Rerolls gratis en la tienda
local old_calculate_reroll_cost = calculate_reroll_cost
function calculate_reroll_cost(skip_increment)
    old_calculate_reroll_cost(skip_increment)
    if G.GAME and G.GAME.current_round then
        G.GAME.current_round.reroll_cost = 0
    end
end
