class_name PlayerCollisionMesh extends CollisionShape3D

@export var playerMesh: MeshInstance3D
var default_player_mesh: Mesh = null


func _ready():
	if playerMesh == null:
		printerr("[player_collision_mesh] Missing player mesh reference")
		return
		
	default_player_mesh = playerMesh.mesh

func set_player_mesh(new_mesh: MeshInstance3D) -> void:
	playerMesh.mesh = new_mesh.mesh
		

func reset_to_default_player_mesh() -> void:
	playerMesh.mesh = default_player_mesh
	
