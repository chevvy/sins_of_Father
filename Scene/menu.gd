extends Control

@onready var animator = $AnimationPlayer

func _unhandled_input(event):
	if event == ["interact_0","interact_1","interact_2","interact_3","interact_4"] : 
		pass


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "intro" :
			animator.play("idle")
	else : 
		return
