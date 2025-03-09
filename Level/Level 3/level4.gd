extends Node2D

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
@onready var enemy = $AnimatableBody2D/enemy2
var moving = true
# Called when the node enters the scene tree for the first time.
func _ready():
	animation.play("Enemy_Walking")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if moving:
		path.progress += speed
func stop_moving():
	moving = false
	animation.pause()
	enemy.play("death1")
	await enemy.animation_finished
	queue_free()

