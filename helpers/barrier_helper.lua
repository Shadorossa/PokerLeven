local game_start_run_ref_buttons = Game.start_run
function Game:start_run(args)
    game_start_run_ref_buttons(self, args)

    G.GAME.ina_show_barriers = G.GAME.ina_show_barriers or false
    G.GAME.current_round.barriers = G.GAME.current_round.barriers or 0
    self.HUD:recalculate()
end

---Shows barriers
G.FUNCS.ina_show_barriers = function(e)
    if G.GAME.current_round.barriers and G.GAME.current_round.barriers > 0 then
        G.GAME.ina_show_barriers = true
    end
    if G.GAME.ina_show_barriers then
        e.states.visible = true
    else
        e.states.visible = false
    end
end
