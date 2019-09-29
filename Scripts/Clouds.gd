extends Spatial

func _process(delta):
	rotate_x(.05*delta)
	rotate_z(.05*delta)
