extends MeshInstance3D


@onready var label = $SubViewportContainer/SubViewport/Label


var time_elapsed := 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	time_elapsed += delta
	label.text = str("%3.2f" % time_elapsed)
	
	pass
