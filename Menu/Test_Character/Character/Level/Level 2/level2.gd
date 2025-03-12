extends Node2D

@onready var level_music = $Level_Music

const bullet_scene: PackedScene = preload("res://Assets/Rockstar Studios/New Character Design/character_body_2d.tscn")
var enemies = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	level_music.play()


func _on_exit_pressed():
	enemies = 2
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_restart_pressed():
	enemies = 2
	get_tree().reload_current_scene()

func _on_mc_2_shoot(pos):
	var bullet = bullet_scene.instantiate()
	$Bullets2.add_child(bullet)
	bullet.position = pos + Vector2(-10, -170)



func _on_enemy_1_enemy_died():
	var player = get_node("MC2")
	enemies -= 1
	

func _on_enemy_2_enemy_died():
	var player = get_node("MC2")
	enemies -= 1
	if player and enemies == 0:
		player.fly()
		
