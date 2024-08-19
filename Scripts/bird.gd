extends "res://Scripts/projectile.gd"

func get_axis():
	return 'x'
	
func get_position_offset(initial_position):
	if initial_position.x > 1:
		return -100
	return 100
