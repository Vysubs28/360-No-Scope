extends Node2D

@onready var sfx_music = $sfx_music


const bullet_scene: PackedScene = preload("res://Assets/Rockstar Studios/New Character Design/character_body_2d.tscn")
var enemies = 2
# Called when the node enters the scene tree for the first time.
func _ready():
	sfx_music.play()


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")


func _on_restart_pressed():
	get_tree().reload_current_scene()





func _on_mc_2_shoot(pos):
	var bullet = bullet_scene.instantiate()
	$Bullets2.add_child(bullet)
	bullet.position = pos + Vector2(-10, -170)
	print("shot an arrow")
	print(pos)
	print(bullet.position)


func _on_enemy_1_enemy_died():
	print("We got to the signal")
	enemies -= 1


func _on_enemy_2_enemy_died():
	enemies -= 1
	print("we got to the second signal")
	
