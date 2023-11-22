class_name CharacterController extends RigidBody3D

var speed := 10
@export var goal_marker: Marker3D

	

func _physics_process(delta):
	if goal_marker == null:
		return
		
	# look_at(goal_marker.position)é
	var move_vec = (goal_marker.position - position).normalized() * 5 * delta
	print(move_vec)
	
	move_and_collide(move_vec)
