
function _skill_init()
    -- estado do jogo
    game_state = {
        menu_active = false,
        selected_item = 1,
        menu_items = {
            {text = "item 1", action = function() printh("usou item 1!") 
            end},
            {text = "item 2", action = function() printh("usou item 2!") end},
            {text = "sair", action = function() 
                game_state.menu_active = false 
                game_state.lvl_up=false 
            end}
        },
        action_triggered = false,
        lvl_up = false
    }
end