-- advanced-mining-drills.lua

local mining_tier_scaling = 2
local base_resource_drain = 100

local function item_sound(filename, volume)
  return
  {
    filename = "__base__/sound/item/"..filename,
    volume = volume,
    aggregation = {max_count = 1, remove = true},
  }
end

local function calc_energy_usage(tier)
  local base_energy = 90
  local new_energy = base_energy * (mining_tier_scaling ^ tier)
  return tostring(new_energy) .. "kW"
end

local function calc_big_energy_usage(tier)
  local base_energy = 300
  local new_energy = base_energy * (mining_tier_scaling ^ tier)
  return tostring(new_energy) .. "kW"
end

local function calc_mining_speed(tier)
  return 0.5 * (mining_tier_scaling ^ tier)
end

local function calc_big_mining_speed(tier)
  return 2.5 * (mining_tier_scaling ^ tier)
end

local function calc_module_slots(tier)
  return 3 + tier
end

local function calc_big_module_slots(tier)
  return 4 + tier
end

local function calc_resource_drain(tier)
  local new_drain = 100 - (10 * tier)
  if new_drain < 1 then
    new_drain = 1
  end
  return new_drain
end

local function calc_big_resource_drain(tier)
  local new_drain = 50 - (10 * tier)
  if new_drain < 1 then
    new_drain = 1
  end
  return new_drain
end

local function calc_crafting()
  local crafting_count = math.ceil(mining_tier_scaling * 1.2)
  if crafting_count == mining_tier_scaling then
    crafting_count = crafting_count + 1
  end
  return crafting_count
end

local advanced_drill = util.table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
advanced_drill.name = "advanced-mining-drill"
advanced_drill.next_upgrade = "elite-mining-drill"
advanced_drill.energy_usage = calc_energy_usage(1)
advanced_drill.mining_speed = calc_mining_speed(1)
advanced_drill.module_slots = calc_module_slots(1)
advanced_drill.resource_drain_rate_percent = calc_resource_drain(1)
advanced_drill.fast_replaceable_group = "mining-drill"
advanced_drill.minable = {mining_time = 0.3, result = advanced_drill.name}

local elite_drill = util.table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
elite_drill.name = "elite-mining-drill"
elite_drill.next_upgrade = "ultimate-mining-drill"
elite_drill.energy_usage = calc_energy_usage(2)
elite_drill.mining_speed = calc_mining_speed(2)
elite_drill.module_slots = calc_module_slots(2)
elite_drill.resource_drain_rate_percent = calc_resource_drain(2)
elite_drill.fast_replaceable_group = "mining-drill"
elite_drill.minable = {mining_time = 0.3, result = elite_drill.name}

local ultimate_drill = util.table.deepcopy(data.raw["mining-drill"]["electric-mining-drill"])
ultimate_drill.name = "ultimate-mining-drill"
--ultimate_drill.next_upgrade = "quantum-mining-drill"
ultimate_drill.energy_usage = calc_energy_usage(3)
ultimate_drill.mining_speed = calc_mining_speed(3)
ultimate_drill.module_slots = calc_module_slots(3)
ultimate_drill.resource_drain_rate_percent = calc_resource_drain(3)
ultimate_drill.fast_replaceable_group = "mining-drill"
ultimate_drill.minable = {mining_time = 0.3, result = ultimate_drill.name}

local big_advanced_drill = util.table.deepcopy(data.raw["mining-drill"]["big-mining-drill"])
big_advanced_drill.name = "big-advanced-mining-drill"
big_advanced_drill.next_upgrade = "big-elite-mining-drill"
big_advanced_drill.energy_usage = calc_big_energy_usage(1)
big_advanced_drill.mining_speed = calc_big_mining_speed(1)
big_advanced_drill.module_slots = calc_big_module_slots(1)
big_advanced_drill.resource_drain_rate_percent = calc_big_resource_drain(1)
big_advanced_drill.fast_replaceable_group = "big-mining-drill"
big_advanced_drill.minable = {mining_time = 0.3, result = big_advanced_drill.name}
big_advanced_drill.hidden = false

