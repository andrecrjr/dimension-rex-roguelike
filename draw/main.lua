function _draw()
    cls()
    map()
    plr:draw()
    enmies:draw()
    phase:drop_items()
    phase:gen_map()
    menu_game()
end