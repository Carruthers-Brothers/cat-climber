extends CharacterBody2D

@onready var game = get_tree().get_first_node_in_group("game")
@onready var spawner = get_tree().get_first_node_in_group("spawner")
@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var hit_sound = $HitSound
@onready var on_screen = $OnScreen

@onready var up = $Up
@onready var right = $Right
@onready var down = $Down
@onready var left = $Left


var grid_position = Vector2(3, 1) # (x,y) bottom left building square is (1,1)
var time_since_last_beat = 0.0 
var walk1 = true
var is_immune = false

signal player_death()


func _physics_process(delta):
	if Input.is_action_just_pressed("up"):
		var collide_up = up.get_overlapping_areas()
		if collide_up.size() == 0:
			move(Vector2(0, -1))
			spawner.position += Vector2(0, -1) * Global.GRID_SIZE
	elif Input.is_action_just_pressed("down"):
		var collide_down = down.get_overlapping_areas()
		if collide_down.size() == 0:
			if Global.height > 0:
				move(Vector2(0, 1))
				spawner.position += Vector2(0, 1) * Global.GRID_SIZE
	elif Input.is_action_just_pressed("left"):
		var collide_left = left.get_overlapping_areas()
		if collide_left.size() == 0:
			move(Vector2(-1, 0))
	elif Input.is_action_just_pressed("right"):
		var collide_right = right.get_overlapping_areas()
		if collide_right.size() == 0:
			move(Vector2(1, 0))


func move(direction):
	var adjusted_time = time_since_last_beat - game.delay # adjusted delay found at beginning
	if time_since_last_beat < 0.06 or time_since_last_beat > 0.6: # grace period of .06 early / late
		if direction.y == -1:
			Global.height += 1
		elif direction.y == 1:
			Global.height -= 1
			
		grid_position += Vector2(direction.x, -direction.y)
		grid_position.x = clamp(grid_position.x, 1, 5)
		position += direction * Global.GRID_SIZE
		var clamped_position_x = clamp(global_position.x, -480, 480) # make sure it is within bounds of skyscraper
		global_position.x = clamped_position_x
		if walk1:
			animated_sprite_2d.play("walk2")
			walk1 = false
		else:
			animated_sprite_2d.play("walk1")
			walk1 = true


func take_damage(enemy):
	if is_immune == false:
		hit_sound.play()
		set_modulate(Color(1, 0.3, 0.3, 0.3))
		Global.lose_life()
		is_immune = true
		
		if Global.lives == 0:
			Global.lives = 3
			Global.height = 0
			emit_signal("player_death")
		
		$Timer.start()


func _on_timer_timeout():
	set_modulate(Color(1, 1, 1, 1))
	is_immune = false


func _on_on_screen_screen_exited(): # player dies if too far behind
	Global.lives = 3
	Global.height = 0
	emit_signal("player_death")
