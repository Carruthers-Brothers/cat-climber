extends Node2D


func _on_drop_timer_timeout():
	global_position.y += 100


func _on_area_2d_body_entered(body):
	if body.get_collision_layer() == 1:
		body.take_damage(self)
		print("collided with player")
		print(Global.lives)
