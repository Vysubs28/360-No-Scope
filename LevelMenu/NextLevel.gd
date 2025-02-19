extends Control

#NextLevel_1 is first, Level 2,3,4 come after next level screen. Only Level 1 "tutorial"
# doesnt have a NextLevel tag
const FILE_BEGIN = "res://LevelMenu/NextLevel_"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")

func _on_next_pressed():
	get_tree().change_scene_to_file("res://Level/Level 2/Level2.tscn")
