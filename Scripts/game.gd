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

const CAT_DEATH = preload("res://Scenes/cat_death.tscn")

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
	spawner_1.spawn()
	spawner_2.spawn()
	spawner_3.spawn()
	spawner_4.spawn()
	spawner_5.spawn()


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
