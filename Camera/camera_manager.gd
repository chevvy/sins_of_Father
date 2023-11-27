extends Node

var _camera: Camera3D

func set_camera(cam: Camera3D):
	_camera = cam

func get_camera() -> Camera3D:
	return _camera
