function menu_game()
    rectfill(127, 0, 0, 8, 4)
    rect(26, 0, 35, 8, 2)
    spr(plr.inv.gun.spr, 27, 0)
    print("x"..plr.inv.gun.count, 39, 2.2, 2)
    print("♥"..plr.health, 4,  2.2, 14)
    print("lvl "..plr.lvl, 80, 2.2, 2)
    -- Show current bullet type
    local type_colors = {normal=7, spread=9, wave=12, homing=8}
    print(plr.inv.gun.current_type, 52, 2.2, type_colors[plr.inv.gun.current_type])
    menuitem(1, "stuck!!", function() 
        
    end)
end