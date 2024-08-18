extends Control

@onready var calibrate_screen = $CalibrateScreen

func _on_latency_setting_pressed():
	calibrate_screen.show()


func _on_viewport_setting_pressed():
	pass # Replace with function body.
