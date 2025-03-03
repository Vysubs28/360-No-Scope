extends Panel

onready var label = $Label
var dialouge_index = 0
var dialouge = []
var typing_speed = 0.05

func start_dialouge(text_array):
	dialouge = text_array
	dialouge_index = 0
	show()
	display_next_dialouge()
	

func display_next_dialouge():
	if dialouge_index < dialouge.size():
		var text = dialouge[dialouge_index]
		label.text = ""
		for character in text:
			label.text += character
			$Timer.start(typing_speed)
			await $Timer.timeout
		dialouge_index += 1
	else:
		hide()


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
