extends Node


var _camera: Camera3D

func set_camera(cam: Camera3D) -> void:
	if cam == null:
		return

	_camera = cam

	print("got camera")

func get_basis():
	return _camera.transform.basis

