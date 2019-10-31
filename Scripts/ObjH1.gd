extends Spatial

func _process(delta):
	$Spatial.rotate_z(-.05)
	$Spatial/Gear.rotate_y(.05)
	pass
