class_name PlayerInputManager extends Node

const KEYBOARD_PLAYER_ID := 4

@export var inputMaps: Array[PlayerInputMap] = []
@export var playerScene: PackedScene
@export var runner_spawn_list: PositionsList
@export var runner_goal_list: PositionsList
@export var runner_scene: PackedScene
@export var runner_material: Array[BaseMaterial3D] = [] 
@export var player_outlines: Array[BaseMaterial3D] = []

const KEYBOARD_INTERACT_VALUE := 4
const KEYBOARD_INTERACT_KEY := "interact_4"

var playerIdPerSpawnKey: Dictionary = {
	"interact_0": 0,
	"interact_1": 1,
	"interact_2": 2,
	"interact_3": 3,
	KEYBOARD_INTERACT_KEY: KEYBOARD_INTERACT_VALUE,
}

var list_of_spawned_player_id: Array[int] = []

var is_keyboard_spawned: bool = false

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
	var player_id: int = _get_adjusted_player_id(interactKey)
	
	if list_of_spawned_player_id.has(player_id) or player_id == -1:
		return

	var player = playerScene.instantiate();
	if player is Player:
		_set_player_states(player_id)
		player.set_player_settings(player_id, input_map, player_outlines[player_id])
		add_child(player)
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
	if list_of_spawned_player_id.has(id):
		printerr("error should not have player id already in array")
		return
		
	list_of_spawned_player_id.push_back(id)
		
## As the keyboard is the 4th player, we need to adjust its index based on what
## player are connected right now
func _get_adjusted_player_id(interact_key: String) -> int:
	var base_player_id: int = playerIdPerSpawnKey[interact_key]

	if base_player_id != KEYBOARD_INTERACT_VALUE:
		if list_of_spawned_player_id.has(base_player_id) and not is_keyboard_spawned:
			print("cant spawn player" + String.num_int64(base_player_id) + " has its already spawned")
			return -1
		elif list_of_spawned_player_id.has(base_player_id) and is_keyboard_spawned:
			print("adjusting player id because of keyboard already there")
			base_player_id += 1
			print("new player id is :" + String.num_int64(base_player_id))
		return base_player_id
	
	# keyboard spawning logic
	if base_player_id == KEYBOARD_INTERACT_VALUE:
		if is_keyboard_spawned:
			return -1
			
		var adjusted_player_id: int = 0
		# if we already have values
		if list_of_spawned_player_id.size() != 0:
			adjusted_player_id = list_of_spawned_player_id.front() + 1
		
		print("spawning player as player id " + String.num_int64(adjusted_player_id))
		is_keyboard_spawned = true
		return adjusted_player_id
	
	return base_player_id
