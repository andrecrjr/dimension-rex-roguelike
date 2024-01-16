function distance(obj1, obj2)
    local dx = obj1.x - obj2.x
    local dy = obj1.y - obj2.y
    dist = sqrt(dx * dx + dy * dy)
    return dist
end

function collision(obj)
    local tile1, tile2, tile3, tile4 = obj:chck_tile()
    if tile1 ~= 194 and tile2~=194 
    and tile3~=194 and tile4~=194 then
        obj.x = obj.dx 
        obj.y = obj.dy
    end
end

function has_flag(x, y, f)
    -- Substitua 'f' pelo número da flag que indica um tile sólido
    return fget(mget(x, y), f)
  end
  
function char_colision(side, new_x, new_y, flag)
    local tile_size = 8
    if side == "top" then
    return has_flag(flr(new_x / tile_size), 
        flr(new_y / tile_size), flag) or has_flag(
            flr((new_x + plr.w - 1) / tile_size), 
        flr(new_y / tile_size), flag)
    else
        return has_flag(flr(new_x / tile_size), 
        flr((new_y + plr.h - 1) / tile_size), solid_t) or
                has_flag(flr((new_x + plr.w - 1) / tile_size), 
                flr((new_y + plr.h - 1) / tile_size), flag)
    end
end