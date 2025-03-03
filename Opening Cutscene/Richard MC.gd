extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var mandrake = $mandrake
@onready var sfx_intro = $sfx_intro

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	mandrake.play("Hello")
	sfx_intro.play()
	

func _on_mandrake_animation_finished():
	if mandrake.animation == "Hello":
		mandrake.play("Gesture 1 ")
	elif mandrake.animation == "Gesture 1":
		mandrake.play("Gesture 2")
