function _init()
    init_plr()
    init_phase()
    init_enmies()
    for i = 1, 10 do
        enmy = init_enmy()
        enmy:spawn_enmy(enmies)
    end
end