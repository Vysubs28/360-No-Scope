extends Label

func _ready():
	var death = Global.display_glob_death()
	var message = "Total Deaths: " + str(death)
	text = message
