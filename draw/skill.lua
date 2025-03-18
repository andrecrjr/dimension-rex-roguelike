function _skill_draw()

    local rect_x0 = 10  -- Coordenada x inicial (mais à esquerda)
    local rect_y0 = 15  -- Coordenada y inicial (mais acima)
    local rect_x1 = 116 -- Coordenada x final (mais à direita)
    local rect_y1 = 105 -- Coordenada y final (mais abaixo)
    rectfill(rect_x0, rect_y0, rect_x1, rect_y1, 4)  -- Retângulo maior e centralizado
    rect(rect_x0, rect_y0, rect_x1, rect_y1, 15)     -- Borda do retângulo
    print("Level UP!", 46, 20, 6)  -- Centralizado horizontalmente e posicionado no topo do retângulo
    print("Choose your next Skill", 20, 30, 10)  -- Ajustado para ficar acima dos itens do menu

    for i, item in ipairs(game_state.menu_items) do
        local color = i == game_state.selected_item and 14 or 7
        print(item.text, 40, 45 + i * 10, color)  -- Posiciona os itens dentro do menu
    end
end