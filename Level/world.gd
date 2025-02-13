extends Node2D

@onready var collision_polygon_2d = $StaticBody2D/CollisionPolygon2D
@onready var polygon_2d = $StaticBody2D/CollisionPolygon2D/Polygon2D

@onready var collision_polygon_2d2 = $StaticBody2D/CollisionPolygon2D2
@onready var polygon_2d2 = $StaticBody2D/CollisionPolygon2D2/Polygon2D2

const bullet_scene: PackedScene = preload("res://Assets/Rockstar Studios/New Character Design/character_body_2d.tscn")

func _ready():
	polygon_2d.polygon = collision_polygon_2d.polygon
	polygon_2d2.polygon = collision_polygon_2d2.polygon
	


func _on_mc_shoot(pos): 
	var bullet = bullet_scene.instantiate()
	$Bullets.add_child(bullet)
	bullet.position = pos + Vector2(8, -170)
	

func _on_enemy_1_enemy_died():
	print("We got to the signal")
	var player = get_node("MC")
	if player:
		player.fly()
	else:
		print("found an error")
		
func _on_exit_pressed():
	get_tree().change_scene_to_file("res://Menu/main_menu.tscn")
	
func _on_restart_pressed():
	get_tree().reload_current_scene()
