extends Node3D


@onready var ghost_skeleton = $Skeleton3D

# Called when the node enters the scene tree for the first time.
func _ready():
	
	ghost_skeleton.physical_bones_start_simulation(["Spine_02","Spine_03","Spine_04"])
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
