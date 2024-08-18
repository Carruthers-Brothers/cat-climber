extends CanvasLayer

func _ready():
	Global.hud = self
	load_hearts()

func load_hearts():
	$PawPrint.size.x = Global.lives * 1218
