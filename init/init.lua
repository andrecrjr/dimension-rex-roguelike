function _init()
    init_plr()
    init_phase()
    init_enmies()
    init_inv()
    for i = 1, rnd(plr.lvl)+3 do
        enmy = init_enmy()
        enmy:add_enmy(enmies)
    end
end

function _skills_init()
    skills = {"Habilidade 1", "Habilidade 2"}
    selected_skill = nil
end