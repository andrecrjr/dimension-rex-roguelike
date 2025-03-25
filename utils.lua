f={
    solid=0,
    liq=1,
    colect=2,
    enemy=3
}

function cojado_pallet()
    for i=0,15 do
        if i<2 or i>13 then pal(i,i*2) end
    end
end

function resetPalette()
    for i=0,15 do pal(i,i) end
end

function distance(a,b)
    local dx,dy = a.x-b.x, a.y-b.y
    return sqrt(dx*dx+dy*dy),dx,dy
end

function has_flag(x,y,flag,coords)
    local tx,ty = x/8, y/8
    if coords then
        return mget(tx,ty)
    else
        return fget(mget(tx,ty),flag)
    end
end

function collide(a,b)
    return a.x+a.w>b.x and a.x<b.x+b.w and a.y+a.h>b.y and a.y<b.y+b.h
end

function less_obj_map(obj)
    obj.count+=1
    if obj.count==obj.maxspwn then obj.spwn=true end
end

function rnd_map()
    local x,y = (rnd(14))+1, (rnd(14))+1
    return flr(x),flr(y)
end

function is_solid(x,y)
    return has_flag(x,y,0) and has_flag(x,y,0)~=64
end

function r_pos()
    local x,y
    repeat x,y=rnd_map() until not is_solid(x,y)
    return x,y
end

function for_maptile(f,self)
    for x=0,self.map.w do
        for y=self.map.mnspc,self.map.h do
            f(x,y)
        end
    end
end

function animation(obj,spd,i_spr,l_spr,spd_btw)
    if obj.spr_time<spd then
        obj.spr_time+=1
    else
        if obj.spr<l_spr then
            obj.spr+=spd_btw
        else
            obj.spr=i_spr
        end
        obj.spr_time=0
    end
end

function spawn_item(x,y,item_sp)
    local ix,iy=r_pos()
    mset(ix,iy,item_sp)
end

function approach(cur,tgt,step)
    if cur<tgt then
        return min(cur+step,tgt)
    elseif cur>tgt then
        return max(cur-step,tgt)
    end
    return cur
end
