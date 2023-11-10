class_name Character extends Node3D

@export var path_follow: PathFollow3D

func _ready():
	if path_follow == null:
		printerr("MISSING PATH FOLLOW ON CHAR")

func _physics_process(delta):
	const move_speed = 4
	path_follow.progress += move_speed * delta
	

func on_hit_by_object():
	const hit_impact = 10
	path_follow.progress -= hit_impact
	
	
