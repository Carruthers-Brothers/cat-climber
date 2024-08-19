extends Node2D

@onready var game = get_tree().get_first_node_in_group("game")

var current_beat = 1
var spawn_count = 0


func spawn(projectile):
	var num = randi_range(0,9)
	if num == 0:
		var new_projectile = projectile.instantiate()
		new_projectile.global_position = global_position
		game.add_child(new_projectile)
		spawn_count += 1
		print("spawn count is ", spawn_count)
