class_name CharacterWithController extends CharacterBody3D


@export var  SPEED = 30
@export var PUSH_FORCE = 2
@export var COLLISION_PUSH_FORCE = 6
var is_being_knockedback := false
var knockback_dir : Vector3 = Vector3(0, 0 ,0)
var player_id: int = -1
var has_game_started = false

@export var goal_marker: Marker3D
@export var knockback_timer: Timer
@export var char_visual: CharacterVisual

func _ready() -> void:
	GameStateManager.on_start.connect(_on_game_start)
	char_visual.idle_animation()

func _on_game_start():
	has_game_started = true
	char_visual.run_animation()

func _on_game_finish():
	has_game_started = false
	char_visual.idle_animation()

func set_runner_info(new_player_id: int, mat: BaseMaterial3D):
	player_id = new_player_id
	char_visual.set_runner_material(mat)


func _physics_process(delta):
	if position.y < 0:
		position.y = 0
	
	if not has_game_started:
		return
	
	# Add the gravity.
	var move_vec = (goal_marker.global_position - global_position).normalized() * 5 * delta
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
		var collider = c.get_collider()
		if collider is RigidBody3D:
			if is_being_knockedback:
				return
			if collider is Possessable:
				collider.hit_possessable()
			
			is_being_knockedback = true
			var dir = -c.get_normal()
			var applied_force = dir * COLLISION_PUSH_FORCE
			print("applied force = ")
			print(applied_force)
			c.get_collider().apply_central_impulse(applied_force)
			knockback_dir = c.get_position().direction_to(global_position)
			knockback_timer.start()
			char_visual.hit_animation()



func _on_knockback_timer_timeout():
	is_being_knockedback = false
	char_visual.run_animation()
