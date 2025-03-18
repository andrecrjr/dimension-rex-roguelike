function dead_state_refresh()
    -- update game but init all _init function
    _update=_update_on_game
    -- init all game
    _init()
end

function skill_state_refresh()
    -- update the game with same data
    -- no _init to dont restart all game data
    _update=_update_on_game
    _draw=_draw_main_game
end