local big_elite_drill = util.table.deepcopy(data.raw["mining-drill"]["big-mining-drill"])
big_elite_drill.name = "big-elite-mining-drill"
big_elite_drill.next_upgrade = "big-ultimate-mining-drill"
big_elite_drill.energy_usage = calc_big_energy_usage(2)
big_elite_drill.mining_speed = calc_big_mining_speed(2)
big_elite_drill.module_slots = calc_big_module_slots(2)
big_elite_drill.resource_drain_rate_percent = calc_big_resource_drain(2)
big_elite_drill.fast_replaceable_group = "big-mining-drill"
big_elite_drill.minable = {mining_time = 0.3, result = big_elite_drill.name}
big_elite_drill.hidden = false

local big_ultimate_drill = util.table.deepcopy(data.raw["mining-drill"]["big-mining-drill"])
big_ultimate_drill.name = "big-ultimate-mining-drill"
--big_ultimate_drill.next_upgrade = "big-quantum-mining-drill"
big_ultimate_drill.energy_usage = calc_big_energy_usage(3)
big_ultimate_drill.mining_speed = calc_big_mining_speed(3)
big_ultimate_drill.module_slots = calc_big_module_slots(3)
big_ultimate_drill.resource_drain_rate_percent = calc_big_resource_drain(3)
big_ultimate_drill.fast_replaceable_group = "big-mining-drill"
big_ultimate_drill.minable = {mining_time = 0.3, result = big_ultimate_drill.name}
big_ultimate_drill.hidden = false

advanced_drill.graphics_set.animation.east.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-E.png"
advanced_drill.graphics_set.working_visualisations[7].east_animation.filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-E-front.png"
advanced_drill.wet_mining_graphics_set.working_visualisations[13].east_animation.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-E-wet-front.png"
advanced_drill.wet_mining_graphics_set.animation.east.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-E-wet.png"
advanced_drill.graphics_set.animation.north.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-N.png"
advanced_drill.wet_mining_graphics_set.animation.north.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-N-wet.png"
advanced_drill.graphics_set.working_visualisations[7].south_animation.layers[2].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-S-front.png"
advanced_drill.wet_mining_graphics_set.working_visualisations[13].south_animation.layers[2].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-S-wet-front.png"
advanced_drill.graphics_set.animation.west.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-W.png"
advanced_drill.graphics_set.working_visualisations[7].west_animation.filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-W-front.png"
advanced_drill.wet_mining_graphics_set.working_visualisations[13].west_animation.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-W-wet-front.png"
advanced_drill.wet_mining_graphics_set.animation.west.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/advanced-mining-drill/electric-mining-drill-W-wet.png"

elite_drill.graphics_set.animation.east.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-E.png"
elite_drill.graphics_set.working_visualisations[7].east_animation.filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-E-front.png"
elite_drill.wet_mining_graphics_set.working_visualisations[13].east_animation.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-E-wet-front.png"
elite_drill.wet_mining_graphics_set.animation.east.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-E-wet.png"
elite_drill.graphics_set.animation.north.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-N.png"
elite_drill.wet_mining_graphics_set.animation.north.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-N-wet.png"
elite_drill.graphics_set.working_visualisations[7].south_animation.layers[2].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-S-front.png"
elite_drill.wet_mining_graphics_set.working_visualisations[13].south_animation.layers[2].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-S-wet-front.png"
elite_drill.graphics_set.animation.west.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-W.png"
elite_drill.graphics_set.working_visualisations[7].west_animation.filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-W-front.png"
elite_drill.wet_mining_graphics_set.working_visualisations[13].west_animation.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-W-wet-front.png"
elite_drill.wet_mining_graphics_set.animation.west.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/elite-mining-drill/electric-mining-drill-W-wet.png"

