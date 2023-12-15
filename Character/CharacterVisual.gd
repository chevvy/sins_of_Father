class_name CharacterVisual extends Node3D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer
@export var character_mesh: MeshInstance3D

func _ready():
	#idle_animation()
	run_animation()

func set_runner_material(mat: BaseMaterial3D):
	
	character_mesh.material_override = mat

func hit_animation():
	animationPlayer.play("Character_Hurt")
	
func run_animation():
	animationPlayer.play("Character_Run")
	
func idle_animation():
	animationPlayer.play("Character_Idle")
