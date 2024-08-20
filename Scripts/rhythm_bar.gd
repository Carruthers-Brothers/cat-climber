extends Node2D
var direction
var bpm = 90
var sec_per_beat = 60.0 / bpm
var speed = 200 / sec_per_beat
@onready var target = $"../Fish"

func _process(delta):
	if target:
		direction = position.direction_to(target.position)
		position += direction * speed * delta
	
func _on_area_2d_area_entered(body):
	queue_free()

