extends Node2D

@onready var conductor = $Conductor
@onready var cat = $Cat
@onready var death_menu = $HUD/DeathMenu
@onready var death_timer = $HUD/DeathMenu/DeathTimer
@onready var camera = $Camera
@onready var spawn_manager = $SpawnManager
@onready var win_screen = $HUD/WinScreen
@onready var win_animation = $WinAnimation

const CAT_DEATH = preload("res://Scenes/cat_death.tscn")

const CAN = preload("res://Scenes/can.tscn")
const BIRD = preload("res://Scenes/bird.tscn")

const CAMERA_SPEED = 275

var delay = 0.0
var game_end = false


func _ready():
	var calibrate = get_tree().get_first_node_in_group("calibrate")
	delay = Global.delay
	var offset = (100 - Global.volume) / -2
	AudioServer.set_bus_volume_db(0, offset)
	cat.show()


func _process(delta):
	cat.time_since_last_beat = conductor.time_since_last_beat
	if not game_end:
		if Global.height >= 121: 
			game_end = true
			game_over()
		camera.global_position.y -= delta * CAMERA_SPEED # scrolling instead of moving with player


func _on_conductor_beat(song_position_beat):
	spawn_manager.spawn()


func _on_cat_player_death():
	var cat_death = CAT_DEATH.instantiate() # play death sound and make the cat fall
	cat_death.global_position = cat.global_position
	cat_death.velocity = Vector2(30, 600)
	add_child(cat_death)
	cat.hide()
	death_timer.start()
	get_tree().paused = true


func _on_death_timer_timeout():
	death_menu.show()
	

func game_over():
	cat.hide()
	win_animation.show()
	win_animation.play("default")


func _on_win_animation_animation_finished():
	# print("finished win animation")
	win_animation.hide()
	win_screen.show()
