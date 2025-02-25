extends Node2D
@onready var level_music = $Level_Music

# Called when the node enters the scene tree for the first time.
func _ready():
	level_music.play()




func _on_start_pressed():
	get_tree().change_scene_to_file("res://Menu/tutorial_menu.tscn")


func _on_levels_pressed():
	get_tree().change_scene_to_file("res://LevelMenu/LevelMenu.tscn")


