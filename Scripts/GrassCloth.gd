extends Spatial

func _ready():
	randomize()
	get_child(0).set_rotation_degrees(Vector3(0,randi()%360,0))

