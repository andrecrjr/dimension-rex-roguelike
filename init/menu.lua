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
    
    -- Add menu item to open skills page
    local skill_label = "skills"
    if plr.skill_points and plr.skill_points > 0 then
        skill_label = "skills ("..plr.skill_points..")"
    end
    
    menuitem(2, skill_label, function()
        game_state.menu_active = true
        game_state.selected_item = 1
        _update = _lvl_update
        _draw = _skill_draw
    end)
end