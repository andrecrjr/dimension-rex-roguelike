function distance(obj1, obj2)
    local dx = obj1.x - obj2.x
    local dy = obj1.y - obj2.y
    dist = sqrt(dx * dx + dy * dy)
    return dist
end

function collision(obj)
    local tile1 = mget(flr(obj.dx / 8), flr(obj.dy / 8))
    local tile2 = mget(flr((obj.dx + 7) / 8), flr(obj.dy / 8))
    local tile3 = mget(flr(obj.dx / 8), flr((obj.dy + 7) / 8))
    local tile4 = mget(flr((obj.dx + 7) / 8), flr((obj.dy + 7) / 8))
    if tile1 ~= 194 and tile2~=194
     and tile3~=194 and tile4~=194 then -- se o tile nれこo for uma parede ou uma arvore
        obj.x = obj.dx 
        obj.y = obj.dy
    end
end