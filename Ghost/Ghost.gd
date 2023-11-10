class_name GhostRig extends Node3D


@onready var ghost_skeleton = $Ghost/Skeleton3D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	ghost_skeleton.physical_bones_start_simulation(["Spine_02","Spine_03","Spine_04"])
	
	pass # Replace with function body.
