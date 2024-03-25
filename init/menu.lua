function menu_game()
    rectfill(127, 0, 0, 8, 4)
    rect(26, 0, 35, 8, 2)
    spr(plr.inv.gun.spr, 27, 0)
    print("x"..plr.inv.gun.count, 39, 2.2, 2)
    print("♥"..plr.health, 4,  2.2, 14)
    print("lvl "..plr.lvl, 80, 2.2, 2)
    menuitem(1, "stuck!!", function() 
        
    end)
end