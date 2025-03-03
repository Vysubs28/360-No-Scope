extends Node2D


@onready var richard_mc = $"Richard MC"
@onready var orc = $Orc
@onready var skeleton = $skeleton
@onready var dialogue_box__panel_ = $"DialogueBox (Panel)"



# Called when the node enters the scene tree for the first time.
func _ready():
	richard_mc.emote()
	await get_tree().create_timer(3.0).timeout
	orc.show()
	orc.emote()
	await get_tree().create_timer(0.5).timeout
	skeleton.show()
	skeleton.emote()
	await get_tree().create_timer(2).timeout
	SceneManager.change_scene("res://Opening Cutscene/kitchen_scene.tscn")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
