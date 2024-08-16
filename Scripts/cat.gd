extends CharacterBody2D

const SPEED = 140

var time_since_last_beat = 0.0 

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
	if time_since_last_beat < 0.06 or time_since_last_beat > 0.6: # grace period
		position += direction * SPEED
		var clamped_position = clamp(global_position.x, -280, 280) # make sure it is within bounds of skyscraper
		global_position.x = clamped_position
