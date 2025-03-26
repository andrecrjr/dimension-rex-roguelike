function _draw()
    -- Check if title screen is active
    if is_title_active() then
        draw_title_screen()
        return
    end
    
    _draw=_draw_main_game
end


function _draw_main_game()
    debug=false
    cls(phase.biomes[phase.select].bgcolor)
    menu_game()
    map()
    plr:draw()
    enmies:draw()
    
    phase:gen_map()
    if restart==true then
        phase.biomes.chose=false
        phase:biome_rnd()
        plr.x=32
        plr.y=16
        init_enmies()
        for i = 1, rnd(plr.lvl)+8 do
            enmy = init_enmy()
            enmy:add_enmy(enmies)
        end
        phase.generated=false
        phase.gen_itens=false
        phase:gen_map()
        restart=false
    end
    if debug then
        rect(ptx1, pty1, ptx2, pty2, 6)
    end
end

-- Draw game over screen
function _draw_game_over()
    cls(4) -- Brown background (more western/desert-like)
    
    -- Create pulsing effect for the border
    local t = time()
    local pulse = sin(t/2) * 3 + 5
    
    -- Draw western-style border (wooden frame look)
    rect(10, 20, 118, 108, 9)     -- Darker brown border
    
    
    -- Draw "GAME OVER" in western style with centered text
    print("GAME OVER", 46, 41, 9) -- Shadow
    print("GAME OVER", 45, 40, 7) -- White text
    
    -- Improved spacing for stats text
    print("DIMENSIONS:", 24, 58, 10) -- Yellow like gold
    print("" .. plr.distance_traveled, 94, 58, 10)
    
    -- Change color based on kill count - reddish for bounty hunter feel
    local kill_color = 8
    if plr.kill >= 20 then kill_color = 8     -- Red
    elseif plr.kill >= 10 then kill_color = 9 -- Orange
    elseif plr.kill >= 5 then kill_color = 10 end -- Yellow
    print("ENEMIES KILLED:", 24, 70, kill_color)
    print("" .. plr.kill, 94, 70, kill_color)
    
    -- Change color based on level - dusty colors
    local lvl_color = 6
    if plr.lvl >= 5 then lvl_color = 10  -- Yellow
    elseif plr.lvl >= 3 then lvl_color = 9 -- Orange
    elseif plr.lvl >= 2 then lvl_color = 6 end -- Light blue
    print("LEVEL:", 24, 82, lvl_color)
    print("" .. plr.lvl, 94, 82, lvl_color)
    
    -- Instruction to restart with flickering saloon sign effect - centered
    if sin(t*3) > 0 then
        print("PRESS ❎ TO RETURN TO MENU", 14, 100, 10)
    end
end