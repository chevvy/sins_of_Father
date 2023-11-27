class_name GameCamera extends Camera3D


func _ready() -> void:
	CameraManager.set_camera(self)
