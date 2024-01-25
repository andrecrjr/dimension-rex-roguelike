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
        phase.generated=false
        phase.gen_itens=false
        enmies:draw()
        phase:gen_map()
        restart=false
    end
end