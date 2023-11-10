extends CharacterBody3D


const SPEED = 40
const PUSH_FORCE = 50

@export var goal_marker: Marker3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	var move_vec = (goal_marker.position - position).normalized() * 5 * delta
	velocity.x = move_vec.x * SPEED
	velocity.z = move_vec.z * SPEED

	move_and_slide()
	apply_collision()

func apply_collision():
	# after calling move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody3D:
			c.get_collider().apply_central_impulse(-c.get_normal() * PUSH_FORCE)
	
