
function _draw()
    _draw=_draw_main_game
end


function _draw_main_game()
    cls()
    debug=false
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
end