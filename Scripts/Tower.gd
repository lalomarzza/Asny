extends Spatial

var alt = 0

func _process(delta):
	alt += .3
	set_translation(Vector3(0,alt*delta,0))
	get_child(0).rotate_y(.01)
