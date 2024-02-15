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
          normal = {192, 193, 194}, -- grass
          liq = {208,209}, --liquid/water
          solid = {195}, --tree
          sol_two = {225}, --rock
      },
      select="jurassic",
      biomes={
        chose=false,
        jurassic={
            normal = {192, 193, 194}, -- grass
            liq = {208,209}, --liquid/water
            solid = {195}, --tree
            sol_two = {225}, --rock
            bgcolor=3
        },
        toad={
          normal = {176, 177}, -- grass
          liq = {208,209}, --liquid/water
          solid = {179}, --tree
          sol_two = {178}, --rock
          bgcolor=2
        },
        cojado={--cemetery
          normal = {191,191,191}, -- grass
          liq = {212,211}, --liquid/water
          solid = {188, 189}, --tree
          sol_two = {190}, --rock
          bgcolor=13
        }
      },
      probs = {
        normal = rnd(0.2)+0.1, -- normal
        liq = 0.12, -- water
        solid=rnd(0.06)+0.02,
        sand = 0.01, -- sand(?)
        sol_two = 0.04, -- rock
      }
    }
  phase["biome_rnd"]=function(phase)
    if not phase.biomes.chose then
        local biome_options = {"jurassic", "toad", "cojado"}
        phase.select = biome_options[flr(rnd(#biome_options)) + 1]
        phase.biomes.chose = true
    end
  end
  phase['gen_map'] = function(self)
    -- define a seed
    if not self.generated then
      local spwn = false
      -- inicializa o gerador de números pseudo-aleatórios com a seed
    for_maptile(function(x, y)
        local r = rnd(1)
        local terrain
        if r < self.probs.liq then
          terrain = "liq"
        elseif r < self.probs.liq + self.probs.solid then
          terrain = "solid"
        elseif r < self.probs.liq + self.probs.solid + self.probs.sol_two then
          terrain = "sol_two"
        else
          terrain = "normal"
        end
        if plr.x/8 == x and plr.y/8 == y then
            terrain="normal"
        end
        local tile = self.biomes[self.select][terrain][flr(rnd(#self.tiles[terrain])) + 1]
        mset(x, y, tile)
      end
    , self)
    self.generated=true
    self:spwn_enemies()
    self:pos_gen()
    self:drop_items()
    end
  end

  phase['env_effects'] = function(phase)
    if plr:collision(f.liq) then
      --water env effect
      plr.spd = 0.58
      plr.spr = 8
      plr.inv.gun.active=false
    else
      plr.spd = 1
      plr.inv.gun.active=true
    end
    if phase.select == "cojado" then
      cojado_pallet()
    else
      resetPalette()
    end
  end

  phase['pos_gen'] = function (phase)
    local portal= {sp=226, spwn=false, count=0, maxspwn=1}
    if not portal.spwn then
      local trx,try=r_pos()
      mset(mid(0,trx, 15), mid(11, try, 15), portal.sp)
      less_obj_map(portal)
      portal.spwn=true
    end
  end

  phase['drop_items'] = function(self) 
    local gun = {sp=240, spwn=false, maxspwn=flr(rnd(2)+1), count=0}
    local tr = {prob=0.000095, sp=241, spwn=false, maxspwn=1}
    local hp = {prob=0.005, sp=242, spwn=false, count=0, maxspwn=2}
    if self.generated and not self.gen_itens then
      for_maptile(function(x, y)
        local r = rnd(1)
        local tile = mget(x, y)
        if not fget(tile, 0) then
            if not gun.spwn then
                spawn_item(x, y, 240)
                less_obj_map(gun)
            elseif not tr.spwn and r < tr.prob then
                spawn_item(x, y, tr.sp)
                tr.spwn = true
            elseif not hp.spwn and r < hp.prob then
                spawn_item(x, y, hp.sp)
                less_obj_map(hp)
            end
        end
      end, self)
      self.gen_itens=true
    end
  end

  phase['get_itms']=function(self)
      local plrx=flr(plr.x/8) local plry=flr(plr.y/8)
      local item = plr:collision(2,true)
      get_item=not get_item
      if item == 242 then
        plr.health=plr.health+flr(rnd(25)+5)
        mset(plrx, plry, 0)
      elseif item==240 then
        mset(plrx, plry, 0)
        if not plr.inv.gun then
          plr.inv.gun=true
        else
          plr.inv.gun.count+=4
        end
      elseif item==226 then
        restart=true
    end
  end


  phase['spwn_enemies']=function(self)
    enmies:draw()
  end
  
end