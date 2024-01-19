function init_inv()
    plr.inv.gun.draw=function(bul)
        if bul.active then
            spr(bul.spr, bul.x, bul.y)
        end
    end

    plr.inv.gun.shoot=function(bul)
        if not bul.active then
            return
        end
        bul.active = true
        bul.x = plr.x  
        bul.y = plr.y 
        bul.dir = plr_dir
    end
    
    plr.inv.gun.updt = function(bul)

        if not bul.active then
            return
        end
        if bul.count == 0 then
            bul.active=false
        end

        if bul.dir == "left" then
            bul.x = bul.x - bul.spd
        elseif bul.dir == "right" then
            bul.x = bul.x + bul.spd
        elseif bul.dir == "up" then
            bul.y = bul.y - bul.spd
        elseif bul.dir == "down" then
            bul.y = bul.y + bul.spd
        end
           
        local tile = mget(flr(bul.x / 8), flr(bul.y / 8))
        local flag = fget(tile, 0) 
        if bul.x < 0 or bul.x > 127 or 
            bul.y < 0 or bul.y > 127 or flag then
            bul.x = -100
        end
        for enemy in all(enmies) do 
            if collide(bul, enemy) then 
              del(enmies, enemy)
              bul.x=-100
            end
        end
        
    end
end