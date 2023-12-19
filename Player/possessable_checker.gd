class_name PossessableChecker extends Area3D

var latest_possessable: Possessable

func try_possess() -> PossessableData:
	# should do more than just delete lol
	if latest_possessable == null:
		return null
	
	var data: PossessableData = latest_possessable.get_possessable_data()
	latest_possessable.possess()
	latest_possessable = null
	return data
	


func _on_body_entered(body):
	if body is Possessable:
		latest_possessable = body
		# todo change for actual player id
		latest_possessable.on_hover(0)
		
	pass # Replace with function body.


func _on_body_exited(body):
	if body == latest_possessable:
		remove_possessable()
	pass # Replace with function body.


func set_possessable(body: Possessable):
	latest_possessable = body


func remove_possessable():
	if latest_possessable == null:
		print("cant remove possessable, no current possessable")
		return
		
	latest_possessable.on_hover_exit()
	latest_possessable = null
