extends CharacterBody2D


@export var speed : float =  200.0
@export var jump_velocity : float = -300.0

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var animation_locked : bool = false
var direction : Vector2 = Vector2.ZERO
var was_in_air : bool = false
var can_shoot : bool = true
var dead : bool = false

signal shoot(pos: Vector2)

func _physics_process(delta):
	if (not dead):# Add the gravity.
		if not is_on_floor():
			velocity.y += gravity * delta
			was_in_air = true
		else: 
			if was_in_air == true:
				land()
			
			was_in_air = false
		# Handle jump. # spin = jump
		if Input.is_action_just_pressed("spin"): 
			if is_on_floor():
				spin()
				
		if Input.is_action_just_pressed("shoot") and can_shoot:
			shoot.emit(global_position)
			can_shoot = false
			$CooldownTimer.start()

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		direction = Input.get_vector("left", "right", "up", "down")
		if direction:
			velocity.x = direction.x * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	update_animation()
	
	
func update_animation():
	if not animation_locked:
		if direction.x != 0:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
			
func spin():
	velocity.y = jump_velocity
	animated_sprite.play("spin")
	animation_locked = true
	
func land():
	animated_sprite.play("jump_end")
	animation_locked = true


func _on_animated_sprite_2d_animation_finished():
	if(animated_sprite.animation == "jump_end"):
		animation_locked = false
		

func _on_cooldown_timer_timeout():
	can_shoot = true

func killMC():
	print('player died')
	dead = true
	velocity.y = 0
	velocity.x = 0
