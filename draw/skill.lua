function _skill_draw()
    cls()
    print("level up!", 48, 8, 7)
    print("skill points: "..plr.skill_points, 32, 16, 11)
    print("level: "..plr.lvl, 32, 24, 10)
    
    -- Animated border for the menu title
    local t = time() * 10
    for i=0,7 do
        local x = 46 + cos(t/100 + i/8) * 4
        local y = 7 + sin(t/100 + i/8) * 2
        pset(x, y, 8 + (i % 7))
    end
    
    for i=1,#game_state.menu_items do
        local item = game_state.menu_items[i]
        local y = 32 + i * 10
        local color = 7
        
        if i == game_state.selected_item then
            color = 10
            -- Draw selection indicator
            print(">", 2, y, 8 + flr(time() * 8) % 7)
            -- Draw description
            rectfill(8, 100, 120, 110, 1)
            print(item.description, 10, 102, 7)
            
            -- Show additional info for skills
            if item.max_level then
                print("current level: "..item.level.."/"..item.max_level, 10, 110, 6)
            end
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
    
    -- Instructions at the bottom
    print("❎ to select", 40, 118, 5)
end