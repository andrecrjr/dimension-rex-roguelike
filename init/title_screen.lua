-- Title screen for Dimension Rex
-- Press X to start the game

local title_active = true
local title_timer = 0
local blink_timer = 0
local show_prompt = true

function init_title_screen()
    -- Initialize game_state if it doesn't exist
    if not game_state then
        game_state = {}
        game_state.menu_active = false
    end
    
    title_active = true
    title_timer = 0
    blink_timer = 0
    show_prompt = true
end

function update_title_screen()
    if not title_active then return end
    
    title_timer += 1
    blink_timer += 1
    
    -- Blink the "Press X" text
    if blink_timer > 30 then
        show_prompt = not show_prompt
        blink_timer = 0
    end
    
    -- Check for X button press
    if btnp(❎) then
        sfx(0) -- Play start sound if you have it
        title_active = false
        -- Start the actual game initialization
        start_game()
    end
    
    return title_active -- Return whether title is still active
end

function draw_title_screen()
    if not title_active then return end
    
    cls(0) -- Clear screen with black
    
    -- Draw title
    print("Dimension Rex", 34, 30, 7)
    
    
    -- Draw blinking "press x to start" text
    if show_prompt then
        print("press ❎ to start", 30, 90, 7)
    end
    
end

function is_title_active()
    return title_active
end

function start_game()
    -- Call the original init function
    title_active = false
    _init_game()
end 