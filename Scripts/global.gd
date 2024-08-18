extends Node

var hud

var delay = 0.0 # global variable to save delay time we found from calibration

var max_lives = 3
var lives = max_lives
var height = 0

func lose_life():
	if lives > 0:
		lives -= 1
	hud.load_hearts()
	
