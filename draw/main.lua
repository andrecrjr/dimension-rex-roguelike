function _draw()
    cls(3)
    map()
    plr:draw()
    print(plr.health, 0, 0, 5)
    enmies:draw()
    phase:gen_map()
    phase:drop_items()
end