extends Control

@onready var settings_menu = $SettingsMenu

var paused = false

func _process(_delta):
	if Input.is_action_just_pressed("pause"): # escape key pressed 
		if paused: # if already paused, unpause and hide pause menu
			get_tree().paused = false
			hide()
		else: # if unpaused, pause and show pause menu
			get_tree().paused = true
			show()
		paused = !paused 


func _on_resume_button_pressed():
	if paused: 
			hide()
			get_tree().paused = false
			paused = !paused


func _on_settings_button_pressed():
	settings_menu.show()


func _on_quit_button_pressed():
	get_tree().quit()
