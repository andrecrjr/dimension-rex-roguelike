function _skill_init()
    -- Game state and skill system
    game_state = {
        menu_active = false,
        selected_item = 1,
        skill_points = 0,
        menu_items = {
            {
                text = "combat mastery",
                level = 0,
                max_level = 5,
                action = function() 
                    if plr.skill_points > 0 then
                        -- More consistent scaling, gets slightly better with each level
                        local level_bonus = 0.12 + (0.03 * game_state.menu_items[1].level)
                        plr.damage_mult = (plr.damage_mult or 1) + level_bonus
                        plr.skill_points -= 1
                        game_state.menu_items[1].level += 1
                        sfx(7) -- Level up sound
                    end
                end,
                description = "increase damage by 12-27%"
            },
            {
                text = "vitality",
                level = 0,
                max_level = 5,
                action = function()
                    if plr.skill_points > 0 then
                        -- More consistent scaling, gets better with each level
                        local health_bonus = 10 + (3 * game_state.menu_items[2].level)
                        plr.max_health += health_bonus
                        plr.health += health_bonus
                        plr.skill_points -= 1
                        game_state.menu_items[2].level += 1
                        sfx(7)
                    end
                end,
                description = "increase max health by 10-25"
            },
            {
                text = "agility",
                level = 0,
                max_level = 5,
                action = function()
                    if plr.skill_points > 0 then
                        -- More consistent scaling, gets better with each level
                        local speed_bonus = 0.15 + (0.03 * game_state.menu_items[3].level)
                        plr.spd += speed_bonus
                        plr.skill_points -= 1
                        game_state.menu_items[3].level += 1
                        sfx(7)
                    end
                end,
                description = "increase movement speed"
            },
            {
                text = "gunslinger",
                level = 0,
                max_level = 5,
                action = function()
                    if plr.skill_points > 0 then
                        -- More consistent scaling - better as you level up
                        local reload_factor = 0.92 - (0.02 * game_state.menu_items[4].level)
                        local ammo_bonus = 2 + game_state.menu_items[4].level
                        plr.inv.gun.reload_speed = (plr.inv.gun.reload_speed or 1) * reload_factor
                        plr.inv.gun.count += ammo_bonus
                        plr.inv.gun.max_count += 2
                        plr.skill_points -= 1
                        game_state.menu_items[4].level += 1
                        sfx(7)
                    end
                end,
                description = "faster reload and more ammo"
            },
            {
                text = "bullet mastery",
                level = 0,
                max_level = 3,
                action = function()
                    if plr.skill_points > 0 then
                        plr.inv.gun.bullet_spread = (plr.inv.gun.bullet_spread or 0) + 1
                        -- Add bonus damage that increases with level
                        local damage_bonus = 1 + game_state.menu_items[5].level
                        plr.inv.gun.damage_bonus = (plr.inv.gun.damage_bonus or 0) + damage_bonus
                        plr.skill_points -= 1
                        game_state.menu_items[5].level += 1
                        sfx(7)
                    end
                end,
                description = "shoot more bullets + damage"
            },
            {
                text = "survivalist",
                level = 0,
                max_level = 3,
                action = function()
                    if plr.skill_points > 0 then
                        -- Add dodge chance that gets better with levels
                        local dodge_bonus = 5 + (2 * game_state.menu_items[6].level)
                        plr.dodge_chance = (plr.dodge_chance or 0) + dodge_bonus
                        -- Small health regen that gets better with levels
                        local regen_bonus = 0.03 + (0.01 * game_state.menu_items[6].level)
                        plr.health_regen = (plr.health_regen or 0) + regen_bonus
                        plr.skill_points -= 1
                        game_state.menu_items[6].level += 1
                        sfx(7)
                    end
                end,
                description = "dodge chance + small regen"
            },
            {
                text = "continue",
                action = function()
                    game_state.menu_active = false
                    game_state.lvl_up = false
                    game_state.action_triggered = false
                    skill_state_refresh()
                end,
                description = "return to game"
            }
        },
        action_triggered = false,
        lvl_up = false
    }
    
    -- Synchronize skill points with player data
    if plr and plr.skill_points then
        game_state.skill_points = plr.skill_points
    else
        -- Initialize if not already done
        plr = plr or {}
        plr.skill_points = plr.skill_points or 0
    end
end

function _skill_draw()
    cls()
    print("level up!", 48, 8, 7)
    print("skill points: "..plr.skill_points, 32, 16, 11)
    
    for i=1,#game_state.menu_items do
        local item = game_state.menu_items[i]
        local y = 24 + i * 12
        local color = 7
        
        if i == game_state.selected_item then
            color = 10
            -- Draw description
            print(item.description, 8, 100, 6)
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
end

function _lvl_update()
    if game_state.menu_active then
        -- Navigation
        if btnp(⬇️) then
            game_state.selected_item += 1
            if game_state.selected_item > #game_state.menu_items then
                game_state.selected_item = 1
            end
            sfx(6)
        end
        
        if btnp(⬆️) then
            game_state.selected_item -= 1
            if game_state.selected_item < 1 then
                game_state.selected_item = #game_state.menu_items
            end
            sfx(6)
        end

        -- Activate selected item (button O or X)
        if (btnp(🅾️) or btnp(❎)) and not game_state.action_triggered then
            local item = game_state.menu_items[game_state.selected_item]
            if item.max_level then
                if item.level < item.max_level then
                    item.action()
                end
            else
                item.action()
            end
            game_state.action_triggered = true
            
            -- Continue should close the menu, but other actions shouldn't
            if game_state.selected_item == #game_state.menu_items then
                game_state.menu_active = false
                skill_state_refresh()
            end
        else
            game_state.action_triggered = false
        end
    end
end