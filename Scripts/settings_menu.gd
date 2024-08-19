extends Control

@onready var calibrate_screen = $CalibrateScreen
@onready var display_settings_menu = $DisplaySettingsMenu
@onready var audio_settings_menu = $AudioSettingsMenu

func _on_latency_setting_pressed():
	calibrate_screen.show()
	calibrate_screen.audio_stream_player.play()


func _on_viewport_setting_pressed():
	display_settings_menu.show()


func _on_music_volume_pressed():
	audio_settings_menu.show()
	audio_settings_menu.audio_stream_player.play()


func _on_back_pressed():
	hide()
