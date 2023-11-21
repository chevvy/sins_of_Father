class_name CharacterVisual extends Node3D

@onready var animationPlayer: AnimationPlayer = $AnimationPlayer

func _ready():
	#idle_animation()
	run_animation()

func hit_animation():
	animationPlayer.play("Character_Hurt")
	
func run_animation():
	animationPlayer.play("Character_Run")
	
func idle_animation():
	animationPlayer.play("Character_Idle")
