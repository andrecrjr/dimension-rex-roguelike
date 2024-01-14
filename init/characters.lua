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
        h=8
    }

    plr.chck_tile = function (plr)
         tile1 = mget(flr(plr.x / 8), flr(plr.y / 8))
         tile2 = mget(flr((plr.x + 8-1) / 8), flr(plr.y / 8))
         tile3 = mget(flr(plr.x / 8), flr((plr.y + 7) / 8))
         tile4 = mget(flr((plr.x + 8 - 1) / 8), flr((plr.y + 7) / 8))
        return tile1, tile2, tile3, tile4
    end

    plr.move_plr=function (plr, dx, dy)
            -- Calcula a nova posição
            local new_x = plr.x + dx
            local new_y = plr.y + dy
            local tile_size = 8
            if not (is_solid(flr(new_x / tile_size), flr(new_y / tile_size)) or
                    is_solid(flr((new_x + plr.w - 1) / tile_size), flr(new_y / tile_size)) or
                    is_solid(flr(new_x / tile_size), flr((new_y + plr.h - 1) / tile_size)) or
                    is_solid(flr((new_x + plr.w - 1) / tile_size), flr((new_y + plr.h - 1) / tile_size))) then
              -- Se não houver colisão, atualiza a posição do jogador
              plr.x = new_x
              plr.y = new_y
            end
    end
    
    plr.updt = function(self)
        if btn(⬅️) then
            self.x = self.x - self.spd
            self.spr = 4
            self.flp=true
            plr_dir="left"
            self:move_plr(-1, 0)
        elseif btn(➡️) then
            self.x = self.x + self.spd
            self.spr = 4
            self.flp=false
            plr_dir="right"
            self:move_plr(1, 0)
        end
        if btn(⬆️) then
            self.y = self.y - self.spd
            self.spr=7
            plr_dir="up"
            self:move_plr(0, -1)
        elseif btn(⬇️) then
            self.y = self.y + self.spd
            self.spr=1
            plr_dir="down"
            self:move_plr(0, 1)
        end
        self:clr_damage()
        self.dx=self.x
        self.dy=self.y
    end
    
    plr['draw'] = function(self)
        spr(self.spr, self.x, self.y, 1,1, self.flp)
        if self.damage > 0 then
            print(-self.damage, self.x, self.y - 8,8)
        end
    end
    
    plr['damaged']= function (self, damage)
        if damage > 0 then
            self.health = self.health - damage
            self.damage=damage
        end
    end
    
    plr['clr_damage'] = function(self)
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
        flp=false
    }
    enmy.chck_tile = function (plr)
        tile1 = mget(flr(plr.x / 8), flr(plr.y / 8))
        tile2 = mget(flr((plr.x + 8-1) / 8), flr(plr.y / 8))
        tile3 = mget(flr(plr.x / 8), flr((plr.y + 7) / 8))
        tile4 = mget(flr((plr.x + 8 - 1) / 8), flr((plr.y + 7) / 8))
       return tile1, tile2, tile3, tile4
   end
    enmy.spwn_enmy=function(self, table)
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
            collision(enemy)
              if dist <= 10 then
                enemy.colision = true
                if time() % 1 == 0 then
                      plr:damaged(enemy.damage)
                end
              else
                  enemy.colision = false
              end
            end
           end
    end
end