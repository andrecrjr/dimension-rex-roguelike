function _update()
    -- Check if title screen is active
    if is_title_active() then
        if update_title_screen() then
            return -- Stay on title screen
        end
    end

    -- Normal game update
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
    _draw = _draw_main_game
end

-- This function refreshes the game state after death screen
function dead_state_refresh()
    -- Reset the game state
    _init_game()
    -- Reset the update and draw functions
    _update = _update_on_game
    _draw = _draw_main_game
end