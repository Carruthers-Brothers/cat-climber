extends Control

@onready var splatter = $MarginContainer/Splatter
@onready var timer = $Timer
@onready var splat_sound = $SplatSound


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible: # start timer and begin to fade
		if timer.is_stopped():
			timer.start()
			splat_sound.play()
		else:
			splatter.modulate.a -= delta * .5


func _on_timer_timeout():
	visible = false
	splatter.modulate.a = 255
