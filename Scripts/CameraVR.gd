extends Spatial

var posi

func _process(delta):
	posi = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Camera").get_global_transform()
	set_global_transform(posi)
#	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/VR").set_rotation(Input.get_accelerometer()+get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/VR").get_rotation())
