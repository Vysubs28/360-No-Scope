extends Area2D

# level 2 --> level 4
func _on_body_entered(body):
	body.fly()
	print("here")
	get_tree().change_scene_to_file("res://LevelMenu/NextLevel4.tscn")
