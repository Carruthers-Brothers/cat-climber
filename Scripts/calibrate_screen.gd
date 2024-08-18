extends Control

@export var bpm = 90

@onready var audio_stream_player = $AudioStreamPlayer
@onready var delay_label = $MarginContainer/VBoxContainerAll/VBoxContainer/DelayLabel
@onready var count_label = $MarginContainer/VBoxContainerAll/VBoxContainer/CountLabel
@onready var complete_label = $MarginContainer/VBoxContainerAll/VBoxContainer/VBoxContainer/CompleteLabel
@onready var delay_slider = $MarginContainer/VBoxContainerAll/VBoxContainer/DelaySlider

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
		press_count += 1
		count_label.text = str(press_count)
		total_delay += current_delay
		average_delay = total_delay / press_count
		delay_label.text = "Delay: " + str(snapped(average_delay, 0.001)) + "s"
		if press_count >= 15:
			Global.delay = average_delay
			complete_label.show()



func _on_h_slider_value_changed(value):
	delay_label.text = "Delay: " + str(value) + "s"
	Global.delay = value


func _on_back_pressed():
	hide()
	audio_stream_player.stop()
	press_count = 0
	count_label.text = "0"
	complete_label.hide()
	total_delay = 0.0
	average_delay = 0.0
	delay_label.text = "Delay: "
