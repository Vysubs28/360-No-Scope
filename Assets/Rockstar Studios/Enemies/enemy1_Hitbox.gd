extends Area2D




func _on_area_entered(area):
	print('alien2 hit')
	area.queue_free()
	queue_free()
