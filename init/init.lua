function _init()
    init_enmies()
    init_plr()
    enmy = init_enmy()
    enmy:spawn_enmy(enmies)
end