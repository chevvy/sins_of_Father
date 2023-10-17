class_name Player extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

var current_player_id: int
var current_input_map: PlayerInputMap

func set_player_settings(player_id: int, input_map: PlayerInputMap):
	current_player_id = player_id
	current_input_map = input_map
	

func _is_player_ready():
	return current_player_id != null and current_input_map != null


func _physics_process(delta):
	if not _is_player_ready():
		return
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle Jump.
	# TODO should we use jump loL? 
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var move_left = current_input_map.move_left
	var move_right = current_input_map.move_right
	var move_forward = current_input_map.move_forward
	var move_backward = current_input_map.move_backward
	var input_dir = Input.get_vector(move_left, move_right, move_forward, move_backward)
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
