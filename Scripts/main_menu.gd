extends Control

@onready var color_rect = $ColorRect
@onready var settings_menu = $SettingsMenu

func _ready():
	color_rect.size = get_viewport_rect().size

func _on_play_button_pressed():
	#get_tree().change_scene_to_file("res://Scenes/calibrate_screen.tscn")
	get_tree().change_scene_to_file("res://Scenes/game.tscn") # to skip calibration


func _on_quit_button_button_down():
	get_tree().quit()


func _on_settings_pressed():
	# open settings menu for calibration and viewport size
	settings_menu.show()
