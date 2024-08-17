extends CanvasLayer

func _ready():
	Global.hud = self
	load_hearts()

func load_hearts():
	$FullHeart.size.x = Global.lives * 53
	$EmptyHeart.size.x = (Global.max_lives - Global.lives) * 53

	$EmptyHeart.position.x = $FullHeart.position.x + $FullHeart.size.x
