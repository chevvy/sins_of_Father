# PossessableSpawner
extends Node

enum PossessableName { DEBUG, BENCH }

const DebugBox = preload("res://Items/possessable.tscn")
const Bench = preload("res://Environment/Assets/Bench.tscn")

var possessable_by_name = {
	PossessableName.BENCH: Bench,
	PossessableName.DEBUG: DebugBox,
}


func spawn_possessable(possessable_name: PossessableName, pos: Vector3):
	var poss = possessable_by_name.get(possessable_name)
	if poss:
		# we instantiate the new possesable
		var new_possessable: Node = poss.instantiate()
		# adds the new possessable at the root
		get_tree().root.add_child(new_possessable)
		new_possessable.position = pos
#
#func spawn_debug_box(pos: Vector3):
## we instantiate the new possesable
#var new_possessable: Node = DebugBox.instantiate()
## adds the new possessable at the root
#get_tree().root.add_child(new_possessable)
#new_possessable.position = pos
#
#func spawn_bench(pos: Vector3):
## we instantiate the new possesable
#var new_possessable: Node = Bench.instantiate()
## adds the new possessable at the root
#get_tree().root.add_child(new_possessable)
#new_possessable.position = pos
