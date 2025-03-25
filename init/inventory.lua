function init_inv()
    plr.inv.gun.draw=function(bul)
        for bullet in all(bul.bullets) do
            -- Add particle trail effect based on bullet type
            if bullet.type == "spiral" then
                for i=1,2 do
                    pset(bullet.x-cos(bullet.age/8)*i, bullet.y-sin(bullet.age/8)*i, 12)
                end
            elseif bullet.type == "bounce" then
                pset(bullet.x-cos(bullet.dir)*2, bullet.y-sin(bullet.dir)*2, 9)
            elseif bullet.type == "orbit" then
                pset(bullet.x-2, bullet.y-2, 8)
                pset(bullet.x+2, bullet.y+2, 8)
            end
            spr(bullet.spr, bullet.x, bullet.y)
        end
    end

    plr.inv.gun.bullet_types = {
        normal = {spr=228, spd=1.2, force=2},
        bounce = {spr=229, spd=1, force=1.5, bounces=2},
        spiral = {spr=230, spd=0.8, force=2.5},
        orbit = {spr=231, spd=1, force=2, orbit_radius=12}
    }
    
    plr.inv.gun.current_type = "normal"

    create_bullet=function(x, y, dir, spd, spr, t, type)
        local bul = {}
        bul.x = x
        bul.y = y
        bul.dir = dir
        bul.spd = spd
        bul.spr = spr
        bul.t = t
        bul.w = 2
        bul.h = 2
        bul.type = type
        bul.age = 0
        bul.bounces = type == "bounce" and plr.inv.gun.bullet_types.bounce.bounces or 0
        bul.start_x = x
        bul.start_y = y
        add(plr.inv.gun.bullets, bul)
    end

    plr.inv.gun.shoot=function(bul)
        if (bul.active and bul.count > 0) then
            local x = plr.x + plr.w / 2
            local y = plr.y + plr.h / 2
            local dir = atan2(plr.dtx, plr.dty)
            local bullet_type = plr.inv.gun.bullet_types[plr.inv.gun.current_type]
            
            if plr.inv.gun.current_type == "orbit" then
                -- Create 2 orbiting bullets
                for i=0,1 do
                    create_bullet(x, y, dir + i/2, bullet_type.spd, bullet_type.spr, plr.inv.gun.t, "orbit")
                end
                bul.count -= 1
            else
                create_bullet(x, y, dir, bullet_type.spd, bullet_type.spr, plr.inv.gun.t, plr.inv.gun.current_type)
                bul.count -= 1
            end
            bul.shootenmy=true
        end
    end
    
    plr.inv.gun.updt = function(bul)
        if bul.shootenmy then
            for i = #bul.bullets, 1, -1 do
                local bullet = bul.bullets[i]
                if not bullet then break end

                bullet.age += 1
                
                -- Different movement patterns based on bullet type
                if bullet.type == "spiral" then
                    -- Spiral motion
                    local spiral_radius = 4
                    local spiral_speed = bullet.age/10
                    bullet.x += cos(bullet.dir) * bullet.spd + cos(spiral_speed) * spiral_radius
                    bullet.y += sin(bullet.dir) * bullet.spd + sin(spiral_speed) * spiral_radius
                elseif bullet.type == "bounce" then
                    -- Bouncing bullet that reflects off walls
                    local new_x = bullet.x + cos(bullet.dir) * bullet.spd
                    local new_y = bullet.y + sin(bullet.dir) * bullet.spd
                    
                    -- Check wall collisions
                    local hit_wall = false
                    if new_x < 0 or new_x > 127 then
                        bullet.dir = 0.5 - bullet.dir
                        hit_wall = true
                    end
                    if new_y < 8 or new_y > 127 then
                        bullet.dir = 1 - bullet.dir
                        hit_wall = true
                    end
                    
                    if hit_wall then
                        bullet.bounces -= 1
                        if bullet.bounces < 0 then
                            del(bul.bullets, bullet)
                            goto continue
                        end
                    end
                    
                    bullet.x = new_x
                    bullet.y = new_y
                elseif bullet.type == "orbit" then
                    -- Orbiting bullets that rotate around their path
                    local orbit_radius = plr.inv.gun.bullet_types.orbit.orbit_radius
                    local orbit_speed = bullet.age/15
                    local base_x = bullet.start_x + cos(bullet.dir) * bullet.spd * bullet.age
                    local base_y = bullet.start_y + sin(bullet.dir) * bullet.spd * bullet.age
                    bullet.x = base_x + cos(orbit_speed + bullet.dir) * orbit_radius
                    bullet.y = base_y + sin(orbit_speed + bullet.dir) * orbit_radius
                else
                    -- Enhanced normal movement with slight acceleration
                    bullet.spd = min(bullet.spd * 1.02, 2)
                    bullet.x += cos(bullet.dir) * bullet.spd
                    bullet.y += sin(bullet.dir) * bullet.spd
                end
                
                bullet.t -= 1

                local flag_s = has_flag(bullet.x, bullet.y, 0, false)
                if flag_s or bullet.x < 0 or bullet.x > 127 or bullet.y < 0 or bullet.y > 127 or bullet.t <= 0 then
                    if bullet.type == "bounce" and bullet.bounces >= 0 and not flag_s then
                        -- Allow bouncing bullets to continue if they have bounces left
                        goto continue
                    end
                    del(bul.bullets, bullet)
                else
                    local hit = false
                    for enemy in all(enmies) do
                        if collide(bullet, enemy) then
                            enemy.hurt = true
                            enemy.hp -= plr.inv.gun.bullet_types[bullet.type].force

                            local knockback = 2
                            local new_x = enemy.x + cos(bullet.dir) * knockback
                            local new_y = enemy.y + sin(bullet.dir) * knockback

                            if not has_flag(new_x, new_y, 0, false) then
                                enemy.x = new_x
                                enemy.y = new_y
                            end

                            if enemy.hp <= 0 then
                                del(enmies, enemy)
                                plr.xp += 0.5
                                plr.kill += 1
                            end

                            del(bul.bullets, bullet)
                            hit = true
                            break
                        end
                    end
                end
                ::continue::
            end
            bul.shootenmy = #bul.bullets > 0
        end
    end
end

