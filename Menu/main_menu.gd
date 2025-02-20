extends Node2D

@onready var sfx_music = $sfx_music

# Called when the node enters the scene tree for the first time.
func _ready():
	sfx_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Level/level1.tscn")


func _on_levels_pressed():
	get_tree().change_scene_to_file("res://LevelMenu/LevelMenu.tscn")


func _on_exit_pressed():
	get_tree().quit()
