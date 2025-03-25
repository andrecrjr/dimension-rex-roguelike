function init_plr()
    plr = {
        x = 32,
        y = 16,
        spr = 1, 
        spd = 1.5,
        spr_time=0,
        h= 100,
        flp=false,
        health=100,
        damage=0,
        plr_dir="left",
        w=8,
        h=8,
        dx=0,
        dy=1,
        lvl=1,
        xp=0,
        kill=0,
        in_liquid = false,
        inv={
            gun={
                active=true,
                count=15,
                spd=1,
                spr=228,
                x=0,
                y=0,
                w=8,
                h=8,
                t=15,
                shootenmy=false,
                force=2,
                bullets={}
            }
        },
        skills={
        },
        anim_timer = 0,
        anim_speed = 4,
        is_moving = false,
        anim_frames = {
            down = {1, 2, 3},
            up = {7, 8, 9},
            side = {4, 5, 6}
        },
        anim_frame = 1,
        max_spd = 1.5,
        accel = 0.2,
        decel = 0.3,
        vx = 0,
        vy = 0,
    }

    plr.collision = function(self, flag, coords)
        -- Define collision box with slight offset to prevent sticking
        local offset = 0.5  -- Small offset to prevent edge sticking
        local ptx1 = self.x + offset
        local pty1 = self.y + offset
        local ptx2 = self.x + self.w - offset
        local pty2 = self.y + self.h - offset
        
        -- Adjust for specific flags if needed
        if flag == f.liq then  -- Liquid-specific collision might need different handling
            ptx1 = self.x + 2
            pty1 = self.y + 2
            ptx2 = self.x + self.w - 2
            pty2 = self.y + self.h - 2
        end
        
        -- Check all four corners
        local top_left = has_flag(ptx1, pty1, flag, coords)
        local top_right = has_flag(ptx2, pty1, flag, coords)
        local bottom_left = has_flag(ptx1, pty2, flag, coords)
        local bottom_right = has_flag(ptx2, pty2, flag, coords)
        
        return top_left or top_right or bottom_left or bottom_right
    end

    plr.act=function(plr)
        plr.inv.gun:updt()
    end
    
    plr.updt = function(self)
        local lx = plr.x
        local ly = plr.y
        local input_dx, input_dy = 0, 0
        
        -- Get input direction
        if btn(⬅️) then input_dx -= 1 end
        if btn(➡️) then input_dx += 1 end
        if btn(⬆️) then input_dy -= 1 end
        if btn(⬇️) then input_dy += 1 end
        
        -- Normalize diagonal input
        if input_dx != 0 and input_dy != 0 then
            input_dx *= 0.7071
            input_dy *= 0.7071
        end
        
        -- Apply acceleration/deceleration
        if input_dx != 0 then
            self.vx = approach(self.vx, input_dx * self.max_spd, self.accel)
        else
            self.vx = approach(self.vx, 0, self.decel)
        end
        
        if input_dy != 0 then
            self.vy = approach(self.vy, input_dy * self.max_spd, self.accel)
        else
            self.vy = approach(self.vy, 0, self.decel)
        end
        
        -- Update direction based on movement
        local moving = abs(self.vx) > 0.1 or abs(self.vy) > 0.1
        
        -- Update player direction based on movement
        if moving then
            if abs(self.vx) > abs(self.vy) then
                -- Horizontal movement dominates
                if self.vx < 0 then
                    self.flp = true
                    plr_dir = "left"
                    self.dtx = -1
                    self.dty = 0
                else
                    self.flp = false
                    plr_dir = "right"
                    self.dtx = 1
                    self.dty = 0
                end
            else
                -- Vertical movement dominates
                if self.vy < 0 then
                    plr_dir = "up"
                    self.dtx = 0
                    self.dty = -1
                else
                    plr_dir = "down" 
                    self.dtx = 0
                    self.dty = 1
                end
                self.flp = false
            end
        end
        
        -- Apply velocity with collision checks
        self.x += self.vx
        if self:collision(0) then
            self.x = lx
            self.vx = 0
        end
        
        self.y += self.vy
        if self:collision(0) then
            self.y = ly
            self.vy = 0
        end
        
        if btnp(❎) then
            if plr.inv.gun.count>0 then
                plr.inv.gun:shoot()
            end
        end

        self:clr_damage()
        phase:env_effects()
        phase:get_itms()
        
        self:act()
        
        self.x = mid(phase.map.xmin, self.x, phase.map.xmax)
        self.y = mid(phase.map.ymin, self.y, phase.map.ymax)
        self:lvl_up()
        self:dead()
        
        -- Animation update based on movement and environment
        if moving then
            self.is_moving = true
            self.anim_timer += 1
            if self.anim_timer >= self.anim_speed then
                self.anim_timer = 0
                self.anim_frame = (self.anim_frame % 3) + 1
            end
        else
            self.is_moving = false
            self.anim_timer = 0
            self.anim_frame = 1
        end
        
        -- Set sprite based on environment first, then direction and animation
        if self.in_liquid then
            self.spr = 11  -- Water sprite takes precedence
        else
            -- Normal animation based on direction
            if plr_dir == "up" then
                self.spr = self.anim_frames.up[self.anim_frame]
            elseif plr_dir == "down" then
                self.spr = self.anim_frames.down[self.anim_frame]
            else -- left or right
                self.spr = self.anim_frames.side[self.anim_frame]
            end
        end
    end
    
    plr.draw = function(self)
        spr(self.spr, self.x, self.y, 1,1, self.flp)
        if self.damage > 0 then
            print(-self.damage, self.x, self.y - 8,8)
        end
        self.inv.gun:draw()
    end
    
    plr.damaged= function (self, damage)
        if damage > 0 then
            self.health = self.health - damage
            self.damage=damage
            sfx(0)
        end
    end
    
    plr.clr_damage = function(self)
        if self.damage>0 and time() % 2 == 0 then
            self.damage = 0
        end
    end

    plr.lvl_up = function(self)
        if self.xp > self.lvl * 1 then
            self.lvl+=1
            game_state.menu_active = not game_state.menu_active
            game_state.selected_item = 1
            _update=_lvl_update
            _draw=_skill_draw
        end
    end

    plr.dead = function(self)
        if self.health <= 0 then
            self.health=0
            _update=_dead_update
        end
        
    end
end

function init_enmy()
    local enx,eny=r_pos()
    local enmy={
        x = enx*8, 
        y = eny*8, 
        speed = 0.6, -- velocidade de movimento
        spr = 16, -- sprite do inimigo
        colision=false,
        damage=flr(rnd(8)+1),
        dx=1,
        dy=0,
        min_dist=mid(25,35,55),
        reach=false,
        flp=false,
        hp=ceil(rnd(plr.lvl * 4)),
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
        w=8,
        h=8
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
            enemy.dx = enemy.x + cos(angle) * enemy.speed
            enemy.dy = enemy.y + sin(angle) * enemy.speed
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