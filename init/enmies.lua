function init_enmy()
    local ex,ey=r_pos()
    return {
        x = ex*8, 
        y = ey*8, 
        speed = 0.6,
        spr = 16,
        col=false, -- shortened from colision
        dmg=flr(rnd(8)+1), -- shortened from damage
        dx=1,
        dy=0,
        min_dist=mid(25,35,55),
        reach=false,
        flp=false,
        hp=ceil(rnd(plr.lvl * 4)),
        biome_spr={
            jurassic={up=20,down=16,left=17,right=20},
            toad={up=51,down=48,left=49,right=49},
            cojado={up=34,down=32,left=33,right=33},
            daniland={up=38,down=37,left=36,right=36}
        },
        w=8,
        h=8,
        collision = function(self)
            local x1,y1 = self.dx, self.dy
            local x2,y2 = self.dx+8, self.dy+8
            
            -- Check if any corner has collision flag 0 or 1
            local c1 = has_flag(x1,y1,0) or has_flag(x1,y1,1)
            local c2 = has_flag(x2,y1,0) or has_flag(x2,y1,1)
            local c3 = has_flag(x1,y2,0) or has_flag(x1,y2,1)
            local c4 = has_flag(x2,y2,0) or has_flag(x2,y2,1)
    
            -- Only update position if no collision
            if not (c1 or c2 or c3 or c4) then
                self.x = self.dx 
                self.y = self.dy
            end
        end,
        add_enmy = function(self, t)
            add(t, self)
        end
    }
end

function init_enmies()
    enmies = {}
    
    enmies.draw = function(self)
        for e in all(self) do
            if e.hurt then
                print(-plr.inv.gun.force, e.x+8, e.y-6, 8)
                if time()%2==0 then e.hurt=false end
            end
            
            local es = e.biome_spr[phase.select]
            if e.reach then
                if plr_dir=='up' then e.spr=es.up e.flp=false
                elseif plr_dir=='down' then e.spr=es.down e.flp=false end
                if plr_dir=='left' then e.spr=es.left e.flp=false
                elseif plr_dir=='right' then e.spr=es.right e.flp=true end
                spr(e.spr, e.x, e.y, 1,1, e.flp)
            else
                spr(es.up, e.x, e.y)
            end
        end
    end
    
    enmies.follow = function(self)
        for e in all(self) do
            local dist,dx,dy = distance(plr,e)
            e.reach = false
            
            if dist < e.min_dist then
                e.reach = true
                local a = atan2(dx,dy)
                e.dx = e.x + cos(a)*e.speed
                e.dy = e.y + sin(a)*e.speed
                e:collision()
                
                if dist <= 7 then
                    e.col = true
                    if time()%0.5==0 then
                        plr:damaged(e.dmg)
                    end
                else
                    e.col = false
                end
            end
        end
    end
end 