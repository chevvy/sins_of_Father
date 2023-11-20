class_name Possessable extends RigidBody3D

@export var POSSESSABLE_SCENE: PackedScene
@export var POSSESSABLE_MESH: MeshInstance3D

var should_apply_force := false
var force: Vector3

func _ready():
	if POSSESSABLE_SCENE == null:
		printerr("[possessable] missing scene reference in properties")
	if POSSESSABLE_MESH == null:
		printerr("[possessable] missing mesh reference in properties")

func possess():
	queue_free()
	
func get_possessable_scene() -> PossessableData:
	return PossessableData.new(POSSESSABLE_MESH, POSSESSABLE_SCENE)
	
func _physics_process(delta):
	if should_apply_force and force != null:
		apply_central_impulse(force)
		should_apply_force = false

func apply_force_to_possessable(vec3: Vector3):
	force = vec3
	should_apply_force = true
	
