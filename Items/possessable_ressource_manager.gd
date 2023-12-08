# PossessableSpawner
extends Node

enum PossessableName { DEBUG, BENCH, CONE, COUNTER, COOLER, CHAIR, PANELEUH, TABLE }

const DebugBox = preload("res://Items/possessable.tscn")
const Bench = preload("res://Environment/Assets/Bench.tscn")
const Cone = preload("res://Environment/Assets/Cone.tscn")
const Counter = preload("res://Environment/Assets/Counter.tscn")
const Cooler = preload("res://Environment/Assets/Cooler.tscn")
const Chair = preload("res://Environment/Assets/Chair.tscn")
const PanelEuh = preload("res://Environment/Assets/Panel.tscn")
const Table = preload("res://Environment/Assets/Table.tscn")

var possessable_by_name = {
	PossessableName.BENCH: Bench,
	PossessableName.DEBUG: DebugBox,
	PossessableName.CONE: Cone,
	PossessableName.COUNTER: Counter,
	PossessableName.COOLER: Cooler,
	PossessableName.CHAIR: Chair,
	PossessableName.PANELEUH: PanelEuh,
	PossessableName.TABLE: Table,
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
