function _init()
    init_plr()
    init_phase()
    init_enmies()
    init_inv()
    for i = 1, rnd(18)+3 do
        enmy = init_enmy()
        enmy:add_enmy(enmies)
    end
end