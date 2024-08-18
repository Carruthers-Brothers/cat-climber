extends Control

@onready var settings_menu = $SettingsMenu

func _on_restart_button_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()


func _on_settings_button_pressed():
	settings_menu.show()


func _on_quit_button_pressed():
	get_tree().quit()
