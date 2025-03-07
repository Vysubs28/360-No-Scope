extends Control

@onready var video_stream_player = $VideoStreamPlayer
@onready var skip = $Skip

# Called when the node enters the scene tree for the first time.
func _ready():
	video_stream_player.play()
	video_stream_player.finished.connect(_on_video_stream_player_finished)
	
	if skip:
		skip.pressed.connect(_on_skip_pressed)
		skip.hide()
		await get_tree().create_timer(1.0).timeout
		if is_instance_valid(skip):
			skip.show()



func _on_video_stream_player_finished():
	load_main_menu_scene()
	

func load_main_menu_scene():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_skip_pressed():
	load_main_menu_scene()
