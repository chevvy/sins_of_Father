extends Possessable

@export var label_text = "1"

@onready var label_ref = $Cone_002/SubViewportContainer/SubViewport/Label

func _ready():
	label_ref.text = label_text
