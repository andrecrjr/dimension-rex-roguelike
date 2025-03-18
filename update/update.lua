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


function _lvl_update()
    printh("lvl up",game_state.lvl_up)
    if btnp(❎) then -- botれこo x (abre/fecha menu)
        game_state.menu_active = not game_state.menu_active
        game_state.selected_item = 1
    end

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
            print("updated click")
            game_state.action_triggered = true
            game_state.lvl_up=false
            _update=_update_on_game
            _draw=_draw_main_game
        else
            game_state.action_triggered = false
        end

    end
end