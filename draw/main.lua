function _draw()
    cls(3)
    map()
    plr:draw()
    enmies:draw()
    phase:gen_map()
    menu_game()
    if restart==true then
        cls(3)
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