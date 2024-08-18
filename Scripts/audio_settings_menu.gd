extends Control

@onready var h_slider = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/HSlider
@onready var volume_label = $MarginContainer/VBoxContainer/VBoxContainer/HBoxContainer2/VolumeLabel
@onready var audio_stream_player = $AudioStreamPlayer


func _ready():
	volume_label.text = str(Global.volume) + "%"
	h_slider.value = Global.volume


func _on_h_slider_value_changed(value):
	volume_label.text = str(value) + "%"
	Global.volume = value
	if value != 0:
		var offset = (100 - value) / -2 # range between 0dB (loudest) and -20
		AudioServer.set_bus_volume_db(0, offset)
	else:
		AudioServer.set_bus_volume_db(0, -100)
	

func _on_back_pressed():
	hide()
	audio_stream_player.stop()
