extends Node2D

var velocity
var rotation_amount = 1
@onready var audio_stream_player = $AudioStreamPlayer

func _ready():
	audio_stream_player.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position += delta * velocity
	rotation += delta * rotation_amount
