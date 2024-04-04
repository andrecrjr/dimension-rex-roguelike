function _draw()
    debug=true
    cls(phase.biomes[phase.select].bgcolor)
    menu_game()
    map()
    plr:draw()
    enmies:draw()
    phase:gen_map()
    if restart==true then
        phase.biomes.chose=false
        phase:biome_rnd()
        plr.x=32
        plr.y=16
        init_enmies()
        for i = 1, rnd(plr.lvl)+8 do
            enmy = init_enmy()
            enmy:add_enmy(enmies)
        end
        phase.generated=false
        phase.gen_itens=false
        phase:gen_map()
        restart=false
    end
    if debug then
        rect(ptx1, pty1, ptx2, pty2, 6)
    end
    if skill_draw_upt then
        _draw=_skill_draw

    end
end

function _skill_draw()
    for i, skill in ipairs(skills) do
        if i == selected_skill then
            -- Destaca a habilidade selecionada
            print(">"..skill, 23, 20, 9)
        else
            print(skill.."-  - press ", 23, 35 * i, 9)
        end
    end
end