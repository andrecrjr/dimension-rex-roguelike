function init_phase()
    
    phase = {
        map={
          w=120,
          h=30,
          wmap=127,
          hmap=126,
          mnspc=1,--menuspace
          xmin = 0,
          xmax = 128 - 8,
          ymin = 8,
          ymax = 128 - 8
        },
        generated=false,
        gen_itens=false,
        tiles={
          grass = {192, 193}, -- tiles de grama
          water = {208,209,210,211}, -- tiles de れくgua
          tree = {194}, -- tiles de areia
          rock = {225} -- tiles de rocha
      },
      probs = {
        grass = rnd(0.4)+0.1, -- 50% de chance de ser grama
        water = 0.1, -- 20% de chance de ser れくgua
        tree=rnd(0.03)+0.08,
        sand = 0.01, -- 15% de chance de ser areia
        rock = 0.01 -- 15% de chance de ser rocha
      },
      solid_coords={},
      itens_coords={}
    }  

  phase['gen_map'] = function(self)
    -- define a seed
    if not self.generated then
      cls(3)
      local spwn = false
      -- inicializa o gerador de números pseudo-aleatórios com a seed
      for x = 0, self.map.w do
        for y = self.map.mnspc, self.map.h-2 do
          
          -- sorteia um nれむmero aleatれはrio entre 0 e 1
          local r = rnd(1)
          -- escolhe o tipo de terreno de acordo com a probabilidade
          local terrain
          if r < self.probs.water then
            terrain = "water"
          elseif r < self.probs.water + self.probs.tree then
            terrain = "tree"
            local sold={x=x*8,y=y*8}
            add(self.solid_coords, sold)
          elseif r < self.probs.water + self.probs.tree + self.probs.rock then
            terrain = "rock"
          else
            terrain = "grass"
          end

          if x == 0 or x == self.map.w or y == 0 or y == self.map.h then
            -- se estiver, escolhe outro tipo de terreno que nれこo seja れくgua
            while terrain == "water" do
              r = rnd(1)
              if r < self.probs.tree then
                terrain = "tree"
              elseif r < self.probs.tree + self.probs.rock then
                terrain = "rock"
              else
                terrain = "grass"
              end
            end

          end
          if plr.x/8 == x and plr.y/8 == y then
              terrain="grass"
          end
          
          local tile = self.tiles[terrain][flr(rnd(#self.tiles[terrain])) + 1]
          mset(x, y, tile)
        end
      end
        self.generated=true
      end
  end

  phase['drop_items'] = function(self) 
    local gun = { sp=240, spwn=false, maxspwn=2}
    local tr = {prob=0.00009, sp=241, spwn=false, maxspwn=1}
    local hp = {prob=0.005, sp=242, spwn=false, count=0, maxspwn=3}
    local rkey= {sp=226, spwn=false, maxspwn=1, count=0}
    if self.generated and not self.gen_itens then
      for x = 0, self.map.w do
        for y = self.map.mnspc, self.map.h do
          local r = rnd(1)
          local tile = mget(x, y)
          if  not fget(tile, 0) and not gun.spwn then
            local gunx,guny=r_pos()
            mset(gunx, guny, 240)
            gun.spwn=true
          end
          if not fget(tile, 0) and r < tr.prob and not tr.spwn then
            local trx,try=r_pos()
            mset(trx, try, tr.sp)
            tr.spwn=true
          end
          if not fget(tile, 0) and r < hp.prob and not hp.spwn then
            local trx,try=r_pos()
            mset(trx, try, hp.sp)
            less_obj_map(hp)
          end
          if not fget(tile, 0) and not rkey.spwn then
            local trx,try=r_pos()
            mset(trx, try, rkey.sp)
            less_obj_map(rkey)
          end
        end
      end
      self.gen_itens=true
    end
  end

  phase['get_itms']=function(self)
    local get_item=false
    if plr:collision(2) and not get_item then
      local plrx=flr(plr.x/8) local plry=flr(plr.y/8)
      local item = plr:collision(2,true)
      get_item=not get_item
      printh(item)
      if item == 242 then
        plr.health=plr.health+25.5
        mset(plrx, plry, 0)
      elseif item==240 then
        printh("entrei tb")
        mset(plrx, plry, 0)
        if not plr.inv.gun then
          plr.inv.gun=true
        else
          plr.inv.gun.spd=plr.inv.gun.spd+0.2
          plr.inv.gun.count+=4
        end
      elseif item==226 then
        restart=true
      end
    end
  end

  phase['spwn_enemies']=function(self)
    enmies:draw()
  end
  
end