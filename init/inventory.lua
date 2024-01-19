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

        -- se sim, move o projétil de acordo com sua direção e velocidade
        if bul.dir == "left" then
            bul.x = bul.x - bul.spd
        elseif bul.dir == "right" then
            bul.x = bul.x + bul.spd
        elseif bul.dir == "up" then
            bul.y = bul.y - bul.spd
        elseif bul.dir == "down" then
            bul.y = bul.y + bul.spd
        end
           
        local tile = mget(flr(bul.x / 8), flr(bul.y / 8)) -- obtém o tile na posição do projétil
        local flag = fget(tile, 0) -- obtém o valor do flag 0 do tile
        if bul.x < 0 or bul.x > 127 or 
            bul.y < 0 or bul.y > 127 or flag then
            -- se sim, desativa o projétil
            bul.x = -100
        end
        for enemy in all(enmies) do -- percorre todos os inimigos na tabela
            if collide(bul, enemy) then -- verifica se o projétil colidiu com o inimigo
              -- se sim, faz alguma ação, como reduzir a vida do inimigo, tocar um som, etc.
              del(enmies, enemy)
              bul.x=-100
            end
        end
        
    end
end