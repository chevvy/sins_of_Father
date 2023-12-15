## A list of position based on player index
class_name PositionsList extends Node3D

## List of position based on player index (0 to 3)
@export var player_list: Array[Marker3D] = []


func get_position_for_player(player_id: int) -> Marker3D:
	var player_position = player_list[player_id]
	if player_position:
		return player_position
	return null
