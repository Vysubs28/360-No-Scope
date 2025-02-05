extends Area2D

@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
func _ready():
	add_to_group("Enemy")


func _on_hitbox_body_entered(body):
	if body.is_in_group("Movement"):
		animated_sprite.play("death")
