extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	AudioPlayer._play_music_level()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_start_pressed():
	get_tree().change_scene_to_file("res://tutorial_menu.tscn")


func _on_levels_pressed():
	get_tree().change_scene_to_file("res://LevelMenu/LevelMenu.tscn")
	
func play_fx(stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = volume
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	
	fx_player.queue_free()


