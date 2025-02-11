extends CharacterBody2D

@export var speed := 450

var direction = Vector2.RIGHT
# Called every frame. 'delta' is the elapsed time since the previous frame.
func change_direction():
	print("Hit a wall")
	direction *= -1
	$Arrow.scale.x *= -1
func _physics_process(delta):
	var velocity1 = direction * speed
	var collision = move_and_collide(velocity1 * delta)
	if collision:
		var hit_body = collision.get_collider()
		print("Arrow hit: ", hit_body.name)
		if hit_body.is_in_group("enemies"):
			hit_body.killEnemy()
			queue_free()
		elif hit_body.is_in_group("walls"):
			change_direction()
		elif hit_body is TileMap:
			change_direction()
