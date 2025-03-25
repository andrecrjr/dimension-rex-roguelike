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


function _lvl_update()

    if game_state.menu_active then
        -- navegaれせれこo no menu
        if btnp(⬇️) then
            game_state.selected_item += 1
            if game_state.selected_item > #game_state.menu_items then
                game_state.selected_item = 1
            end
        end
        
        if btnp(⬆️) then
            game_state.selected_item -= 1
            if game_state.selected_item < 1 then
                game_state.selected_item = #game_state.menu_items
            end
        end

        -- ativar item selecionado (botao o)
        if btnp(🅾️) and not game_state.action_triggered then
            local item = game_state.menu_items[game_state.selected_item]
            item.action()
            game_state.action_triggered = true
            game_state.menu_active= not game_state.menu_active
            skill_state_refresh()
        else
            game_state.action_triggered = false
        end

    end
end