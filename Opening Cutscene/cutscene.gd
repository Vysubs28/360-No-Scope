extends Node2D


@onready var mandrake = $"Richard MC/mandrake"
@onready var sfx_intro = $"Richard MC/sfx_intro"
@onready var orcanim = $Orc/orcanim
@onready var skeletonanim = $skeleton/skeletonanim
@onready var skeleton = $skeleton
@onready var orc = $Orc



# Called when the node enters the scene tree for the first time.
func _ready():
	orc.visible = false
	skeleton.visible = false
	mandrake.play("Hello")
	sfx_intro.play()
	$orcTimer.start(23.0)
	$skeletonTimer.start(24.5)
	

func _on_orcTimer_timeout():
	orc.visible = true
	orcanim.play("orc_hello")
	

func _on_skeletonTimer_timeout():
	skeleton.visible = true
	skeletonanim.play("skeleton_hello")
	

func _on_mandrakeSprite_finished():
	if mandrake.animation == "Hello":
		mandrake.play("Gesture 1 ")
	elif  mandrake.animation == "Gesture 1 ":
		mandrake.play("Gesture 2")


func _on_mandrakeAudio_finished():
	mandrake.play("Hello")
	

func _on_orc_AnimationSprite2D_finished():
	if orcanim.animation == "orc_hello":
		orcanim.play("orc_hello")
		

func _on_skeleton_AnimationSprite2D_finished():
	if skeletonanim.animation == "skeleton_hello":
		skeletonanim.play("skeleton_hello")



func _on_orc_timer_timeout():
	pass # Replace with function body.


func _on_skeleton_timer_timeout():
	pass # Replace with function body.
