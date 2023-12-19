extends Node

signal on_start
signal on_finish

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_finish.connect(on_finish_game)

func on_finish_game(wining_player_id: int):
	print("player id wins : " + String.num_int64(wining_player_id))

