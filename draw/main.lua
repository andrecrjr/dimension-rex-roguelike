function _draw()
    cls(phase.biomes[phase.select].bgcolor)
    map()
    plr:draw()
    enmies:draw()
    phase:gen_map()
    menu_game()
    if restart==true then
        phase:biome_rnd()
        phase.biomes.chose=false
        plr.x=32
        plr.y=16
        for i = 1, rnd(plr.lvl)+8 do
            enmy = init_enmy()
            enmy:add_enmy(enmies)
        end
        phase.generated=false
        phase.gen_itens=false
        phase:gen_map()
        restart=false
    end
end