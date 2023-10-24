class_name Possessable extends Node3D

@export var POSSESSABLE_SCENE: PackedScene
@export var POSSESSABLE_MESH: MeshInstance3D

func _ready():
	if POSSESSABLE_SCENE == null:
		printerr("[possessable] missing scene reference in properties")
	if POSSESSABLE_MESH == null:
		printerr("[possessable] missing mesh reference in properties")

func possess():
	queue_free()
	
func get_possessable_scene() -> PossessableData:
	return PossessableData.new(POSSESSABLE_MESH, POSSESSABLE_SCENE)
	
