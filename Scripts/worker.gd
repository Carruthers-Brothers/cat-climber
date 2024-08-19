extends Node2D

@onready var conductor = get_tree().get_first_node_in_group("music")
@onready var cat = get_tree().get_first_node_in_group("cat")
@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var spawner_left = $SpawnerLeft
@onready var spawner_right = $SpawnerRight
@onready var spawner_center_1 = $SpawnerCenter1
@onready var spawner_center_2 = $SpawnerCenter2
@onready var area_2d = $Area2D


const PROJECTILE = preload("res://Scenes/can.tscn")
const WRENCH = preload("res://Scenes/wrench.tscn")
const WIPER = preload("res://Scenes/wiper.tscn")

const THROW = [WRENCH, WIPER]

var paused = true
var throwing = false
var count = 0
var state = "idle"

# Called when the node enters the scene tree for the first time.
func _ready():
	conductor.beat.connect(on_beat)


# will clean up later
func on_beat(beat):
	if beat % 4 == 0: # pause / idle every other
		animated_sprite_2d.play("idle")
	elif beat % 2 == 0: # each animation is two frames 
		var direction_to_player = global_position.direction_to(cat.global_position) # to find throw direction
		if direction_to_player.x > 0: # right
			var rand_direction = randi_range(0, 2)
			var object_throw = THROW.pick_random()
			if rand_direction == 0:
				animated_sprite_2d.play("throw_right")
				spawner_right.spawn(object_throw, Vector2(1, 0))
			elif rand_direction == 1:
				animated_sprite_2d.play("throw_center")
				spawner_center_2.spawn(PROJECTILE, Vector2(0, 1))
			else:
				animated_sprite_2d.play("throw_right")
				spawner_right.spawn(object_throw, Vector2(1, 1)) # diagonal
		elif direction_to_player.x < 0: # left
			var rand_direction = randi_range(0, 2)
			var object_throw = THROW.pick_random()
			if rand_direction == 0:
				animated_sprite_2d.play("throw_left")
				spawner_left.spawn(object_throw, Vector2(-1, 0))
			elif rand_direction == 1:
				animated_sprite_2d.play("throw_center")
				spawner_center_1.spawn(PROJECTILE, Vector2(0, 1))
			else:
				animated_sprite_2d.play("throw_left")
				spawner_left.spawn(object_throw, Vector2(-1, 1)) # diagonal
		else:
			animated_sprite_2d.play("throw_center")
			var rand_num = randi_range(0, 1)
			if rand_num == 0:
				spawner_center_1.spawn(PROJECTILE, Vector2(0, 1))
			else:
				spawner_center_2.spawn(PROJECTILE, Vector2(0, 1))


# fix to not despawn both, just most recent one
func _on_area_2d_area_entered(area):
	queue_free() # just want to remove the most recent one
