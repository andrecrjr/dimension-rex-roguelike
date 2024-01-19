function init_plr()
    plr = {
        x = 32,
        y = 16,
        spr = 1, 
        spd = 1.25,
        h= 100,
        flp=false,
        health=100,
        damage=0,
        plr_dir="left",
        w=8,
        h=8,
        dx=0,
        dy=1,
        level=1,
        inv={
            gun={
                active=true,
                count=5,
                spd=2,
                spr=227,
                x=0,
                y=0,
                w=8,
                h=8,
                t=150
            }
        },
        skills={
        }
    }

    plr.collision=function (plr, flag, coords)
        local ptx1 = flr(plr.x / 8)
        local pty1 = flr(plr.y / 8)
        local ptx2 = flr((plr.x + 7) / 8)
        local pty2 = flr((plr.y + 7) / 8)
        -- Verifica as flags em cada canto

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
        elseif btn(➡️) then
            self.x = self.x + self.spd
            self.spr = 4
            self.flp=false
            plr_dir="right"
        end
        if btn(⬆️) then
            self.y = self.y - self.spd
            self.spr=7
            plr_dir="up"
        elseif btn(⬇️) then
            self.y = self.y + self.spd
            self.spr=1
            plr_dir="down"
        elseif btnp(❎,0) then
            if plr.inv.gun.count>0 then
                plr.inv.gun:shoot()
                plr.inv.gun.count-=1
            end
        end

        self:clr_damage()
        phase:get_itms()
        if self:collision(0) then
            self.x=lx self.dx=lx
            self.y=ly self.dy=ly
        end
        self:act()

        self.x = mid(phase.map.xmin, self.x, phase.map.xmax)
        self.y = mid(phase.map.ymin, self.y, phase.map.ymax)
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
end

function init_enmy()

    local enmy={
        x = rnd(mid(plr.x+50, 100,120)), 
        y = rnd(mid(plr.y+40, 100,120)), 
        speed = 0.6, -- velocidade de movimento
        spr = 16, -- sprite do inimigo
        colision=false,
        damage=flr(rnd(8)+1),
        dx=1,
        dy=0,
        min_dist=mid(25,35,55),
        reach=false,
        flp=false,
        w=8,
        h=8
    }
    enmy.collision = function (enmy)
        local ptx1 = flr(enmy.dx / 8)
        local pty1 = flr(enmy.dy / 8)
        local ptx2 = flr((enmy.dx + 7) / 8)
        local pty2 = flr((enmy.dy + 7) / 8)
        
        local col1 = has_flag(ptx1, pty1, 0)
        local col2 = has_flag(ptx2, pty1, 0)
        local col3 = has_flag(ptx1, pty2, 0)
        local col4 = has_flag(ptx2, pty2, 0)

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
            if enemy.reach then
                if plr_dir == 'up' then enemy.spr=19 enemy.flp=false
                elseif plr_dir == 'down' then enemy.spr=16 enemy.flp=false end
                if plr_dir == 'left' then enemy.spr=20 enemy.flp=false
                elseif plr_dir == 'right' then enemy.spr=20 enemy.flp=true end
                spr(enemy.spr, enemy.x, enemy.y, 1,1, enemy.flp)
            else
                spr(enemy.spr, enemy.x, enemy.y)
            end
          end
    end
    enmies.follow= function(self)
        for enemy in all(self) do
            -- calcula a distancia entre o inimigo e o jogador
            local dx = plr.x - enemy.x
            local dy = plr.y - enemy.y
            dist = sqrt(dx * dx + dy * dy)
            enemy.reach=false
            if dist < enemy.min_dist then
              enemy.reach=true
            local angle = atan2(dx, dy)
            enemy.dx = enemy.x + cos(angle) * enemy.speed
            enemy.dy = enemy.y + sin(angle) * enemy.speed
            print("!", enemy.dx-8, enemy.dy + 15)
            enemy:collision()
            if dist <= 10 then
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