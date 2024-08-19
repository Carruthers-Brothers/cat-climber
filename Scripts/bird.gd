extends "res://Scripts/projectile.gd"

@onready var game = get_tree().get_first_node_in_group("game")
@onready var animated_sprite_2d = $AnimatedSprite2D

const SPAWNER = preload("res://Scenes/spawner.tscn")
const CAN = preload("res://Scenes/can.tscn")
const BIRD_POOP = preload("res://Scenes/bird_poop.tscn")
const EGG = preload("res://Scenes/egg.tscn")


func get_axis():
	return 'x'
	
func get_position_offset(initial_position):
	if initial_position.x > 1:
		return -Global.GRID_SIZE
	return Global.GRID_SIZE


func spawn_children():
	var new_spawner = SPAWNER.instantiate()
	add_child(new_spawner)
	var rand_num = randi_range(0,19)
	if rand_num < 2:
		new_spawner.spawn(BIRD_POOP, Vector2(0, 1))
	elif rand_num > 17:
		new_spawner.spawn(EGG, Vector2(0, 1))


func on_ready(initial_position):
	if initial_position.x < 0:
		animated_sprite_2d.flip_h = false
		direction = Vector2(1, 0)
	else:
		animated_sprite_2d.flip_h = true
		direction = Vector2(-1, 0)
	
