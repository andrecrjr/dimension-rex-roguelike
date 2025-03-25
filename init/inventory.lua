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
                            -- Apply damage bonus from bullet mastery skill
                            local damage = plr.inv.gun.bullet_types[bullet.type].force
                            damage += (plr.inv.gun.damage_bonus or 0)
                            enemy.hp -= damage * (plr.damage_mult or 1)

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

function init_gun()
    -- Define bullet types with their properties
    plr.inv.gun.bullet_types = {
        normal = {spr = 228, spd = 1.2, force = 2},
        bounce = {spr = 229, spd = 1, force = 1.5, bounces = 2},
        spiral = {spr = 230, spd = 0.8, force = 2.5},
        orbit = {spr = 231, spd = 1, force = 2, orbit_radius = 12}
    }
    
    plr.inv.gun.shoot = function(self)
        if self.count > 0 then
            -- Calculate spread angles
            local spread_count = (self.bullet_spread or 0) + 1
            local spread_angle = 0.2 -- Angle between bullets in radians
            local start_angle = -(spread_count - 1) * spread_angle / 2
            
            -- Create bullets based on spread
            for i=1,spread_count do
                local angle = start_angle + (i-1) * spread_angle
                local dx = plr.dtx * cos(angle) - plr.dty * sin(angle)
                local dy = plr.dtx * sin(angle) + plr.dty * cos(angle)
                
                add(self.bullets, {
                    x = plr.x + 4,
                    y = plr.y + 4,
                    dx = dx,
                    dy = dy,
                    type = self.current_type, -- Changed back to type to match the system
                    spr = self.bullet_types[self.current_type].spr,
                    spd = self.bullet_types[self.current_type].spd,
                    force = self.bullet_types[self.current_type].force,
                    life = 60,
                    bounces = 0,
                    max_bounces = self.bullet_types[self.current_type].bounces or 3,
                    w = 4,
                    h = 4,
                    age = 0
                })
            end
            
            self.count -= 1
            sfx(2)
        end
    end
    
    plr.inv.gun.updt = function(self)
        -- Update gun position relative to player
        self.x = plr.x + plr.dtx * 8
        self.y = plr.y + plr.dty * 8
        
        -- Update bullets
        for b in all(self.bullets) do
            b.age += 1
            
            -- Move bullet based on type
            if b.type == "spiral" then
                -- Spiral motion
                local spiral_radius = 4
                local spiral_speed = b.age/10
                b.x += b.dx * b.spd + cos(spiral_speed) * spiral_radius
                b.y += b.dy * b.spd + sin(spiral_speed) * spiral_radius
            elseif b.type == "orbit" then
                -- Orbiting bullets
                local orbit_radius = self.bullet_types.orbit.orbit_radius
                local orbit_speed = b.age/15
                b.x = plr.x + 4 + cos(orbit_speed) * orbit_radius
                b.y = plr.y + 4 + sin(orbit_speed) * orbit_radius
            else
                -- Normal and bounce bullets
                b.x += b.dx * b.spd
                b.y += b.dy * b.spd
            end
            
            -- Check collision with enemies
            for enemy in all(enmies) do
                if collide(b, enemy) then
                    enemy.hurt = true
                    -- Apply damage bonus from bullet mastery skill
                    local damage = b.force
                    damage += (plr.inv.gun.damage_bonus or 0)
                    enemy.hp -= damage * (plr.damage_mult or 1)
                    
                    -- Apply knockback
                    local knockback = 2
                    local new_x = enemy.x + b.dx * knockback
                    local new_y = enemy.y + b.dy * knockback
                    
                    if not has_flag(new_x, new_y, 0, false) then
                        enemy.x = new_x
                        enemy.y = new_y
                    end
                    
                    if enemy.hp <= 0 then
                        del(enmies, enemy)
                        plr.xp += 0.5
                        plr.kill += 1
                    end
                    
                    -- Remove bullet unless it's a piercing type
                    if b.type != "pierce" then
                        del(self.bullets, b)
                        goto continue
                    end
                end
            end
            
            -- Check collision with walls
            if b.type == "bounce" and b.bounces < b.max_bounces then
                if has_flag(b.x, b.y, 0) then
                    -- Bounce off walls
                    if has_flag(b.x - b.dx, b.y, 0) then
                        b.dx *= -1
                    end
                    if has_flag(b.x, b.y - b.dy, 0) then
                        b.dy *= -1
                    end
                    b.bounces += 1
                    sfx(3)
                end
            elseif has_flag(b.x, b.y, 0) then
                -- Non-bouncing bullets are destroyed on wall hit
                del(self.bullets, b)
                goto continue
            end
            
            -- Update bullet lifetime
            b.life -= 1
            if b.life <= 0 then
                del(self.bullets, b)
            end
            
            ::continue::
        end
        
        -- Auto reload based on reload speed
        if self.count < self.max_count and time() % (30 * (self.reload_speed or 1)) == 0 then
            self.count += 1
        end
    end
    
    plr.inv.gun.draw = function(self)
        -- Draw gun
        spr(self.spr, self.x, self.y, 1, 1, plr.flp)
        
        -- Draw bullets with trails
        for b in all(self.bullets) do
            -- Add particle trail effect based on bullet type
            if b.type == "spiral" then
                for i=1,2 do
                    pset(b.x-cos(b.age/8)*i, b.y-sin(b.age/8)*i, 12)
                end
            elseif b.type == "bounce" then
                pset(b.x-b.dx*2, b.y-b.dy*2, 9)
            elseif b.type == "orbit" then
                pset(b.x-2, b.y-2, 8)
                pset(b.x+2, b.y+2, 8)
            end
            spr(b.spr, b.x, b.y, 1, 1)
        end
        
        -- Draw ammo count
        print(self.count, plr.x - 8, plr.y - 8, 7)
    end
end

