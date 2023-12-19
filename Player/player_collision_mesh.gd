class_name PlayerCollisionMesh extends CollisionShape3D

var default_player_mesh: Mesh = null

@export var ghost: GhostRig
@export var possessable_mesh: MeshInstance3D
@export var player: Player

var outlines_res = load("res://Character/Material/outline_materials.tres")
var outline_mat: Array[BaseMaterial3D]

func _ready():
	if ghost == null:
		printerr("[player_collision_mesh] Missing player mesh reference")
		return
	outline_mat = outlines_res.outline_mat
		

func set_player_mesh(new_mesh: MeshInstance3D) -> void:
	possessable_mesh.mesh = new_mesh.mesh
	possessable_mesh.material_overlay = outline_mat[player.current_player_id]
	
		

func reset_to_default_player_mesh() -> void:
	possessable_mesh.mesh = null
	
