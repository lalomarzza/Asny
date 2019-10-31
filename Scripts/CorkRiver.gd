extends Spatial

func _ready():
	randomize()
	$Icosphere004/Bridge.set_rotation_degrees(Vector3(0,0,int($Icosphere004/Bridge.get_rotation_degrees().z)+(randi()%5*3)))
	print($Icosphere004/Bridge.get_rotation_degrees().z,"zzzzzzz")
