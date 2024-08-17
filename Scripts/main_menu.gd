extends Node2D


func _on_play_button_pressed():
	#get_tree().change_scene_to_file("res://Scenes/calibrate_screen.tscn")
	get_tree().change_scene_to_file("res://Scenes/game.tscn") # to skip calibration


func _on_quit_button_button_down():
	get_tree().quit()
