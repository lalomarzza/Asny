extends Spatial

func _ready():
	randomize()
	get_child(0).set_rotation_degrees(Vector3(randi()%359+1,0,randi()%359+1))
