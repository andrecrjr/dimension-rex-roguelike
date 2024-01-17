function init_phase()
    
    phase = {
        map={
          w=120,
          h=30,
          wmap=127,
          hmap=126,
          mnspc=1 --menuspace
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
        tree=rnd(0.03)+0.1,
        sand = 0.01, -- 15% de chance de ser areia
        rock = 0.01 -- 15% de chance de ser rocha
      }
    }  

  phase['gen_map'] = function(self)
    -- define a seed
    if not self.generated then
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
    local gun = {prob=1, sp=240, spwn=false}
    local tr = {prob=0.00009, sp=241, spwn=false}
    if self.generated and not self.gen_itens then
      for x = 0, self.map.w do
        for y = self.map.mnspc, self.map.h do
          local r = rnd(1)
          local tile = mget(x, y)
          if tile != 194 and r < gun.prob and not gun.spwn then
            local gunx=flr(rnd(self.map.wmap))/8 local guny=flr(rnd(self.map.hmap))/8
            mset(gunx, guny, 240)
            gun.spwn=true
          end
          printh(r < tr.prob)
          if tile != 194 and r < tr.prob and not tr.spwn then
            local trx=flr(rnd(self.map.wmap))/8 local try=flr(rnd(self.map.hmap))/8
            mset(trx, try, tr.sp)
            tr.spwn=true
          end
        end
      end
      self.gen_itens=true
    end
  end
end