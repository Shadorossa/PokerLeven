-- Archivo de depuración para forzar situaciones específicas de testeo

SMODS.Blind({
    key = "raimon_1v1",
    name = "Raimon 1v1",
    boss = { min = 1, max = 10 },
    boss_colour = HEX("ffa726"),
    mult = 1,
    pos = { x = 0, y = 8 },
    atlas = "bossBlinds",
    set_blind = function(self)
        G.GAME.blind.ai_score = 0
        G.GAME.blind.chips = 1e300
        G.GAME.blind.chip_text = "0"
    end,
    calculate = function(self, blind, ctx)
        local raimon_config = { team_name = "ina_team_Raimon" }
        Pokerleven.play_1v1_turn(blind, ctx, raimon_config)
    end
})

local old_start_run = Game.start_run
function Game:start_run(args)
    old_start_run(self, args)

    -- Forzar el jefe Raimon 1v1 en la ante 1 y al ogro en la 8
    G.GAME.perscribed_bosses = G.GAME.perscribed_bosses or {}
    G.GAME.perscribed_bosses[1] = 'bl_ina_raimon_1v1'
    G.GAME.perscribed_bosses[8] = 'bl_ina_ogre'

    G.E_MANAGER:add_event(Event({
        trigger = 'after', delay = 1.0,
        func = function()
            if G.jokers and not G.GAME.debug_spirit_spawned then
                G.GAME.debug_spirit_spawned = true
                for j = 1, 5 do
                    local card = create_card('Joker', Pokerleven.ina_spirits_area, nil, nil, nil, nil, 'j_ina_Majin_Pegasus')
                    Pokerleven.add_to_spirits(card)
                    for i = 1, 5 do
                        increment_technique(card)
                    end
                end
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
