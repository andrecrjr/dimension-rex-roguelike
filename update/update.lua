function _update()
    if game_state.menu_active then
        _lvl_update()
    else
        _update_on_game()
    end
end

function _update_on_game()
    plr:updt()
    enmies:follow()
end

function _dead_update()
    if btn(❎) then
        dead_state_refresh()
    end
end

-- The _lvl_update function is now defined in init/skill.lua
-- This function refreshes the game state after skill menu is closed
function skill_state_refresh()
    _update = _update_on_game
    _draw = _draw_game
end