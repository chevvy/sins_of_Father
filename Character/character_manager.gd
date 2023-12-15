extends Node

signal on_player_spawn

# Called when the node enters the scene tree for the first time.
func _ready():
	on_player_spawn.connect(_spawn_player)
	pass # Replace with function body.

func _spawn_player(player_id: int):
	print("spawned character" + String.num_int64(player_id))
	pass
