extends Node2D

@onready var game = get_tree().get_first_node_in_group("game")


func spawn(projectile, direction):
	var new_projectile = projectile.instantiate()
	new_projectile.global_position = global_position
	new_projectile.direction = direction
	game.add_child(new_projectile)
