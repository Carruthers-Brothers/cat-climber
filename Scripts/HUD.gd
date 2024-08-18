extends CanvasLayer

func _ready():
	Global.hud = self
	load_hearts()
	$HeightMargin/HeightPanel/Number.text = str(Global.height)
	
func _process(delta):
	$HeightMargin/HeightPanel/Number.text = str(Global.height)
	
func load_hearts():
	$PawMargin/PawPanel/PawPrint.size.x = Global.lives * 1218

func _on_conductor_beat(song_position_beat):
	$FishMargin/FishPanel/Fish.scale.x = $FishMargin/FishPanel/Fish.scale.x * 1.1
	$FishMargin/FishPanel/Fish.scale.y = $FishMargin/FishPanel/Fish.scale.y * 1.1
	
	$Timer.start()
	
func _on_timer_timeout():
	$FishMargin/FishPanel/Fish.scale.x = $FishMargin/FishPanel/Fish.scale.x / 1.1
	$FishMargin/FishPanel/Fish.scale.y = $FishMargin/FishPanel/Fish.scale.y / 1.1