ultimate_drill.graphics_set.animation.east.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-E.png"
ultimate_drill.graphics_set.working_visualisations[7].east_animation.filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-E-front.png"
ultimate_drill.wet_mining_graphics_set.working_visualisations[13].east_animation.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-E-wet-front.png"
ultimate_drill.wet_mining_graphics_set.animation.east.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-E-wet.png"
ultimate_drill.graphics_set.animation.north.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-N.png"
ultimate_drill.wet_mining_graphics_set.animation.north.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-N-wet.png"
ultimate_drill.graphics_set.working_visualisations[7].south_animation.layers[2].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-S-front.png"
ultimate_drill.wet_mining_graphics_set.working_visualisations[13].south_animation.layers[2].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-S-wet-front.png"
ultimate_drill.graphics_set.animation.west.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-W.png"
ultimate_drill.graphics_set.working_visualisations[7].west_animation.filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-W-front.png"
ultimate_drill.wet_mining_graphics_set.working_visualisations[13].west_animation.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-W-wet-front.png"
ultimate_drill.wet_mining_graphics_set.animation.west.layers[1].filename = "__Advanced-Mining-Drills__/graphics/entity/ultimate-mining-drill/electric-mining-drill-W-wet.png"

-- @TODO: Big Advanced Drills

local advanced_drill_item = {
  type = "item",
  name = advanced_drill.name,
  icon = "__Advanced-Mining-Drills__/graphics/icons/advanced-mining-drill.png",
  subgroup = "extraction-machine",
  order = "a[items]-bb[advanced-mining-drill]",
  inventory_move_sound = item_sound("drill-inventory-move.ogg", 0.8),
  pick_sound = item_sound("drill-inventory-pickup.ogg", 0.8),
  drop_sound = item_sound("drill-inventory-move.ogg", 0.8),
  place_result = advanced_drill.name,
  stack_size = 50
}

local elite_drill_item = {
  type = "item",
  name = elite_drill.name,
  icon = "__Advanced-Mining-Drills__/graphics/icons/elite-mining-drill.png",
  subgroup = "extraction-machine",
  order = "a[items]-bc[elite-mining-drill]",
  inventory_move_sound = item_sound("drill-inventory-move.ogg", 0.8),
  pick_sound = item_sound("drill-inventory-pickup.ogg", 0.8),
  drop_sound = item_sound("drill-inventory-move.ogg", 0.8),
  place_result = elite_drill.name,
  stack_size = 50
}

local ultimate_drill_item = {
  type = "item",
  name = ultimate_drill.name,
  icon = "__Advanced-Mining-Drills__/graphics/icons/ultimate-mining-drill.png",
  subgroup = "extraction-machine",
  order = "a[items]-bd[ultimate-mining-drill]",
  inventory_move_sound = item_sound("drill-inventory-move.ogg", 0.8),
  pick_sound = item_sound("drill-inventory-pickup.ogg", 0.8),
  drop_sound = item_sound("drill-inventory-move.ogg", 0.8),
  place_result = ultimate_drill.name,
  stack_size = 50
}

local big_advanced_drill_item = {
  type = "item",
  name = big_advanced_drill.name,
  icon = "__Advanced-Mining-Drills__/graphics/icons/big-advanced-mining-drill.png",
  subgroup = "extraction-machine",
  order = "a-a-ab",
  inventory_move_sound = item_sound("drill-inventory-move.ogg", 0.8),
  pick_sound = item_sound("drill-inventory-pickup.ogg", 0.8),
  drop_sound = item_sound("drill-inventory-move.ogg", 0.8),
  place_result = big_advanced_drill.name,
  stack_size = 20
}

local big_elite_drill_item = {
  type = "item",
  name = big_elite_drill.name,
  icon = "__Advanced-Mining-Drills__/graphics/icons/big-elite-mining-drill.png",
  subgroup = "extraction-machine",
  order = "a-a-ac",
  inventory_move_sound = item_sound("drill-inventory-move.ogg", 0.8),
  pick_sound = item_sound("drill-inventory-pickup.ogg", 0.8),
  drop_sound = item_sound("drill-inventory-move.ogg", 0.8),
  place_result = big_elite_drill.name,
  stack_size = 20
}

