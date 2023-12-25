extends Node

signal on_start
signal on_finish

var player_id_winner = -1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	on_finish.connect(on_finish_game)

func on_finish_game(wining_player_id: int):
	player_id_winner = wining_player_id
	call_deferred("load_win_menu")

func load_win_menu():
	LevelManager.load_win()
