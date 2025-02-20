extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayer._play_music_level()

func _on_next_pressed():
	get_tree().change_scene_to_file("res://Level/level1.tscn")
