extends "res://Scripts/projectile.gd"

# both egg and bird poop will function the same. No damage dealt but splatters screen
@onready var poop_screen = get_tree().get_first_node_in_group("poop")

func _on_area_2d_body_entered(body):
	# cover screen with poop animation
	poop_screen.show()
