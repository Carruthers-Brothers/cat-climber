extends Node2D

var initial_position

func _ready():
	initial_position = self.position
	var conductor = get_tree().get_first_node_in_group("music")
	conductor.beat.connect(move)

func _on_area_2d_body_entered(body):
	if body.get_collision_layer() == 1:
		body.take_damage(self)
		
func move(_beat):
	var axis = get_axis()
	var position_offset = get_position_offset(initial_position)
	global_position[axis] += position_offset
	
func get_axis():
	return 'y'
	
func get_position_offset(initial_position):
	return 100
