extends Node3D

@export var intro_loop: AudioStreamPlayer
@export var main_loop: AudioStreamPlayer

var should_start_main_loop := false

func _ready():
	GameStateManager.on_start.connect(_on_game_start)

func _on_game_start():
	should_start_main_loop = true	

func _on_intro_finished():
	if not should_start_main_loop:
		intro_loop.play()
		return
	 
	main_loop.play()
