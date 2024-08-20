extends CanvasLayer

const RHYTHM_BAR = preload("res://Scenes/rhythm_bar.tscn")

func _ready():
	Global.hud = self
	load_hearts()
	$HeightMargin/HeightPanel/CurrentHeight.text = str(Global.height)
	$HeightMargin/HeightPanel/MaxHeight.text = str(Global.max_height)
	
func _process(delta):
	$HeightMargin/HeightPanel/CurrentHeight.text = str(Global.height)
	
func load_hearts():
	$PawMargin/PawPanel/PawPrint.size.x = Global.lives * 1218

func _on_conductor_beat(song_position_beat):
	$FishMargin/BottomScreenPanel/Fish.scale.x = $FishMargin/BottomScreenPanel/Fish.scale.x * 1.1
	$FishMargin/BottomScreenPanel/Fish.scale.y = $FishMargin/BottomScreenPanel/Fish.scale.y * 1.1
	
	var new_rhythm_bar_left = RHYTHM_BAR.instantiate()
	new_rhythm_bar_left.position = Vector2(-61, 100)
	new_rhythm_bar_left.target = $FishMargin/BottomScreenPanel/Fish
	$FishMargin/BottomScreenPanel.add_child(new_rhythm_bar_left)
	
	var new_rhythm_bar_right = RHYTHM_BAR.instantiate()
	new_rhythm_bar_right.position = Vector2(1939, 100)
	new_rhythm_bar_right.target = $FishMargin/BottomScreenPanel/Fish
	$FishMargin/BottomScreenPanel.add_child(new_rhythm_bar_right)
	
	$Timer.start()
	
func _on_timer_timeout():
	$FishMargin/BottomScreenPanel/Fish.scale.x = $FishMargin/BottomScreenPanel/Fish.scale.x / 1.1
	$FishMargin/BottomScreenPanel/Fish.scale.y = $FishMargin/BottomScreenPanel/Fish.scale.y / 1.1
