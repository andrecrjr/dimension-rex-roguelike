function init_plr()
    plr = {
        x = 32,
        y = 16,
        spr = 1, 
        spd = 1.5,
        base_spd = 1.5,
        flp = false,
        health = 100,
        max_health = 100,
        damage = 0,
        damage_mult = 1,
        plr_dir = "left",
        w = 8,
        h = 8,
        dx = 0,
        dy = 1,
        lvl = 1,
        xp = 0,
        xp_needed = 5,
        skill_points = 0,
        kill = 0,
        distance_traveled = 0, -- Track how far the player has gone
        in_liq = false,
        inv = {
            gun = {
                active = true,
                count = 15,
                max_count = 15,
                spd = 1,
                reload_speed = 1,
                bullet_spread = 0,
                spr = 228,
                x = 0,
                y = 0,
                w = 8,
                h = 8,
                t = 15,
                shootenmy = false,
                force = 2,
                bullets = {},
                current_type = "normal",
                bullet_types = {
                    normal = {spr = 228},
                    bounce = {spr = 229},
                    spiral = {spr = 230},
                    orbit = {spr = 231}
                }
            }
        },
        skills = {},
        at = 0,
        as = 4,
        af = 1,
        vx = 0,
        vy = 0
    }
    
    -- Store animation frames
    plr.anim = {
        {1, 2, 3},  -- down
        {7, 8, 9},  -- up
        {4, 5, 6}   -- side
    }

    plr.collision = function(self, flag, coords)
        local o = flag == f.liq and 2 or 0.5 -- offset
        local x1,y1 = self.x+o, self.y+o
        local x2,y2 = self.x+self.w-o, self.y+self.h-o
        
        return has_flag(x1,y1,flag,coords) or has_flag(x2,y1,flag,coords) or 
               has_flag(x1,y2,flag,coords) or has_flag(x2,y2,flag,coords)
    end

    plr.act=function(self)
        self.inv.gun:updt()
    end
    
    plr.updt = function(self)
        local lx, ly = self.x, self.y
        local dx, dy, m = 0, 0, 0.7071

        -- Get input
        dx = (btn(⬅️) and -1 or 0) + (btn(➡️) and 1 or 0)
        dy = (btn(⬆️) and -1 or 0) + (btn(⬇️) and 1 or 0)

        -- Normalize diagonal
        if dx ~= 0 and dy ~= 0 then
            dx, dy = dx * m, dy * m
        end

        -- Apply acceleration
        local ac, dc = 0.2, 0.3
        self.vx = approach(self.vx, dx * self.spd, ac)
        self.vy = approach(self.vy, dy * self.spd, ac)

        -- Check if moving
        local moving = abs(self.vx) > 0.1 or abs(self.vy) > 0.1

        -- Update direction
        if moving then
            self.flp = self.vx < 0
            plr_dir = (abs(self.vx) > abs(self.vy)) and (self.vx < 0 and "left" or "right") or (self.vy < 0 and "up" or "down")
            self.dtx = (abs(self.vx) > abs(self.vy)) and (self.vx < 0 and -1 or 1) or 0
            self.dty = (abs(self.vx) > abs(self.vy)) and 0 or (self.vy < 0 and -1 or 1)
        end

        -- Apply movement with collision
        self.x += self.vx
        if self:collision(0) then self.x = lx self.vx = 0 end

        self.y += self.vy
        if self:collision(0) then self.y = ly self.vy = 0 end

        -- Shoot
        if btnp(❎) and self.inv.gun.count > 0 then
            self.inv.gun:shoot()
        end

        -- Switch bullet type
        if btnp(🅾️) then
            local types = {"normal", "bounce", "spiral", "orbit"}
            local current_idx = 1
            for i=1,#types do
                if types[i] == self.inv.gun.current_type then
                    current_idx = i
                    break
                end
            end
            current_idx = (current_idx % #types) + 1
            self.inv.gun.current_type = types[current_idx]
            -- Update gun sprite based on type
            self.inv.gun.spr = self.inv.gun.bullet_types[self.inv.gun.current_type].spr
        end

        self:clr_damage()
        phase:env_effects()
        phase:get_itms()
        self:act()
        
        -- Bounds check
        self.x = mid(phase.map.xmin, self.x, phase.map.xmax)
        self.y = mid(phase.map.ymin, self.y, phase.map.ymax)
        self:lvl_up()
        self:dead()
        
        -- Animation
        if moving then
            self.at += 1
            if self.at >= self.as then
                self.at = 0
                self.af = (self.af % 3) + 1
            end
        else
            self.at, self.af = 0, 1
        end
        
        -- Set sprite
        if self.in_liq then
            self.spr = 11
        else
            local idx = (plr_dir == "up" and 2) or (plr_dir == "down" and 1) or 3
            self.spr = self.anim[idx][self.af]
        end
    end
    
    plr.draw = function(self)
        spr(self.spr, self.x, self.y, 1,1, self.flp)
        if self.damage > 0 then
            print(-self.damage, self.x, self.y - 8,8)
        end
        self.inv.gun:draw()
    end
    
    plr.damaged = function(self, dmg)
        if dmg > 0 then
            -- Check for dodge chance
            if self.dodge_chance and rnd(100) < self.dodge_chance then
                -- Dodged the attack!
                self.damage = 0
                sfx(9) -- Different sound for dodge
            else
                self.health = max(0, self.health - dmg)
                self.damage = dmg
                sfx(0)
            end
        end
    end
    
    plr.clr_damage = function(self)
        if self.damage>0 and time()%2==0 then
            self.damage = 0
        end
        
        -- Apply health regeneration if it exists
        if self.health_regen and self.health < self.max_health then
            self.health = min(self.max_health, self.health + self.health_regen)
        end
    end

    plr.lvl_up = function(self)
        if self.xp >= self.xp_needed then
            self.lvl += 1
            self.xp -= self.xp_needed
            
            -- More gradual XP curve that starts easier but grows steeper
            local scaling_factor
            if self.lvl <= 3 then
                scaling_factor = 1.2 -- Easier early levels
            elseif self.lvl <= 7 then
                scaling_factor = 1.3 + (self.lvl * 0.03) -- Medium levels
            else
                scaling_factor = 1.4 + (self.lvl * 0.07) -- Higher levels get much harder
            end
            self.xp_needed = flr(self.xp_needed * scaling_factor)
            
            -- Always award exactly 1 skill point per level
            self.skill_points += 1
            
            -- Show skill menu
            game_state.menu_active = true
            game_state.selected_item = 1
            game_state.action_triggered = false -- Reset this to prevent issues
            _update = _lvl_update
            _draw = _skill_draw
            sfx(7) -- Level up sound
        end
    end

    plr.dead = function(self)
        if self.health <= 0 then
            self.health = 0
            
            -- Play death sound
            sfx(4)
            
            -- Switch to game over mode
            _update = _dead_update
            _draw = _draw_game_over
        end
    end

    plr.gain_xp = function(self, amount)
        self.xp += amount
        self:lvl_up()
    end
end

function init_enmy()
    local enx,eny=r_pos()
    local enmy={
        x = enx*8,
        y = eny*8,
        spr = 16,
        spd = 0.5,
        hp = 10,
        damage = 5,
        xp_value = 5,
        w = 8,
        h = 8,
        flp = false,
        hurt = false,
        dead = false,
        hit = false,
        
        damaged = function(self, dmg)
            if dmg > 0 then
                self.hp -= dmg * (plr.damage_mult or 1)
                self.hit = true
                if self.hp <= 0 and not self.dead then
                    self.dead = true
                    plr:gain_xp(self.xp_value)
                    plr.kill += 1
                    sfx(1)
                end
            end
        end,
        
        biome_spr={
            jurassic={
                up=20,
                down=16,
                left=17,
                right=20,
            },
            toad={
                up=51,
                down=48,
                left=49,
                right=49,
            },
            cojado={
                up=34,
                down=32,
                left=33,
                right=33,
            },
            daniland={
                up=38,
                down=37,
                left=36,
                right=36, 
            }
        },
        dx=1,
        dy=0,
        min_dist=mid(25,35,55),
        reach=false
    }

    enmy.collision = function (enmy)
        local ptx1 =enmy.dx
        local pty1 =enmy.dy
        local ptx2 =enmy.dx + 8
        local pty2 =enmy.dy + 8
        
        local col1 = has_flag(ptx1, pty1, 0) or has_flag(ptx1, pty1, 1)
        local col2 = has_flag(ptx2, pty1, 0) or has_flag(ptx2, pty1, 1)
        local col3 = has_flag(ptx1, pty2, 0) or has_flag(ptx2, pty1, 1)
        local col4 = has_flag(ptx2, pty2, 0) or has_flag(ptx2, pty1, 1)

        if not (col1 or col2 or col3 or col4) then
            enmy.x = enmy.dx 
            enmy.y = enmy.dy
        end
   end
    enmy.add_enmy=function(self, table)
        add(table, self)
    end
    return enmy
end

function init_enmies()
    enmies = {}
    enmies.draw=function (self)
        for enemy in all(self) do
            if enemy.hurt then
                print(-plr.inv.gun.force, enemy.x+8, enemy.y-6, 8)
                if time() % 2 == 0 then
                    enemy.hurt = false
                end
            end
            local enmy_spr= enemy.biome_spr[phase.select]
            if enemy.reach then
                if plr_dir == 'up' then enemy.spr=enmy_spr.up enemy.flp=false
                elseif plr_dir == 'down' then enemy.spr=enmy_spr.down enemy.flp=false end
                if plr_dir == 'left' then enemy.spr=enmy_spr.left enemy.flp=false
                elseif plr_dir == 'right' then enemy.spr=enmy_spr.right enemy.flp=true end
                spr(enemy.spr, enemy.x, enemy.y, 1,1, enemy.flp)
            else
                spr(enmy_spr.up, enemy.x, enemy.y)
            end

          end
    end
    enmies.follow= function(self)
        for enemy in all(self) do
            local dist, dx, dy = distance(plr, enemy)
            enemy.reach=false
            if dist < enemy.min_dist then
                enemy.reach=true
                local angle = atan2(dx, dy)
                enemy.dx = enemy.x + cos(angle) * enemy.spd
                enemy.dy = enemy.y + sin(angle) * enemy.spd
                enemy:collision()
                if dist <= 7 then
                    enemy.colision = true
                    if time() % 0.50 == 0 then
                        plr:damaged(enemy.damage)
                    end
                else
                    enemy.colision = false
                end
            end
        end
    end
end