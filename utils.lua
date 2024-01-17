function distance(obj1, obj2)
    local dx = obj1.x - obj2.x
    local dy = obj1.y - obj2.y
    dist = sqrt(dx * dx + dy * dy)
    return dist
end

function has_flag(x, y, f)
    -- Substitua 'f' pelo número da flag que indica um tile sólido
    return fget(mget(x, y), f)
  end
  