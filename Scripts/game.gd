extends Node2D

@onready var conductor = $Conductor
@onready var cat = $Cat

func _process(delta):
	cat.time_since_last_beat = conductor.time_since_last_beat
