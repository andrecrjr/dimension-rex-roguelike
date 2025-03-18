
function _skill_draw()
    -- cls()
    -- desenha jogo principal aqui...
    print("Level UP!", 60, 10, 6)
    print("Choose your next Skill", 4, 25, 8)

    rectfill(30, 30, 90, 90, 1)
    rect(30, 30, 90, 90, 15)
    -- itens do menu
    for i, item in ipairs(game_state.menu_items) do
        local color = i == game_state.selected_item and 14 or 7
        print(item.text, 40, 35 + i * 10, color)
    end
end