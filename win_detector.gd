extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body is CharacterWithController:
		GameStateManager.on_finish.emit(body.player_id)		
