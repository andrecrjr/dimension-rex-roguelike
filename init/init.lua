
function _init()
    -- Start with the title screen
    init_title_screen()
end

function _init_game()
    init_plr()
    init_phase()
    init_enmies()
    init_inv()
    _skill_init()
    for i = 1, rnd(plr.lvl)+3 do
        enmy = init_enmy()
        enmy:add_enmy(enmies)
    end
end

function _init_phase()
    init_phase()
    init_enmies()
    init_inv()
    _skill_init()
    for i = 1, rnd(plr.lvl)+3 do
        enmy = init_enmy()
        enmy:add_enmy(enmies)
    end
end