extends Node2D

@onready var bottom_building = $BottomBuilding
@onready var skyscraper = $"."

const TALL_SIDE_BUILDING_LIGHTER = preload("res://Assets/Tall_Side_Building_lighter.png")
const TALL_SIDE_BUILDING_LIGHTER_2 = preload("res://Assets/Tall_Side_Building_lighter_2.png")
const BUILDING_TOP_NO_BACKGROUND = preload("res://Assets/Building_top_No_background.png")
const GLASS_OF_WATER = preload("res://Assets/Glass_of_Water.png")
const TOP_BUILDING = preload("res://Scenes/top_building.tscn")

const building_options = [TALL_SIDE_BUILDING_LIGHTER, TALL_SIDE_BUILDING_LIGHTER_2] # can add more building art if wanted

var prev_building_position
var building_count = 1
var top = false
var top_building
var removed = false

func _ready():
	prev_building_position = bottom_building.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if not top:
		if Global.height > 110:
			# var building_sprite = Sprite2D.new()
			# building_sprite.texture = BUILDING_TOP_NO_BACKGROUND
			var building_sprite = TOP_BUILDING.instantiate()
			top_building = building_sprite
			# building_sprite.scale = Vector2(1.2, 1.2)
			building_sprite.global_position.y = prev_building_position.y - 1200 # offset of building 1200 (half of building height)
			skyscraper.add_child(building_sprite)
			prev_building_position = building_sprite.global_position
			top = true
			var water_sprite = Sprite2D.new()
			water_sprite.texture = GLASS_OF_WATER
			# scale change?
			water_sprite.global_position = Vector2(building_sprite.global_position.x - 530, building_sprite.global_position.y - 1264)
			skyscraper.add_child(water_sprite)
		else:
			if Global.height % 10 == 3 or Global.height < 10: # based on building height of 10, spawn before we can see next
				if building_count < (Global.height / 10) + 2:
					var building_sprite = Sprite2D.new()
					building_sprite.texture = building_options.pick_random()
					building_sprite.scale = Vector2(.4, .4)
					building_sprite.global_position.y = prev_building_position.y - 2399 # offset of building 1200 (half of building height)
					skyscraper.add_child(building_sprite)
					prev_building_position = building_sprite.global_position
					building_count += 1
	else:
		# change top to no glass of water image
		if not removed and Global.height == 121:
			var water = get_tree().get_first_node_in_group("water")
			top_building.remove_child(water)
			removed = true
