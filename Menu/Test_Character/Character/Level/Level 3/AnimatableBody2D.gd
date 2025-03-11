extends AnimatableBody2D
func killEnemy():
	var parent = get_parent()
	if parent:
		parent.killEnemy()
