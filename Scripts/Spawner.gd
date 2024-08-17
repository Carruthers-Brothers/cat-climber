extends Node2D

@onready var game = get_tree().get_first_node_in_group("game")

const PROJECTILE = preload("res://Scenes/projectile.tscn")

var current_beat = 1
var spawn_count = 0


func spawn():
	var num = randi_range(0,9)
	if num == 0:
		var new_can = PROJECTILE.instantiate()
		new_can.global_position = global_position
		game.add_child(new_can)
		spawn_count += 1
		print("spawn count is ", spawn_count)
