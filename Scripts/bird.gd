extends "res://Scripts/projectile.gd"

@onready var game = get_tree().get_first_node_in_group("game")

const SPAWNER = preload("res://Scenes/spawner.tscn")
const CAN = preload("res://Scenes/projectile.tscn")
const BIRD_POOP = preload("res://Scenes/bird_poop.tscn")

func get_axis():
	return 'x'
	
func get_position_offset(initial_position):
	if initial_position.x > 1:
		return -100
	return 100
	
func spawn_children():
	var new_spawner = SPAWNER.instantiate()
	add_child(new_spawner)
	new_spawner.spawn(BIRD_POOP)
	
