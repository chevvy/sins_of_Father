class_name PossessableData extends Node3D
## The mesh that is used to replace the current player mesh
var mesh: MeshInstance3D
var possessable_name: PossessableRessourceManager.PossessableName

func _init(new_mesh: MeshInstance3D, new_name: PossessableRessourceManager.PossessableName):
	mesh = new_mesh
	possessable_name = new_name


