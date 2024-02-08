function init_inv()
    plr.inv.gun.draw=function(bul)
        for bullet in all(bul.bullets) do
            spr(bullet.spr, bullet.x, bullet.y) -- desenha o sprite do projetil
          end
    end

    create_bullet=function(x, y, dir, spd, spr, t)
        local bullet = {}
        bullet.x = x
        bullet.y = y
        bullet.dir = dir
        bullet.spd = spd
        bullet.spr = spr
        bullet.t = t
        add(plr.inv.gun.bullets, bullet)
    end

    plr.inv.gun.shoot=function(bul)
        if (bul.active and bul.count > 0) then
            local x = plr.x + plr.w / 2
            local y = plr.y + plr.h / 2
            printh(plr.x)
            local dir = atan2(plr.x, plr.y)
            printh(plr.dx)
            printh(plr.dy)
            printh("atan"..dir)
            create_bullet(x, y, dir, plr.inv.gun.spd, plr.inv.gun.spr, plr.inv.gun.t)
            bul.shootenmy=true
            bul.count -= 1
        end
    end
    
    plr.inv.gun.updt = function(bul)
        if bul.shootenmy then
            for bullet in all(bul.bullets) do
                -- move o projetil na direção e velocidade definidas
                bullet.x += cos(bullet.dir) * bullet.spd
                bullet.y += sin(bullet.dir) * bullet.spd
                -- diminui o tempo de vida do projetil
                bullet.t -= 1
                local tile = mget(flr(bullet.x / 8), flr(bullet.y / 8))
                local flag = fget(tile, 0)
                -- verifica se o projetil saiu da tela ou se o tempo acabou
                    if (bullet.x < 0 or bullet.x > 127 
                            or bullet.y < 0 or 
                            bullet.y > 127 or bullet.t <= 0) 
                            or bullet.t==0 or flag then
                        del(bul.bullets, bullet) -- remove o projetil da lista de balas
                    end
            end
            bul.reach=false
        end
    end
end

