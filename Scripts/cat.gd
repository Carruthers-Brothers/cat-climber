extends CharacterBody2D

const SPEED = 140

var current_position_beat = 0
var current_position_seconds = 0.0 # the time when the last beat was signaled
var current_time = 0.0 # the current time in the song

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
	if abs(current_time - current_position_seconds) < .2: # within threshold for being on beat
		print("time that input was pressed is " + str(current_time) + " and current time in song is " + str(current_position_seconds))
		position += direction * SPEED
		var clamped_position = clamp(global_position.x, -280, 280) # make sure it is within bounds of skyscraper
		global_position.x = clamped_position
