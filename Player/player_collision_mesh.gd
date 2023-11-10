class_name PlayerCollisionMesh extends CollisionShape3D

var default_player_mesh: Mesh = null

@export var ghost: GhostRig
@export var possessable_mesh: MeshInstance3D

func _ready():
	if ghost == null:
		printerr("[player_collision_mesh] Missing player mesh reference")
		return
		

func set_player_mesh(new_mesh: MeshInstance3D) -> void:
	possessable_mesh.mesh = new_mesh.mesh
		

func reset_to_default_player_mesh() -> void:
	possessable_mesh.mesh = null
	
