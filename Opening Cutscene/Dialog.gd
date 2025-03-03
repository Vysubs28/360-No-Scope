extends Control


@onready var _dialog : Label = $Text
var _typing_speed : float = 60
var _typing_time : float



# Called when the node enters the scene tree for the first time.
func _ready():
	display_text("Hello! My name is Richard Mandrake. I live in a small town located hidden in the depths of Evergreen Forest. Life is not easy for warrior people like us. Not only we have to hunt for food and we are responsible for safe guarding of our town. To keep threat away from the city we have a Hunter's guild which assigns tasks such as elimination of Orcs, Goblins, Skeleton Army and more. The population of these monsters is growing at a dangerous pace which is leading to more powerful monster waves.")
	

func display_text(text : String):
	_dialog.text = text
	_dialog.visible_characters = 0
	_typing_time = 0
	while _dialog.visible_characters < _dialog.get_total_character_count():
		_typing_time += get_process_delta_time()
		_dialog.visible_characters = _typing_speed * _typing_time as int
		await get_tree().process_frame

