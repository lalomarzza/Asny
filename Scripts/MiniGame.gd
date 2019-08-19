extends Control

var Rot1
var Rot2
const RotP = [90,180,270]

func _ready():
	randomize()

func _Game():
	Rot1 = RotP[randi()%RotP.size()]
	$Node2D.set_rotation_degrees(Rot1)
	Rot2 = RotP[randi()%RotP.size()]
	$Node2D2.set_rotation_degrees(Rot2)
	show()

func _on_TextureButton2_button_up():
	Rot2 += 90
	if Rot2 == 360:
		Rot2 = 0
	$Node2D2.set_rotation_degrees(Rot2)
	_Acc()

func _on_TextureButton_button_up():
	Rot1 += 90
	if Rot1 == 360:
		Rot1 = 0
	$Node2D.set_rotation_degrees(Rot1)
	_Acc()

func _Acc():
	if Rot1 == 0 && Rot2 == 0:
		Base.Acc = true
	else:
		Base.Acc = false
