extends Node2D

@onready var conductor = $Conductor
@onready var cat = $Cat
@onready var death_menu = $HUD/DeathMenu
@onready var death_timer = $HUD/DeathMenu/DeathTimer
@onready var camera = $Camera
@onready var spawn_manager = $SpawnManager

const CAT_DEATH = preload("res://Scenes/cat_death.tscn")

const CAN = preload("res://Scenes/can.tscn")
const BIRD = preload("res://Scenes/bird.tscn")

const CAMERA_SPEED = 250

var delay = 0.0


func _ready():
	var calibrate = get_tree().get_first_node_in_group("calibrate")
	delay = Global.delay
	var offset = (100 - Global.volume) / -2
	AudioServer.set_bus_volume_db(0, offset)
	cat.show()


func _process(delta):
	cat.time_since_last_beat = conductor.time_since_last_beat
	if Global.height > Global.max_height:
		print("you win the game!") # animation / win screen 
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
