# PossessableSpawner
extends Node

const _debug_box = preload("res://Items/possessable.tscn")

func spawn_debug_box(pos: Vector3):
	# we instantiate the new possesable
	var new_possessable: Node = _debug_box.instantiate()
	# adds the new possessable at the root
	get_tree().root.add_child(new_possessable)
	new_possessable.position = pos
