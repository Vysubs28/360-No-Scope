extends Node2D

@onready var level_music = $Level_Music

const bullet_scene: PackedScene = preload("res://Assets/Rockstar Studios/New Character Design/character_body_2d.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	level_music.play()

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")

func _on_restart_pressed():
	get_tree().reload_current_scene()


func _on_mc_shoot(pos):
	var bullet = bullet_scene.instantiate()
	$Bullets2.add_child(bullet)
	bullet.position = pos + Vector2(-50, -140)

func _on_enemy_2_enemy_died():
	var player = get_node("MC")
	if player:
		player.fly()
	
	else:
		print("found an error")

