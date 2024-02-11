function distance(obj1, obj2)
    local dx = obj1.x - obj2.x
    local dy = obj1.y - obj2.y
    dist = sqrt(dx * dx + dy * dy)
    return dist
end

function has_flag(x, y, f,coords)
    -- Substitua 'f' pelo número da flag que indica um tile sólido
    local flx, fly = flr(x)/8, flr(y)/8
    if coords==true then
        return mget(flx, fly)
    end
    return fget(mget(flx, fly), f)
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
    local x=rnd(phase.map.wmap)/8
    local y=rnd(phase.map.hmap)/8+1

    return flr(x),flr(y)
end

-- verifica se um tile é sólido
function is_solid(x, y)
    return has_flag(x,y,0)
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