local big_ultimate_drill_item = {
  type = "item",
  name = big_ultimate_drill.name,
  icon = "__Advanced-Mining-Drills__/graphics/icons/big-ultimate-mining-drill.png",
  subgroup = "extraction-machine",
  order = "a-a-ad",
  inventory_move_sound = item_sound("drill-inventory-move.ogg", 0.8),
  pick_sound = item_sound("drill-inventory-pickup.ogg", 0.8),
  drop_sound = item_sound("drill-inventory-move.ogg", 0.8),
  place_result = big_ultimate_drill.name,
  stack_size = 20
}

local advanced_drill_recipe = {
  type = "recipe",
  name = advanced_drill.name,
  energy_required = 2,
  enabled = true,
  ingredients = {{type = "item", name = "electric-mining-drill", amount = calc_crafting()},{type = "item", name = "electronic-circuit", amount = 10},{type = "item", name = "steel-plate", amount = 10}},
  results = {{type = "item", name = advanced_drill.name, amount = 1}}
}

local elite_drill_recipe = {
  type = "recipe",
  name = elite_drill.name,
  energy_required = 2,
  enabled = true,
  ingredients = {{type = "item", name = "advanced-mining-drill", amount = calc_crafting()},{type = "item", name = "advanced-circuit", amount = 5},{ type = "item", name = "battery", amount = 5}},
  results = {{type = "item", name = elite_drill.name, amount = 1}}
}

local ultimate_drill_recipe = {
  type = "recipe",
  name = ultimate_drill.name,
  energy_required = 2,
  enabled = true,
  ingredients = {{type = "item", name = "elite-mining-drill", amount = calc_crafting()},{type = "item", name = "processing-unit", amount = 2},{type = "item", name = "speed-module", amount = 4}},
  results = {{type = "item", name = ultimate_drill.name, amount = 1}}
}

local big_advanced_drill_recipe = {
  type = "recipe",
  name = big_advanced_drill.name,
  energy_required = 2,
  enabled = true,
  ingredients = {{type = "item", name = "big-mining-drill", amount = calc_crafting()},{type = "item", name = "electronic-circuit", amount = 10},{type = "item", name = "steel-plate", amount = 10}},
  results = {{type = "item", name = big_advanced_drill.name, amount = 1}}
}

local big_elite_drill_recipe = {
  type = "recipe",
  name = big_elite_drill.name,
  energy_required = 2,
  enabled = true,
  ingredients = {{type = "item", name = "big-advanced-mining-drill", amount = calc_crafting()},{type = "item", name = "advanced-circuit", amount = 5},{ type = "item", name = "battery", amount = 5}},
  results = {{type = "item", name = big_elite_drill.name, amount = 1}}
}

local big_ultimate_drill_recipe = {
  type = "recipe",
  name = big_ultimate_drill.name,
  energy_required = 2,
  enabled = true,
  ingredients = {{type = "item", name = "big-elite-mining-drill", amount = calc_crafting()},{type = "item", name = "processing-unit", amount = 2},{type = "item", name = "speed-module", amount = 4}},
  results = {{type = "item", name = big_ultimate_drill.name, amount = 1}}
}

print("uniquesequence")
print(data.raw["mining-drill"]["big-mining-drill"])

data:extend(
{
  advanced_drill, advanced_drill_item, advanced_drill_recipe,
  elite_drill, elite_drill_item, elite_drill_recipe,
  ultimate_drill, ultimate_drill_item, ultimate_drill_recipe,
  big_advanced_drill, big_advanced_drill_item, big_advanced_drill_recipe,
  big_elite_drill, big_elite_drill_item, big_elite_drill_recipe,
  big_ultimate_drill, big_ultimate_drill_item, big_ultimate_drill_recipe
})

data.raw["mining-drill"]["electric-mining-drill"].next_upgrade = "advanced-mining-drill";
data.raw["mining-drill"]["big-mining-drill"].next_upgrade = "big-advanced-mining-drill";