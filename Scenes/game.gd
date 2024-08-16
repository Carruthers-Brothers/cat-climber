extends Node2D

@onready var conductor = $Conductor
@onready var cat = $Cat

func _process(delta):
	cat.current_time = conductor.song_position

func _on_conductor_beat(position_beat, position_sec):
	cat.current_position_beat = position_beat
	cat.current_position_seconds = position_sec
