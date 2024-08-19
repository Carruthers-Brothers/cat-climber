extends "res://Scripts/projectile.gd"

@onready var yellow_animation = $YellowAnimation
@onready var blue_animation = $BlueAnimation
@onready var pink_animation = $PinkAnimation

# Called when the node enters the scene tree for the first time.
func _ready():
	var rand_color = randi_range(0,2)
	if rand_color == 0:
		pink_animation.show()
	elif rand_color == 1:
		blue_animation.show()
	else:
		yellow_animation.show()
	
	initial_position = self.position
	var conductor = get_tree().get_first_node_in_group("music")
	conductor.beat.connect(move)
	on_ready(initial_position)
