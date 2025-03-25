function _skill_draw()
    cls()
    -- Title in warm orange
    print("level up!", 48, 8, 9)
    -- Stats in brown
    print("skill points: "..plr.skill_points, 32, 16, 3)
    print("level: "..plr.lvl, 32, 24, 3)
    
    -- Animated border for the menu title in warm colors
    local t = time() * 10
    for i=0,7 do
        local x = 46 + cos(t/100 + i/8) * 4
        local y = 7 + sin(t/100 + i/8) * 2
        pset(x, y, 8 + (i % 4))  -- Using warm colors (8-11)
    end
    
    for i=1,#game_state.menu_items do
        local item = game_state.menu_items[i]
        local y = 24 + i * 10
        local color = 3  -- Default brown color
        
        if i == game_state.selected_item then
            color = 9  -- Warm orange for selected item
            -- Draw selection indicator in warm orange
            print(">", 2, y, 9)
            -- Draw description box in dark brown
            rectfill(8, 100, 120, 110, 3)
            print(item.description, 10, 102, 9)
            
            -- Show additional info for skills
            -- if item.max_level then
            --     print("current level: "..item.level.."/"..item.max_level, 10, 110, 6)
            -- end
        end
        
        -- Draw skill name
        print(item.text, 8, y, color)
        
        -- Draw level indicator if it's a skill
        if item.max_level then
            local level_str = "["
            for l=1,item.max_level do
                level_str ..= l <= item.level and "●" or "○"
            end
            level_str ..= "]"
            print(level_str, 80, y, color)
        end
    end
    
    -- Instructions at the bottom in warm orange
    print("❎ to select", 40, 118, 9)
end