extends MeshInstance3D

@export var preset_clock : LabelSettings
@export var preset_title : LabelSettings
@onready var flash_timer = $"../Flash_Timer"
@onready var label = $SubViewportContainer/SubViewport/Label
const TIME_FONT_SIZE := 64
const TIME_LINE_SPACING := 3
const TEXT_FONT_SIZE := 45
const TEXT_LINE_SPACING := 1
const START_TIME := 0.0
var time_elapsed := START_TIME
var has_game_started = false

func _ready():
	label.text = "Press START"
	label.label_settings = preset_title 
	#label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	#label.label_settings.font_size = TEXT_FONT_SIZE
	#label.label_settings.line_spacing = TEXT_LINE_SPACING
	GameStateManager.on_start.connect(on_game_start)
	

func on_game_start():
	has_game_started = true
	flash_timer.stop()
	label.show()
	label.label_settings = preset_clock
	#label.autowrap_mode = TextServer.AUTOWRAP_OFF
	#label.label_settings.font_size = TIME_FONT_SIZE
	#label.label_settings.line_spacing = TIME_LINE_SPACING
	label.text = str("%3.2f" % START_TIME)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not has_game_started:
		return
	
	time_elapsed += delta
	label.text = str("%3.2f" % time_elapsed)
	
	pass


func _on_flash_timer_timeout():
	label.visible = !label.visible
	pass # Replace with function body.
