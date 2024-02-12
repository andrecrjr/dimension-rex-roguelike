function init_inv()
    plr.inv.gun.draw=function(bul)
        for bullet in all(bul.bullets) do
            spr(bullet.spr, bullet.x, bullet.y) -- desenha o sprite do projetil
          end
    end

    create_bullet=function(x, y, dir, spd, spr, t)
        local bul = {}
        bul.x = x bul.y = y bul.dir = dir 
        bul.spd = spd bul.spr = spr
        bul.t = t bul.w=2 bul.h=2
        add(plr.inv.gun.bullets, bul)
    end

    plr.inv.gun.shoot=function(bul)
        if (bul.active and bul.count > 0) then
            local x = plr.x + plr.w / 2
            local y = plr.y + plr.h / 2
            local dir = atan2(plr.dtx, plr.dty)
            create_bullet(x, y, dir, plr.inv.gun.spd, plr.inv.gun.spr, plr.inv.gun.t)
            bul.shootenmy=true
            bul.count -= 1
        end
    end
    
    plr.inv.gun.updt = function(bul)
        if bul.shootenmy then
            for bullet in all(bul.bullets) do
                bullet.x += cos(bullet.dir) * bullet.spd
                bullet.y += sin(bullet.dir) * bullet.spd
                bullet.t -= 1
                local flag_s = has_flag(bullet.x, bullet.y, 0, false)
                for enemy in all(enmies) do
                    if collide(bullet, enemy) then
                        del(enmies, enemy)
                        del(bul.bullets, bullet)
                        plr.xp+=0.5 plr.kill+=1
                    end
                end
                    if (bullet.x < 0 or bullet.x > 127 
                            or bullet.y < 0 or 
                            bullet.y > 127 or bullet.t <= 0) 
                            or bullet.t==0 or flag_s then
                        del(bul.bullets, bullet) -- remove o projetil da lista de balas
                    end
            end
            bul.reach=false
        end
    end
end

