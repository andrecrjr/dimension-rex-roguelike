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
        },
        daniland={
          normal = {173,174}, -- grass
          liq = {213,214}, --liquid/water
          solid = {172, 175}, --tree
          sol_two = {172}, --rock
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
    local biome_options = {"daniland", "cojado", "jurassic", "toad"}
    if not phase.biomes.chose or rnd() < 0.1 then  -- 10% chance to change biome
        phase.select = biome_options[flr(rnd(#biome_options)) + 1]
        phase.biomes.chose = true
    end
  end
  phase['gen_map'] = function(self)
    if not self.generated then
        for x = 0, 15 do
            for y = self.map.mnspc, 15 do
                local r = rnd(1)
                local terrain = "normal"

                if r < self.probs.liq then
                    terrain = "liq"
                elseif r < self.probs.liq + self.probs.solid then
                    terrain = "solid"
                elseif r < self.probs.liq + self.probs.solid + self.probs.sol_two then
                    terrain = "sol_two"
                end

                -- Ensure player spawn area is clear
                local px, py = flr(plr.x / 8), flr(plr.y / 8)
                if abs(x - px) <= 1 and abs(y - py) <= 1 then
                    terrain = "normal"
                end

                local tile = self.biomes[self.select][terrain][flr(rnd(#self.biomes[self.select][terrain])) + 1]
                mset(x, y, tile)
            end
        end
        self.generated = true
        self:spwn_enemies()
        self:pos_gen()
        self:drop_items()
    end
end

  phase['env_effects'] = function(phase)
    if plr:collision(f.liq) then
      plr.spd = 0.58
      plr.in_liq = true
      plr.inv.gun.active=false
    else
      plr.spd = 1
      plr.in_liq = false
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
      
      -- Scale difficulty with player level
      local difficulty_factor = min(plr.lvl / 4, 1)  -- Caps at 1 when player is level 4+
      
      -- At higher levels, portals are more likely to be guarded by enemies
      if plr.lvl >= 3 then
          -- Spawn guardian enemies near portal
          local guardian_count = flr(1 + plr.lvl/2)
          for i=1,guardian_count do
              local offset_x = flr(rnd(3)) - 1  -- -1, 0, or 1
              local offset_y = flr(rnd(3)) - 1  -- -1, 0, or 1
              
              -- Don't place enemy directly on portal
              if offset_x != 0 or offset_y != 0 then 
                  local ex, ey = mid(0, trx + offset_x, 15), mid(11, try + offset_y, 15)
                  
                  -- Only place if not solid
                  if not is_solid(ex, ey) then
                      local g_enmy = init_enmy()
                      g_enmy.x = ex * 8
                      g_enmy.y = ey * 8
                      g_enmy.hp = g_enmy.hp * (1 + difficulty_factor)
                      g_enmy.damage = g_enmy.damage * (1 + difficulty_factor)
                      g_enmy.xp_value += plr.lvl  -- More XP for these tough guardians
                      g_enmy:add_enmy(enmies)
                  end
              end
          end
      end
      
      -- Ensure the portal is not placed on a solid tile and is within map bounds
      while is_solid(trx, try) or trx < 0 or trx > 15 or try < 0 or try > 15 do
          trx, try = r_pos()
      end
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
    -- Scale enemy count and difficulty with player level
    init_enmies()
    
    -- Base enemy count scaling with level
    local base_count = 8  -- Starting count
    local level_bonus = flr(plr.lvl * 1.2)  -- Additional enemies per level
    local enemy_count = base_count + level_bonus
    
    -- Cap maximum enemies based on map size to prevent overcrowding
    enemy_count = min(enemy_count, 25)
    
    for i = 1, enemy_count do
        local enmy = init_enmy()
        
        -- Scale enemy stats with player level
        if plr.lvl > 1 then
            local level_scaling = 1 + ((plr.lvl - 1) * 0.15)  -- 15% stronger per level
            enmy.hp = flr(enmy.hp * level_scaling)
            enmy.damage = flr(enmy.damage * sqrt(level_scaling))  -- Damage scales more slowly
            
            -- Increase XP value for tougher enemies
            if plr.lvl >= 3 then
                enmy.xp_value += 1
            end
            if plr.lvl >= 6 then
                enmy.xp_value += 1
            end
        end
        
        enmy:add_enmy(enmies)
    end
    
    -- At higher levels, add a small chance for special stronger enemies
    if plr.lvl >= 4 and rnd(10) < 3 then  -- 30% chance
        local elite = init_enmy()
        local ex, ey = r_pos()
        elite.x = ex * 8
        elite.y = ey * 8
        elite.hp = elite.hp * 3
        elite.damage = elite.damage * 2
        elite.xp_value = elite.xp_value * 3
        elite:add_enmy(enmies)
    end
  end
  
end