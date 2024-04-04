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
        }
    }

    plr.collision=function (plr, flag, coords)
        ptx1, pty1 = plr.x, plr.y
        ptx2, pty2 = ptx1 + 7, pty1 + 7
        if flag == 1 then
            ptx1, pty1 = plr.x, plr.y
            ptx2, pty2 = ptx1, pty1
        end
        return has_flag(ptx1, pty1, flag, coords) or
               has_flag(ptx2, pty1, flag, coords) or
               has_flag(ptx1, pty2, flag, coords) or
               has_flag(ptx2, pty2, flag, coords)
    end

    plr.act=function(plr)
        plr.inv.gun:updt()
    end
    
    plr.updt = function(self)
        local lx = plr.x
        local ly = plr.y
        if btn(⬅️) then
            self.x = self.x - self.spd
            self.spr = 4
            self.flp=true
            plr_dir="left"
            plr.dtx=-1 plr.dty=0
        elseif btn(➡️) then
            self.x = self.x + self.spd
            self.spr = 4
            self.flp=false
            plr_dir="right"
            plr.dtx=1 plr.dty=0
        end
        if btn(⬆️) then
            self.y = self.y - self.spd
            self.spr=7
            plr_dir="up"
            plr.dtx=0 plr.dty=-1
        elseif btn(⬇️) then
            self.y = self.y + self.spd
            self.spr=1
            plr_dir="down"
            plr.dtx=0 plr.dty=1
        end
        if btnp(❎) then
            if plr.inv.gun.count>0 then
                plr.inv.gun:shoot()
            end
        end

        self:clr_damage()
        phase:env_effects()
        phase:get_itms()
        if self:collision(0) then
            self.x=lx self.y=ly
        end
        self:act()
        
        self.x = mid(phase.map.xmin, self.x, phase.map.xmax)
        self.y = mid(phase.map.ymin, self.y, phase.map.ymax)
        self:lvl_up()
        self:dead()
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
        end
    end
    
    plr.clr_damage = function(self)
        if self.damage>0 and time() % 2 == 0 then
            self.damage = 0
        end
    end

    plr.lvl_up = function(self)
        if self.xp > self.lvl * 8 then
            self.lvl+=1
        end
    end

    plr.dead = function(self)
        printh("entrei"..self.health)
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