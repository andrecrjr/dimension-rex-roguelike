function _init()
    init_enmies()
    init_plr()
    init_phase()
    enmy = init_enmy()
    enmy:spawn_enmy(enmies)
end