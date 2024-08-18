extends Control

@onready var settings_menu = $MarginContainer/SettingsMenu


func _on_play_button_pressed():
	#get_tree().change_scene_to_file("res://Scenes/calibrate_screen.tscn")
	get_tree().change_scene_to_file("res://Scenes/game.tscn") # to skip calibration


func _on_quit_button_button_down():
	get_tree().quit()


func _on_settings_pressed():
	# open settings menu for calibration, viewport size, volume, etc.
	settings_menu.show()
