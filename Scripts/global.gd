extends Node

const GRID_SIZE = 240

var hud

var delay = 0.0 # global variable to save delay time we found from calibration
var volume = 75

var max_lives = 3
var lives = max_lives
var height = 1

func lose_life():
	if lives > 0:
		lives -= 1
	hud.load_hearts()
	
