
function _skill_draw()
    -- cls()
    -- desenha jogo principal aqui...
    print("Level UP!", 50, 10, 7)
    print("press O to Open Skill Page", 4, 10, 7)

    -- desenha menu se estiver ativo
    if game_state.menu_active then
        -- fundo do menu
        rectfill(30, 30, 90, 90, 1)
        rect(30, 30, 90, 90, 15)
        
        -- itens do menu
        for i, item in ipairs(game_state.menu_items) do
            local color = i == game_state.selected_item and 14 or 7
            print(item.text, 40, 35 + i * 10, color)
        end
    end
end