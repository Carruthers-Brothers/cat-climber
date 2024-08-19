extends Node2D

@onready var bottom_building = $BottomBuilding
@onready var skyscraper = $"."

const TALL_SIDE_BUILDING_LIGHTER = preload("res://Assets/Tall_Side_Building_lighter.png")
const TALL_SIDE_BUILDING_LIGHTER_2 = preload("res://Assets/Tall_Side_Building_lighter_2.png")
const building_options = [TALL_SIDE_BUILDING_LIGHTER, TALL_SIDE_BUILDING_LIGHTER_2] # can add more building art if wanted

var prev_building_position
var building_count = 1

func _ready():
	prev_building_position = bottom_building.global_position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.height % 10 == 7: # based on building height of 10, spawn before we can see next
		if building_count < (Global.height / 10) + 2:
			var building_sprite = Sprite2D.new()
			building_sprite.texture = building_options.pick_random()
			building_sprite.scale = Vector2(.4, .4)
			building_sprite.global_position.y = prev_building_position.y - 1200 # offset of building 1200 (half of building height)
			skyscraper.add_child(building_sprite)
			print("global position of previous building is ", prev_building_position)
			print("global position of current buildig is ", building_sprite.global_position)
			prev_building_position = building_sprite.global_position
			building_count += 1
