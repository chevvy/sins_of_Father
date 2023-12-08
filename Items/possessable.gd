class_name Possessable extends RigidBody3D

@export var POSSESSABLE_MESH: MeshInstance3D
@export var POSSESSABLE_NAME: PossessableRessourceManager.PossessableName

var should_apply_force := false
var force: Vector3

func _ready():
	if POSSESSABLE_MESH == null:
		printerr("[possessable] missing mesh reference in properties")
	if POSSESSABLE_NAME == null:
		printerr("[possessable] missing possessable name in properties")

func possess():
	queue_free()
	
func get_possessable_data() -> PossessableData:
	return PossessableData.new(POSSESSABLE_MESH, POSSESSABLE_NAME)
	
func _physics_process(_delta):
	if should_apply_force and force != null:
		apply_central_impulse(force)
		should_apply_force = false

func apply_force_to_possessable(vec3: Vector3):
	force = vec3
	should_apply_force = true
	
