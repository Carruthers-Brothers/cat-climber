extends Node2D

# spawn locations for workers
@onready var worker_spawn_1 = $Workers/WorkerSpawn1
@onready var workers_spawn_2 = $Workers/WorkersSpawn2
@onready var worker_spawn_3 = $Workers/WorkerSpawn3
@onready var worker_spawn_4 = $Workers/WorkerSpawn4

# spawn locations birds
@onready var bird_spawn_1 = $Birds/BirdSpawn1
@onready var bird_spawn_2 = $Birds/BirdSpawn2
@onready var bird_spawn_3 = $Birds/BirdSpawn3
@onready var bird_spawn_4 = $Birds/BirdSpawn4
@onready var bird_spawn_5 = $Birds/BirdSpawn5
@onready var bird_spawn_6 = $Birds/BirdSpawn6

# spawn locations for other falling objects
@onready var other_spawn_1 = $Other/OtherSpawn1
@onready var other_spawn_2 = $Other/OtherSpawn2
@onready var other_spawn_3 = $Other/OtherSpawn3
@onready var other_spawn_4 = $Other/OtherSpawn4
@onready var other_spawn_5 = $Other/OtherSpawn5

@onready var game = get_tree().get_first_node_in_group("game")

const BIRD = preload("res://Scenes/bird.tscn")
const PROJECTILE = preload("res://Scenes/can.tscn")
const WORKER = preload("res://Scenes/worker.tscn")

var worker_spawns
var bird_spawns
var other_spawns

# Called when the node enters the scene tree for the first time.
func _ready():
	worker_spawns = [worker_spawn_1, workers_spawn_2, worker_spawn_3, worker_spawn_4]
	bird_spawns = [bird_spawn_1, bird_spawn_2, bird_spawn_3, bird_spawn_4, bird_spawn_5, bird_spawn_6]
	other_spawns = [other_spawn_1, other_spawn_2, other_spawn_3, other_spawn_4, other_spawn_5]


func spawn():
	if Global.height < 105:
		# scale spawn probability based on Global.height
		var random_num = randi_range(0,99)
		if random_num < 5: # make sure not spawning multiple on same spot ever since it doesn't move
			var random_worker = worker_spawns.pick_random()
			var new_worker = WORKER.instantiate()
			new_worker.global_position = random_worker.global_position
			game.add_child(new_worker)
		random_num = randi_range(0,99)
		if random_num < 12: # 15 percent
			var random_bird = bird_spawns.pick_random()
			var new_bird = BIRD.instantiate()
			new_bird.global_position = random_bird.global_position
			game.add_child(new_bird)
		random_num = randi_range(0,99)
		if random_num < 12: # 15 percent
			var random_other = other_spawns.pick_random()
			var new_projectile = PROJECTILE.instantiate()
			new_projectile.global_position = random_other.global_position 
			game.add_child(new_projectile)
