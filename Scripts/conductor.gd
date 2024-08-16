extends AudioStreamPlayer

@export var bpm = 90
@onready var conductor = $"."

var song_position = 0.0
var song_position_beats = 1
var sec_per_beat = 60.0 / bpm
var last_beat = 0
var closest = 0
var time_off_beat = 0.0

signal beat(position_beat, position_sec)

func _ready():
	conductor.play() 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	song_position = get_playback_position() + AudioServer.get_time_since_last_mix() # gets our current position in song (seconds)
	song_position -= AudioServer.get_output_latency() # account for audio latency
	song_position_beats = int(floor(song_position / sec_per_beat)) # int value of what beat we are on in the song
	report_beat()

func report_beat():
	if last_beat < song_position_beats: # make sure we haven't sent a signal already for this beat already
		last_beat = song_position_beats
		emit_signal("beat", song_position_beats, song_position) # send info where we are in song
