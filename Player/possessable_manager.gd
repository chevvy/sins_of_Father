class_name PossessableManager extends Node

@export var playerMesh: PlayerCollisionMesh
@export var playerRootNode: Player

var current_possessable_data: PossessableData
var default_player_mesh: MeshInstance3D

var is_possessing: bool = false

@onready
var _possessable_spawner: PossessableRessourceManager = get_node("/root/PossessableRessourceManager")

func _ready():
	if playerMesh == null:
		printerr("[possessable manager] missing player mesh reference")

	if playerRootNode == null:
		printerr("[possessable manager] missing player reference")
	
	

func set_possessable(data: PossessableData):
	if data == null:
		printerr("[possessable-manager] received null possessabledata")
		return
		
	if current_possessable_data != null:
		return
	current_possessable_data = data
	playerMesh.set_player_mesh(current_possessable_data.mesh)
	is_possessing = true


# will set possessable as the player mesh
# and possibly collider ? 
func use_possessable():
	if current_possessable_data == null:
		return
	
	var newPos = playerRootNode.global_position
	newPos.z += playerRootNode.basis.z.z
	_possessable_spawner.spawn_possessable(current_possessable_data.possessable_name, newPos)
	
	# remove the current possesable and reset player mesh
	current_possessable_data = null
	playerMesh.reset_to_default_player_mesh()
	is_possessing = false

