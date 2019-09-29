extends PathFollow

var speed = 5
var Posi
var PosiZ

func _ready():
	set_process(false)

var dog

func _process(delta):
	set_offset(get_offset()+Base.VelR*delta)
	if get_unit_offset() >= .1 && get_unit_offset() <= .11:
		get_parent().get_node("Path/PathFollow/").set_process(true)
		dog = get_parent().get_node("Path/PathFollow/Ctrl/Dog")
		dog.set_translation(Vector3(0,.5,0))
		dog.set_rotation(Vector3(0,0,0))
		dog._start()
	if get_unit_offset() >= .93:
		_overG()

func _overG():
	Base.W.get_node("AsnyPlayer/ElAsny").set_mode(1)
	Base._ChangeF()
	dog._end()
	Base.target = get_node(Base.PsPlyRt).get_parent()
	get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/Spatial")).set_translation(Vector3(-3,20,0))
#		get_node(Base.PosPlF).set_rotation_degrees(Vector3(Posi+0,0,0))
	Base.VelG = 0.05
	Base.Bas = "F"
	Base.PosAsny = PosiZ
	Base.VelZ = 9
	set_process(false)
	Base.VelR = 5

var Bod

func _on_Area_body_entered(body):
	if body.is_in_group("Detect"):
		Bod = body
		get_node(Base.PsPlyRt).set_translation(Vector3(0,Base.Alt+1,0))
#		get_node(Base.PsPlyRt).set_rotation(Vector3(10,0,0))
		if Base.Acc == true:
			get_parent().get_node("Path/AnimationPlayer2").play("FenceO")
		else:
			_Down()
		Base.Acc = false
		get_node("/root/Ctrl/VBox/VpCtrl/MiniGameR").hide()

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

func _over():
	Base.W.get_node("AsnyPlayer/ElAsny").set_mode(1)
	Base.Bas = "F"
	Base.PosAsny = PosiZ
	Base.VelZ = 9
	set_process(false)

func _reload():
	set_process(true)

func _enter():
	Base.W.get_node("AsnyPlayer/ElAsny").set_mode(1)
	get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/Spatial")).set_translation(Vector3(-15,7,0))
	set_unit_offset(.025)
	Base.Posi = get_node(Base.PosPlF).get_rotation_degrees().z
	PosiZ = Base.PosAsny
	Base.BasNode = self
#	Bod.get_parent().set_translation(Vector3(0,.5,0))
	set_process(true)
	Base.PsPlyRt = str($Spatial/AsnyControl/Control.get_path())
	$Area/CollisionShape.set_disabled(true)
	Base.target = get_node(Base.PsPlyRt).get_parent()
	Base.VelG = 1.25
	Base.Bas = "R"
	Base.VelZ = 4.2
	Bod.get_tree().call_group("Col2","disabled")


func _on_AnimationPlayer2_animation_finished(anim_name):
	_enter()
