function _update()
    _update_on_game()
end

function _update_on_game()
    plr:updt()
    enmies:follow()
end

function _dead_update()
    if btn(❎) then
        _update=_update_on_game
        _init()
    end
end

function _lvl_update()
    _skills_init()
    skill_draw_upt = false
    if not skill_draw_upt then
        skill_draw_upt = true
    end
    if btnp(➡️) then
        printh("press right")
        selected_skill = 1
    elseif btnp(⬅️) then
        printh("press left")
        selected_skill = 2
    end
end