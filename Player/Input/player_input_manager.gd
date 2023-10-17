class_name PlayerInputManager extends Node


@export var inputMaps: Array[PlayerInputMap] = []
@export var playerScene: PackedScene

var playerIdPerSpawnKey: Dictionary = {
	"interact_0": 0,
	"interact_1": 1,
	"interact_2": 2,
	"interact_3": 3,
	"interact_4": 4,
}


func _ready():
	if inputMaps.size() == 0:
		printerr("No input map found on player input manager")
	
	if playerScene == null:
		printerr("Missing player scene on input manager")


func _unhandled_input(event):
	if event.is_action_pressed("quit game"):
		get_tree().quit()


func _input(event):
	for input_map in inputMaps:
		var interactKey := input_map.interact
		if event.is_action_pressed(interactKey):
			_try_spawning_player(interactKey, event, input_map)


func _try_spawning_player(interactKey: String, event: InputEvent, input_map: PlayerInputMap):
	var player_id = playerIdPerSpawnKey[interactKey]
	var player = playerScene.instantiate();
	if player is Player:
		player.set_player_settings(player_id, input_map)
		add_child(player)
		print("spawned player" + String.num_int64(player_id))
	else:
		printerr("playerScene reference in inputmanager is not a player")
		player.queue_free()
