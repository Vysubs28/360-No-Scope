extends Area2D

# level 2 --> level 4
func _on_body_entered(body):
	body.fly()
	Global.reset_death()
	get_tree().change_scene_to_file("res://levelMenu/nextLevel2.tscn")
