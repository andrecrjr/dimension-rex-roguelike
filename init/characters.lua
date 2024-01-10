function init_plr()
    plr = {
        x = 32,
        y = 16,
        spr = 1, 
        spd = 1.25,
        h= 100,
        flp=false,
        health=100,
        damage=0
    }
    
    plr['updt'] = function(self)
        if btn(0) then
            self.x = self.x - self.spd
            self.spr = 4
            self.flp=true
        elseif btn(1) then
            self.x = self.x + self.spd
            self.spr = 4
            self.flp=false
        end
        if btn(2) then
            self.y = self.y - self.spd
            self.spr=7
        elseif btn(3) then
            self.y = self.y + self.spd
            self.spr=1
        end
        self:clear_damage()
    end
    
    plr['draw'] = function(self)
        spr(self.spr, self.x, self.y, 1,1, self.flp)
        if self.damage > 0 then
            print(-self.damage, self.x,self.y - 8,8)
        end
    end
    
    plr['damaged']= function (self, damage)
        if damage > 0 then
            self.health = self.health - damage
            self.damage=damage
        end
    end
    
    plr['clear_damage'] = function(self)
        if self.damage>0 and time() % 2 == 0 then
            self.damage = 0
        end
    end
end

function init_enmy()
    local enmy={
        x = rnd(120), 
        y = rnd(120), 
        speed = 0.6, -- velocidade de movimento
        sprite = 17, -- sprite do inimigo
        colision=false,
        damage=flr(rnd(3))
    }
    enmy['spawn_enmy']=function(self, table)
        add(table, self)
    end
    return enmy
end

function init_enmies()
    enmies = {}
    enmies['draw']=function (self)
        for enemy in all(self) do
            spr(enemy.sprite, enemy.x, enemy.y)
          end
    end
    enmies['follow']= function(self)
        for enemy in all(self) do
            -- calcula a distancia entre o inimigo e o jogador
            local dx = plr.x - enemy.x
            local dy = plr.y - enemy.y
            dist = sqrt(dx * dx + dy * dy)
          
            -- verifica se o inimigo
            -- esta perto o suficiente 
            --do jogador para segui-lo
            tile = mget(flr(enemy.x / 8), flr(enemy.y / 8))
            plr_tile = mget(flr(plr.x / 8), flr(plr.y / 8))
            if dist < 35 then
              local angle = atan2(dx, dy)
              new_x = enemy.x + cos(angle) * enemy.speed
              new_y = enemy.y + sin(angle) * enemy.speed
              local tile1 = mget(flr(new_x / 8), flr(new_y / 8))
              local tile2 = mget(flr((new_x + 7) / 8), flr(new_y / 8)) -- obtem o tile no canto superior direito do inimigo
              local tile3 = mget(flr(new_x / 8), flr((new_y + 7) / 8)) -- obtem o tile no canto inferior esquerdo do inimigo
              local tile4 = mget(flr((new_x + 7) / 8), flr((new_y + 7) / 8)) -- obtem o tile no canto inferior direito do inimigo
              if tile1 ~= 6 and tile2~=6
               and tile3~=6 and tile4~=6 then -- se o tile nれこo for uma parede ou uma arvore
                -- atualiza a posicao do inimigo
                enemy.x = new_x
                enemy.y = new_y
              end
              if dist <= 10 then
                  enemy.colision = true
                  if time() % 1 == 0 then
                      plr:damaged(enmy.damage)
                      --local enmy = init_enmy()
                      --enmy:spawn_enmy(enmies)
                  end
              else
                  enemy.colision = false
              end
            end
           end
    end
end