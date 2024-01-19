function distance(obj1, obj2)
    local dx = obj1.x - obj2.x
    local dy = obj1.y - obj2.y
    dist = sqrt(dx * dx + dy * dy)
    return dist
end

function has_flag(x, y, f,coords)
    -- Substitua 'f' pelo número da flag que indica um tile sólido
    if coords==true then
        return mget(x, y)
    end
    return fget(mget(x, y), f)
end

function collide(a, b)
    return a.x + a.w > b.x and a.x < b.x + b.w and a.y + a.h > b.y and a.y < b.y + b.h
end

function r_pos()
    local rx = flr(rnd(phase.map.wmap))/8 local ry=flr(rnd(phase.map.hmap))/8
    return rx, ry
end

function less_obj_map(obj)
    obj.count+=1
    if obj.count == obj.maxspwn then
      obj.spwn=true
    end
end