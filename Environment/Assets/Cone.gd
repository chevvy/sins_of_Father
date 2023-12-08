extends Possessable

@export var label_text = "1"

@onready var label_ref = $Cone_002/SubViewportContainer/SubViewport/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	label_ref.text = label_text
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
