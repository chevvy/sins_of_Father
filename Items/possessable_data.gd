class_name PossessableData extends Node3D
## The mesh that is used to replace the current player mesh
var mesh: MeshInstance3D
## the scene that will be instantiated once we are finished with possession
var possessable_scene: PackedScene

func _init(new_mesh: MeshInstance3D, new_scene: PackedScene):
    mesh = new_mesh
    possessable_scene = new_scene

