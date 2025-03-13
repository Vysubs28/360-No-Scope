extends Area2D

func _on_body_entered(body):
	body.fly()
	print("here")
	Global.reset_death()
	get_tree().change_scene_to_file("res://LevelMenu/NextLevel.tscn")
