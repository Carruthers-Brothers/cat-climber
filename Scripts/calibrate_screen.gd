extends Node2D

@export var bpm = 90

@onready var audio_stream_player = $AudioStreamPlayer
@onready var hidden_button = $HiddenButton


var press_count = 0
var total_delay = 0.0
var sec_per_beat = 60.0 / bpm
var last_beat_time
var average_delay = 0.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var time_into_song = audio_stream_player.get_playback_position() + AudioServer.get_time_since_last_mix() # gets our current position in song (seconds)
	time_into_song -= AudioServer.get_output_latency() # account for audio latency
	last_beat_time = time_into_song - (int(floor(time_into_song / sec_per_beat)) * sec_per_beat)
	if Input.is_action_just_pressed("up"):
		var current_delay = last_beat_time
		print("current delay is ", current_delay)
		press_count += 1
		total_delay += current_delay
		average_delay = total_delay / press_count
		print("average delay is ", average_delay)
		if press_count >= 15:
			Global.delay = average_delay
			hidden_button.show()



func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
