extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var game = get_tree().get_first_node_in_group("game")

const SPEED = 140

var time_since_last_beat = 0.0 
var walk1 = true
var immune_to = []

func _physics_process(delta):
	
	if Input.is_action_just_pressed("up"):
		move(Vector2(0, -1))
	elif Input.is_action_just_pressed("down"):
		move(Vector2(0, 1))
	elif Input.is_action_just_pressed("left"):
		move(Vector2(-1, 0))
	elif Input.is_action_just_pressed("right"):
		move(Vector2(1, 0))


func move(direction):
	var adjusted_time = time_since_last_beat - game.delay # adjusted delay found at beginning
	if time_since_last_beat < 0.06 or time_since_last_beat > 0.6: # grace period of .06 early / late
		position += direction * SPEED
		var clamped_position = clamp(global_position.x, -280, 280) # make sure it is within bounds of skyscraper
		global_position.x = clamped_position
		if walk1:
			animated_sprite_2d.play("walk2")
			walk1 = false
		else:
			animated_sprite_2d.play("walk1")
			walk1 = true
			
func take_damage(enemy):
	if immune_to.find(enemy) == -1:
		set_modulate(Color(1, 0.3, 0.3, 0.3))
		Global.lose_life()
		immune_to.push_back(enemy)

