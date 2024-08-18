extends CharacterBody2D

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var game = get_tree().get_first_node_in_group("game")

const SPEED = 140

var time_since_last_beat = 0.0 
var walk1 = true
var is_immune = false

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
		if direction.y == -1:
			Global.height += 1
		elif direction.y == 1:
			Global.height -= 1
			
		print(direction)
		print('direction')
		print(direction.x)
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
	if is_immune == false:
		set_modulate(Color(1, 0.3, 0.3, 0.3))
		Global.lose_life()
		is_immune = true
		
		$Timer.start()

func _on_timer_timeout():
	if Global.lives == 0:
		get_tree().change_scene_to_file("res://Scenes/game.tscn")
		Global.lives = 3
		Global.height = 0
	
	set_modulate(Color(1, 1, 1, 1))
	is_immune = false
