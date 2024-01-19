function _draw()
    cls(3)
    map()
    plr:draw()
    enmies:draw()
    phase:drop_items()
    phase:gen_map()
    phase:spwn_enemies()
    menu_game()
    if restart==true then
        cls(3)
        plr.x=32
        plr.y=16
        phase.generated=false
        phase.gen_itens=false
        enmies:draw()
        phase:gen_map()
        phase:spwn_enemies()
        phase:drop_items()
        phase:gen_map()
        phase:spwn_enemies()
        restart=false
    end
end