extends Spatial

const Power = [preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn")]

var Dm = preload("res://Scenes/ObjectSingle/Ruby.scn")

var Pw
var SpawnPw

var ID

func _Pw():
	for i in 4:
		Pw = Power[randi()%Power.size()]
		SpawnPw = Pw.instance()
		get_child(i).add_child(SpawnPw)

func _on_Area_body_entered(body):
	if body.is_in_group("Detect"):
#		if ID == "I":
#			Base.Vect = Vector3(0,0,.075)
#			Base._rot()
#			Base.PosAsny = .075
#		if ID == "D":
#			Base.Vect = Vector3(0,0,-.075)
#			Base._rot()
#			Base.PosAsny = -.075
		Base.Alt = get_translation().y
		get_node(Base.PsPlyRt).set_translation(Vector3(0,Base.Alt,0))

func _on_AreaI_body_entered(body):
	if body.is_in_group("Detect"):
		if Base.Fn == true:
			Base.Ult = Base.PosAsny
			Base.Fn = false
#		Base.Vect = Vector3(0,0,.075)
#		Base._rot()
#		Base.PosAsny = .075
		Base.Alt = get_translation().y
		get_node(Base.PsPlyRt).set_translation(Vector3(0,Base.Alt,0))
		ID = "I"
		

func _on_AreaD_body_entered(body):
	if body.is_in_group("Detect"):
		if Base.Fn == true:
			Base.Ult = Base.PosAsny
			Base.Fn = false
#		Base.Vect = Vector3(0,0,-.075)
#		Base._rot()
#		Base.PosAsny = -.075
		Base.Alt = get_translation().y
		get_node(Base.PsPlyRt).set_translation(Vector3(0,Base.Alt,0))
		ID = "D"


func _on_Cork_body_entered(body):
	if body.is_in_group("Asny"):
		Base.Vect = Vector3(0,0,0)
		Base._rot()
		Base.PosAsny = 0

func _on_Fence_body_entered(body):
	if body.is_in_group("Asny"):
#		Base.Vect = Vector3(0,0,0)
#		Base._rot()
#		Base.PosAsny = 0
#		Base.PosPlayerAsny.set_translation(Vector3(0,50.75,0))
#		Base.Alt = 50.75
		Base.Vect = Vector3(0,0,Base.Ult)
		Base._rot()
		Base.PosAsny = Base.Ult
		if Base.Ult == 0:
			Base.PosPlayerAsny.set_translation(Vector3(0,50.75,0))
			Base.Alt = 50.75

func _on_Up_body_entered(body):
	if body.is_in_group("Detect"):
		Base.PosPlayerAsny.set_translation(Vector3(0,52,0))
#	if body.is_in_group("Detect2"):
#		Base.PosPlayerAsny.set_translation(Vector3(0,50.75,0))
#		Base.targetAsny2.get_node("AnimationPlayer").play("000")

func _on_RockPl_body_entered(body):
	if body.is_in_group("Detect"):
		Base.Alt = get_translation().y
		get_node(Base.PsPlyRt).set_translation(Vector3(0,Base.Alt+1,0))

func _on_Ramp_body_entered(body):
	if body.is_in_group("Detect"):
		Base.Posi = get_node(Base.PosPlF).get_rotation_degrees().x
		var PosiZ = Base.PosAsny
		Base.BasNode = self
#		body.get_parent().set_translation(Vector3(0,-5,0))
		Base.PsPlyRt = str("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/MeshInstance/Base/")
		Base.target = get_node(Base.PsPlyRt).get_parent()
		Base.VelG = 1.25
		Base.Bas = "W"
		body.get_tree().call_group("Col2","disabled")

func _on_Recua_body_entered(body):
	if body.is_in_group("Detect"):
		get_node(Base.PsPlyRt).set_translation(Vector3(0,Base.Alt+1,0))
#		get_node(Base.PsPlyRt).set_rotation(Vector3(10,0,0))
		if Base.Acc == true:
			$RecuaM/AnimationPlayer.play("ArmatureAction")
		else:
			_Down()
		Base.Acc = false
		get_node("/root/Ctrl/VBox/VpCtrl/Vport/MiniGameR").hide()

func _Down():
	Base.PosPlayerAsny.set_translation(Vector3(0,50.75,0))
	Base.Alt = 50.75
	Base.targetAsny2.get_node("AnimationPlayer").play("000")
	if Base.Fn == false:
		Base.Vect = Vector3(0,0,Base.Ult)
		Base._rot()
		Base.PosAsny = Base.Ult
		Base.Fn = true
	Base.Bas = "F"
	Base.VelZ = 9

func _on_AnimationPlayer_animation_finished(anim_name):
	Base.Posi = get_node(Base.PosPlF).get_rotation_degrees().x
	var PosiZ = Base.PosAsny
	Base.BasNode = self
#	body.get_parent().set_translation(Vector3(0,-5,0))
	Base.PsPlyRt = str("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/BMW/BlueMoonW/Base/Spatial/Ctrl")
	Base.target = get_node(Base.PsPlyRt).get_parent()
	Base.VelG = 1.25
	Base.Bas = "W"
	Base.VelZ = 0

func _on_Game_body_entered(body):
	Base.Bas = "M"
	Base.VelZ = 3
	get_node("/root/Ctrl/VBox/VpCtrl/MiniGameR")._Game()
	get_node("/root/Ctrl/VBox/VpCtrl/MiniGameR").show()

func Detect():
	Base.PosPlayerAsny.set_translation(Vector3(0,50.75,0))
	Base.Alt = 50.75
	Base.targetAsny2.get_node("AnimationPlayer").play("000")
	if Base.Fn == false:
		Base.Vect = Vector3(0,0,Base.Ult)
		Base._rot()
		Base.PosAsny = Base.Ult
		Base.Fn = true


func _on_Area_body_exited(body):
	if body.is_in_group("Detect"):
		Detect()

func _on_Up_body_exited(body):
	if body.is_in_group("Detect"):
		Detect()

#func _on_Rot_body_entered(body):
#	if body.is_in_group("Rot"):
##		Base.RotY = get_rotation_degrees().y
#		print(Base.RotY,"Y")

func _on_Thunder_body_entered(body):
	if body.is_in_group("Asny"):
		Base.VelR += .5
		$ThunderVolt.hide()
