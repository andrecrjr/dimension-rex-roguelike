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
            for i = #bul.bullets, 1, -1 do -- Iterate backwards to safely remove bullets
                local bullet = bul.bullets[i]
                if not bullet then break end -- Safety check for nil bullet
    
                bullet.x += cos(bullet.dir) * bullet.spd
                bullet.y += sin(bullet.dir) * bullet.spd
                bullet.t -= 1
    
                local flag_s = has_flag(bullet.x, bullet.y, 0, false)
                if flag_s or bullet.x < 0 or bullet.x > 127 or bullet.y < 0 or bullet.y > 127 or bullet.t <= 0 then
                    del(bul.bullets, bullet)
                else
                    -- Optimized enemy collision check
                    local hit = false
                    for enemy in all(enmies) do
                        if collide(bullet, enemy) then
                            enemy.hurt = true
                            enemy.hp -= bul.force
    
                            -- Add knockback effect (optional)
                            local knockback = 2
                            local new_x = enemy.x + cos(bullet.dir) * knockback
                            local new_y = enemy.y + sin(bullet.dir) * knockback
    
                            -- Check if new position is valid (not solid)
                            if not has_flag(new_x, new_y, 0, false) then
                                enemy.x = new_x
                                enemy.y = new_y
                            end
    
                            -- Check if enemy is dead
                            if enemy.hp <= 0 then
                                del(enmies, enemy)
                                plr.xp += 0.5
                                plr.kill += 1
                            end
    
                            del(bul.bullets, bullet)
                            hit = true
                            break -- Stop checking other enemies after a hit
                        end
                    end
    
                    -- If no hit, keep bullet alive
                    if not hit then
                        -- Optional: Add particle effect for bullet trail
                        -- pset(bullet.x, bullet.y, 7)
                    end
                end
            end
            bul.shootenmy = #bul.bullets > 0 -- Only keep shootenmy true if bullets exist
        end
    end
end

