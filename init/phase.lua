function init_phase()
    
    phase = {
        map={},
        generated=false
    }

  

    phase['gen_map'] = function(self)
    -- define a seed
    if not self.generated then
    local seed = 126

    -- inicializa o gerador de números pseudo-aleatórios com a seed
    --srand(seed)

        -- define as probabilidades de cada tipo de terreno
        -- define os tiles possれとveis para cada tipo de terreno
    local tiles = {
        grass = {192,193,194,195}, -- tiles de grama
        water = {208,209,210,211}, -- tiles de れくgua
        sand = {224}, -- tiles de areia
        rock = {225} -- tiles de rocha
    }

  -- define as probabilidades de cada tipo de terreno aparecer
  local probs = {
    grass = 0.5, -- 50% de chance de ser grama
    water = 0.1, -- 20% de chance de ser れくgua
    sand = 0.01, -- 15% de chance de ser areia
    rock = 0.01 -- 15% de chance de ser rocha
  }
  local maping = {}

  -- percorre todas as posicoes do mapa
  for x = 0, 127 do
    for y = 0, 31 do
      -- sorteia um nれむmero aleatれはrio entre 0 e 1
      
      local r = rnd(1)
      -- escolhe o tipo de terreno de acordo com a probabilidade
      local terrain
      if r < probs.water then
        terrain = "water"
      elseif r < probs.water + probs.sand then
        terrain = "sand"
      elseif r < probs.water + probs.sand + probs.rock then
        terrain = "rock"
      else
        terrain = "grass"
      end
      if x == 0 or x == 127 or y == 0 or y == 31 then
        -- se estiver, escolhe outro tipo de terreno que nれこo seja れくgua
        while terrain == "water" do
          r = rnd(1)
          if r < probs.sand then
            terrain = "sand"
          elseif r < probs.sand + probs.rock then
            terrain = "rock"
          else
            terrain = "grass"
          end
        end

      end
      if plr.x/8 == x and plr.y/8 == y then
        terrain='grass'
      end
      -- escolhe um tile aleatれはrio do tipo de terreno
      local tile = tiles[terrain][flr(rnd(#tiles[terrain])) + 1]
      mset(x, y, tile)
	    --maping["0"]["1"]=terrain
    end
  end
  self.generated=true
  end
  end
end