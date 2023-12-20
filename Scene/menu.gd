extends Control

@onready var animator = $AnimationPlayer


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start"):
		LevelManager.load_main()


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "intro" :
			animator.play("idle")
	else : 
		return
