class_name PossessableDetector extends Area3D


signal on_possessable_impact
@export var push_force_on_possessable = 50

func _on_body_entered(body):
	
	if body is Possessable:
		print("possessable impact, emiting")
		on_possessable_impact.emit()
		
		# send impact to object
		body.apply_force_to_possessable(Vector3(1, 1, 0) * push_force_on_possessable)
		
