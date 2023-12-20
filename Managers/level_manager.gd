extends Node

@onready var menu_path = "res://Scene/menu.tscn"
@onready var main_path = "res://main.tscn"
@onready var win_path = "res://Ui/encore.tscn"

func load_menu():
	get_tree().change_scene_to_file(menu_path)

func load_main():
	get_tree().change_scene_to_file(main_path)

func load_win():
	get_tree().change_scene_to_file(win_path)
