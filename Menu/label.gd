extends Label

func _ready():
	var death = Global.display_death()
	var message = "Deaths: " + str(death)
	text = message
