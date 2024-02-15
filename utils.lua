f={
    solid=0,
    liq=1,
    colect=2,
    enemy=3
}

function cojado_pallet()
    for i = 0, 15 do
        if i < 2 or i > 13 then
            pal(i, i * 2)
        end
    end
end

function resetPalette()
    for i = 0, 15 do
        pal(i, i)
    end
end


function distance(obj1, obj2)
    local dx = obj1.x - obj2.x
    local dy = obj1.y - obj2.y
    dist = sqrt(dx * dx + dy * dy)
    return dist, dx, dy
end

function has_flag(x, y, flag, coords)
    local tile_x, tile_y = x / 8, y / 8
    if coords then
        return mget(tile_x, tile_y)
    else
        return fget(mget(tile_x, tile_y), flag)
    end
end

function collide(a, b)
    return a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.h > b.y and a.y < b.y + b.h
end

function less_obj_map(obj)
    obj.count+=1
    if obj.count == obj.maxspwn then
      obj.spwn=true
    end
end

function rnd_map(size)
    local x=(rnd(14))+1
    local y=(rnd(14))+1
    return flr(x),flr(y)
end

function is_solid(x, y)
    return has_flag(x,y,0) and has_flag(x,y,0) ~= 64
end

function r_pos()
    local x, y
    repeat
        x, y = rnd_map()
    until not is_solid(x, y)
    return x, y
end

function for_maptile(f, self)
    for x = 0, self.map.w do
        for y = self.map.mnspc, self.map.h do
            f(x,y)
        end
    end
end


function animation(plr, speed, init_sprite, last_sprite, speed_between)
    local animation_speed = speed
    if plr.spr_time < animation_speed then
     plr.spr_time += 1
    else
     if plr['spr'] < last_sprite then
         plr['spr'] += speed_between
     else
         plr['spr'] = init_sprite
     end
     plr.spr_time=0
    end
 end

 function spawn_item(x, y, item_sp)
    local itemx, itemy = r_pos()
    mset(itemx, itemy, item_sp)
end
