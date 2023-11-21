extends CharacterBody3D


const SPEED = 40
const PUSH_FORCE = 5
var is_being_knockedback := false
var knockback_dir : Vector3 = Vector3(0, 0 ,0)

@export var goal_marker: Marker3D
@export var knockback_timer: Timer
@export var char_visual: CharacterVisual


func _physics_process(delta):
	# Add the gravity.
	var move_vec = (goal_marker.position - position).normalized() * 5 * delta
	if is_being_knockedback:
		knockback_dir.y = 0
		velocity = move_vec + knockback_dir * PUSH_FORCE
	else:
		velocity.x = move_vec.x * SPEED
		velocity.z = move_vec.z * SPEED

	move_and_slide()
	apply_collision()

	lerp(knockback_dir, Vector3.ZERO, 0.8)

func apply_collision():
	# after calling move_and_slide()
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody3D:
			if is_being_knockedback:
				return
			
			var dir = -c.get_normal()
			c.get_collider().apply_central_impulse(dir * PUSH_FORCE)
			knockback_dir = c.get_position().direction_to(global_position)
			is_being_knockedback = true
			knockback_timer.start()
			print("start of knockback")
			char_visual.hit_animation()


func _on_knockback_timer_timeout():
	print("end of knockback")
	is_being_knockedback = false
	char_visual.run_animation()