extends AnimatedSprite2D
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D
@onready var Enemy_Death = $Enemy_Death
signal enemy_died
# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var is_dead = false



func change_direction():
	self.scale.x *= -1
	if(is_dead == false):
		$Timer.start()

func killEnemy():
	if is_dead:
		return
	is_dead = true
	enemy_died.emit()
	Enemy_Death.play()
	var parent = get_parent()
	if parent:
		var grandparent = parent.get_parent()
		if grandparent:
			grandparent.stop_moving()


func _on_timer_timeout():
	change_direction()
