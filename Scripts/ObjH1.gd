extends Spatial

func _process(delta):
	get_child(0).rotate_z(-.01)
	rotate_z(.01)
	pass
