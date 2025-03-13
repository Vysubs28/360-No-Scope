extends Control


@onready var level_music = $Level_Music
# Called when the node enters the scene tree for the first time.
func _ready():\
	level_music.play()


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://level/level1.tscn")

# Making Level 4 --> Level 2
func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://level/level 3/level4.tscn")


func _on_level_3_pressed():
	get_tree().change_scene_to_file("res://level/level 3/level3.tscn")

# Making Level 2 --> level 4
func _on_level_4_pressed():
	get_tree().change_scene_to_file("res://level/level 2/level2.tscn")

func _on_level_5_pressed():
	get_tree().change_scene_to_file("res://Level/Level 5/Level 5.tscn")
