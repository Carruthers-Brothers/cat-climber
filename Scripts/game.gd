extends Node2D

@onready var conductor = $Conductor
@onready var cat = $Cat
@onready var death_menu = $HUD/DeathMenu
@onready var death_timer = $HUD/DeathMenu/DeathTimer


@onready var spawner_1 = $Cat/Spawners/Spawner1
@onready var spawner_2 = $Cat/Spawners/Spawner2
@onready var spawner_3 = $Cat/Spawners/Spawner3
@onready var spawner_4 = $Cat/Spawners/Spawner4
@onready var spawner_5 = $Cat/Spawners/Spawner5
@onready var spawner_8 = $Cat/Spawners/Spawner8
@onready var spawner_11 = $Cat/Spawners/Spawner11
@onready var spawner_12 = $Cat/Spawners/Spawner12
@onready var spawner_13 = $Cat/Spawners/Spawner13
@onready var spawner_14 = $Cat/Spawners/Spawner14
@onready var spawner_15 = $Cat/Spawners/Spawner15
@onready var spawner_16 = $Cat/Spawners/Spawner16
@onready var spawner_17 = $Cat/Spawners/Spawner17

const CAT_DEATH = preload("res://Scenes/cat_death.tscn")

const CAN = preload("res://Scenes/projectile.tscn")
const BIRD = preload("res://Scenes/bird.tscn")

var delay = 0.0


func _ready():
	var calibrate = get_tree().get_first_node_in_group("calibrate")
	delay = Global.delay
	var offset = (100 - Global.volume) / -2
	AudioServer.set_bus_volume_db(0, offset)
	cat.show()


func _process(delta):
	cat.time_since_last_beat = conductor.time_since_last_beat
	spawner_1.current_beat = conductor.song_position_beats
	spawner_2.current_beat = conductor.song_position_beats
	spawner_3.current_beat = conductor.song_position_beats
	spawner_4.current_beat = conductor.song_position_beats
	spawner_5.current_beat = conductor.song_position_beats


func _on_conductor_beat(song_position_beat):
	spawner_1.spawn(CAN)
	spawner_2.spawn(CAN)
	spawner_3.spawn(CAN)
	spawner_4.spawn(CAN)
	spawner_5.spawn(CAN)
	
	spawner_8.spawn(BIRD)
	spawner_11.spawn(BIRD)
	spawner_12.spawn(BIRD)
	spawner_13.spawn(BIRD)
	spawner_14.spawn(BIRD)
	spawner_15.spawn(BIRD)
	spawner_16.spawn(BIRD)
	spawner_17.spawn(BIRD)


func _on_cat_player_death():
	var cat_death = CAT_DEATH.instantiate() # play death sound and make the cat fall
	cat_death.global_position = cat.global_position
	cat_death.velocity = Vector2(30, 600)
	#cat_death.z_index = 1
	add_child(cat_death)
	cat.hide()
	death_timer.start()
	get_tree().paused = true
	


func _on_death_timer_timeout():
	death_menu.show()
