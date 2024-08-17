extends AudioStreamPlayer

@export var bpm = 90
@onready var conductor = $"."

var sec_per_beat = 60.0 / bpm
var song_position_sec = 0.0
var song_position_beats = 1

var last_beat = 0
var time_since_last_beat = 0.0
var calibrate_delay = true
var delay_amount = 0.0

signal beat(song_position_beat)

func _ready():
	conductor.play() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	time_since_last_beat += delta
	song_position_sec = get_playback_position() + AudioServer.get_time_since_last_mix() # gets our current position in song (seconds)
	song_position_sec -= AudioServer.get_output_latency() # account for audio latency
	song_position_beats = int(floor(song_position_sec / sec_per_beat)) # int value of what beat we are on in the song
	report_beat()
	if calibrate_delay:
		if Input.is_action_just_pressed("up"):
			delay_amount = time_since_last_beat


func report_beat(): # will just report beat once when it gets there
	if last_beat < song_position_beats: # make sure we haven't sent a signal already for this beat already
		last_beat = song_position_beats
		time_since_last_beat = 0.0
		emit_signal("beat", song_position_beats)
		

