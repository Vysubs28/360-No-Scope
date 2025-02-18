extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_restart_pressed():
	get_tree().reload_current_scene()
