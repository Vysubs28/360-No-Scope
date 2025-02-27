extends CharacterBody2D

@export var speed := 450

var direction = Vector2(1,0)
var bounced = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func change_direction():
	if (bounced == 3):
		queue_free()
	print("Hit a wall")
	direction *= -1
	$Arrow.scale.x *= -1
	bounced += 1
func bounce(x_angle, y_angle):
	print("bouncing")
	if (bounced == 3):
		queue_free()
	if (x_angle < 0 && y_angle > 0):
		direction = Vector2(0, 1).normalized()
	elif(x_angle < 0 && y_angle < 0): 
		direction = Vector2(0, -1).normalized()
	elif(x_angle > 0 && y_angle < 0):
		direction = Vector2(1, 0).normalized()
	elif(x_angle > 0 && y_angle > 0): 
		direction = Vector2(-1, 0).normalized()
	bounced += 1
	$Arrow.rotation = direction.angle()
	

func _physics_process(delta):
	var velocity1 = direction * speed
	var collision = move_and_collide(velocity1 * delta)
	if collision:
		var hit_body = collision.get_collider()
		var normal = collision.get_normal()
		print("Arrow hit: ", hit_body.name)
		if hit_body.is_in_group("enemies"):
			hit_body.killEnemy()
			queue_free()
		elif hit_body.is_in_group("walls"):
			print(normal)
			if normal.y > .1 or normal.y < -.1:
				var x_angle = normal.x
				var y_angle = normal.y
				bounce(x_angle, y_angle)
			else:
				change_direction()
		elif hit_body is TileMap:
			change_direction()
		elif hit_body.is_in_group("block"):
			queue_free()
			print("arrow destroyed")
