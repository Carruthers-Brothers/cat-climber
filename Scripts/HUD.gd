extends CanvasLayer

func _ready():
	Global.hud = self
	load_hearts()

func load_hearts():
	$PawPrint.size.x = Global.lives * 1218

func _on_conductor_beat(song_position_beat):
	$Fish.scale.x = $Fish.scale.x * 1.1
	$Fish.scale.y = $Fish.scale.y * 1.1
	
	$Timer.start()
	
func _on_timer_timeout():
	$Fish.scale.x = $Fish.scale.x / 1.1
	$Fish.scale.y = $Fish.scale.y / 1.1
