extends Control

var ui_color = {
	"red": Color(1, 0, 0, 1),
	"blue": Color(0, 0, 1, 1),
	"yellow": Color(1, 1, 0, 1),
	"green": Color(0, 1, 0, 1)
}

@onready var panels = get_tree().get_nodes_in_group("panel_color")
@onready var win_label = $WIN_COLOR
@onready var win_title = $WIN_TITLE
@onready var root_cont = $Root_Cont
@onready var animator = $AnimationPlayer


func _ready():
	root_cont.hide()
	win_label.hide()
	win_title.hide()


func set_color(value: String):
	if value == null:
		return

	animator.play("Appear")
	root_cont.show()
	win_label.show()
	win_title.show()
	win_label.modulate = ui_color[value]
	win_label.text = value

	for panel in panels:
		panel.modulate = ui_color[value]


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Appear":
		animator.play("Disappear")

	if anim_name == "Disappear":
		root_cont.hide()
		win_label.hide()
		win_title.hide()
	else:
		return
