extends Control

@onready var calibrate_screen = $CalibrateScreen
@onready var continue_button = $MarginContainer/VBoxContainer/HBoxContainer/Continue
@onready var calibrate = $MarginContainer/VBoxContainer/HBoxContainer/Calibrate

const GAME = preload("res://Scenes/game.tscn")

func _on_continue_pressed():
	get_tree().change_scene_to_packed(GAME)
	# get_tree().change_scene_to_file("res://Scenes/game.tscn")


func _on_calibrate_pressed():
	calibrate_screen.show()


func _on_timer_timeout():
	# get_tree().change_scene_to_file("res://Scenes/game.tscn")
	get_tree().change_scene_to_packed(GAME)
