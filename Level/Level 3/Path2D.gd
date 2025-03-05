extends Path2D

@export var loop = true
@export var speed = 2.0
@export var speed_scale = 1.0

@onready var path = $PathFollow2D
@onready var animation = $AnimationPlayer
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var Enemy_Death = $Enemy_Death
signal enemy_died
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#if not loop:
		animation.play("Enemy_Walking")
		if is_dead:
			killEnemy()
		#animation.speed_scale = speed_scale
		#set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	path.progress += speed

func killEnemy():
	if is_dead:
		return
	is_dead = true
	enemy_died.emit()
	print('alien1 hit')
	animated_sprite.play("death")
	Enemy_Death.play()
	await animated_sprite.animation_finished
	queue_free()
