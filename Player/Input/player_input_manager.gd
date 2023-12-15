class_name PlayerInputManager extends Node

const KEYBOARD_PLAYER_ID := 4

@export var inputMaps: Array[PlayerInputMap] = []
@export var playerScene: PackedScene
@export var runner_spawn_list: PositionsList
@export var runner_goal_list: PositionsList
@export var runner_scene: PackedScene
@export var runner_material: Array[BaseMaterial3D] = [] 

var playerIdPerSpawnKey: Dictionary = {
	"interact_0": 0,
	"interact_1": 1,
	"interact_2": 2,
	"interact_3": 3,
	"interact_4": 4,
}

var playerStates: Array[int] = []

func _ready():
	if inputMaps.size() == 0:
		printerr("No input map found on player input manager")
	
	if playerScene == null:
		printerr("Missing player scene on input manager")

	if runner_goal_list == null:
		printerr("Missing runner_goal_list on input manager")

	if runner_spawn_list == null:
		printerr("Missing runner_spawn_list on input manager")


func _unhandled_input(event):
	if event.is_action_pressed("quit game"):
		get_tree().quit()


func _input(event):
	for input_map in inputMaps:
		var interactKey := input_map.interact
		if event.is_action_pressed(interactKey):
			_try_spawning_player(interactKey, input_map)


func _try_spawning_player(interactKey: String, input_map: PlayerInputMap):
	var player_id: int = playerIdPerSpawnKey[interactKey]
	
	if playerStates.has(player_id):
		return

	var player = playerScene.instantiate();
	if player is Player:
		_set_player_states(player_id)
		player.set_player_settings(player_id, input_map)
		add_child(player)
		# CharacterManager.on_player_spawn.emit(player_id)
		print("spawned player" + String.num_int64(player_id))

		spawn_runner_with_goal(player_id)
	else:
		printerr("playerScene reference in inputmanager is not a player")
		player.queue_free()

func spawn_runner_with_goal(player_id: int):
	var runner := runner_scene.instantiate() as CharacterWithController
	add_child(runner)
	runner.goal_marker = runner_goal_list.get_position_for_player(player_id)
	runner.position = runner_spawn_list.get_position_for_player(player_id).position
	runner.set_runner_info(player_id, runner_material[player_id])
	runner.rotation.y = 90

func _set_player_states(id: int):
	if playerStates.has(id):
		printerr("error should not have player id already in array")
		return
		
	playerStates.push_back(id)
		
