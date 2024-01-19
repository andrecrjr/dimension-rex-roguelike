function menu_game()
    rectfill(127, 0, 0, 8, 4)
    rect(40, 0, 48, 8, 2)
    print("♥"..plr.health, 4,  2.2, 14)
    print("lvl "..plr.level, 80, 2.2, 2)
    print("x"..plr.inv.gun.count, 60, 2.2, 2)
    menuitem(1, "status", function() 
        
    end)
end