function _update()
    _update_on_game()
end

function _update_on_game()
    plr:updt()
    enmies:follow()
end

function _dead_update()
    if btn(❎) then
        _update=_update_on_game
        _init()
    end
end

