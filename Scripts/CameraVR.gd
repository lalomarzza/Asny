extends Spatial

var posi

func _ready():
#	get_node("/root/Ctrl/VBox").margin_left=0
#	get_node("/root/Ctrl/VBox").margin_right=512
#	get_node("/root/Ctrl/VBoxContainer").margin_right=1024
#	get_node("/root/Ctrl/VBoxContainer").margin_left=514
#	$Camera.set_translation(Vector3(1,0,0))
	pass

func _process(delta):
	posi = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Camera").get_global_transform()
	set_global_transform(posi)
#	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/VR").set_rotation(Input.get_accelerometer()+get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/VR").get_rotation())
