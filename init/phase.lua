function init_phase()
    
    phase = {
        map={},
        generated=false,
        gen_itens=false,
        tiles={
          grass = {192,192,192,192,192,192,192,192,193,193,194}, -- tiles de grama
          water = {208,209,210,211}, -- tiles de れくgua
          sand = {224}, -- tiles de areia
          rock = {225} -- tiles de rocha
      },
      probs = {
        grass = 0.5, -- 50% de chance de ser grama
        water = 0.1, -- 20% de chance de ser れくgua
        sand = 0.01, -- 15% de chance de ser areia
        rock = 0.01 -- 15% de chance de ser rocha
      }
    }

  

  phase['gen_map'] = function(self)
    -- define a seed
    if not self.generated then
      local seed = 126
      -- inicializa o gerador de números pseudo-aleatórios com a seed
      --srand(seed)
      for x = 0, 127 do
        for y = 0, 31 do
          -- sorteia um nれむmero aleatれはrio entre 0 e 1
          local r = rnd(1)
          -- escolhe o tipo de terreno de acordo com a probabilidade
          local terrain
          if r < self.probs.water then
            terrain = "water"
          elseif r < self.probs.water + self.probs.sand then
            terrain = "sand"
          elseif r < self.probs.water + self.probs.sand + self.probs.rock then
            terrain = "rock"
          else
            terrain = "grass"
          end
          if x == 0 or x == 127 or y == 0 or y == 31 then
            -- se estiver, escolhe outro tipo de terreno que nれこo seja れくgua
            while terrain == "water" do
              r = rnd(1)
              if r < self.probs.sand then
                terrain = "sand"
              elseif r < self.probs.sand + self.probs.rock then
                terrain = "rock"
              else
                terrain = "grass"
              end
            end

          end
          if plr.x/8 == x and plr.y/8 == y then
            terrain='grass'
          end
          local tile = self.tiles[terrain][flr(rnd(#self.tiles[terrain])) + 1]
          mset(x, y, tile)
        end
      end
        self.generated=true
      end
  end

  phase['drop_items'] = function(self) 
    local gun = {prob=0.5, sp=240, spwn=false}
    if self.generated and not self.gen_itens then
      for x = 0, 127 do
        for y = 0, 31 do
          local r = rnd(1)
          local tile = mget(x, y)
          if tile != 194 and r<gun.prob and not gun.spwn then
            mset(x, y, 240)
            gun.spwn=true
          end
          if tile != 194 and r < 0.055 then
            --mset(x, y, 240)
          end
        end
      end
      self.gen_itens=true
    end
  end
end