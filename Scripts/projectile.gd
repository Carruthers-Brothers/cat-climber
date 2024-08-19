extends Node2D

var initial_position
var axis = 'y'
var direction = Vector2(0,1)

func _ready():
	initial_position = self.position
	var conductor = get_tree().get_first_node_in_group("music")
	conductor.beat.connect(move)
	on_ready(initial_position)

func _on_area_2d_body_entered(body):
	if body.get_collision_layer() == 1:
		body.take_damage(self)
		
func move(_beat):
	var axis = get_axis()
	var position_offset = get_position_offset(initial_position)
	global_position += direction * Global.GRID_SIZE
	spawn_children()
	
func get_axis():
	return axis
	
func get_position_offset(initial_position):
	return Global.GRID_SIZE
	
func spawn_children():
	return

func on_ready(initial_position):
	return
