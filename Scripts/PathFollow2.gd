extends PathFollow

var speed = 5
var Posi
var PosiZ
var PosiO
var Unit = 0
var UnitC = .9

func _ready():
	set_process(false)

func _process(delta):
	set_offset(get_offset()+speed*delta)
	Unit = get_unit_offset()
	UnitC = 1
	if Unit >= UnitC:
		_overG()
		if get_unit_offset() >= 1:
			_over()

func _on_Area_body_entered(body):
	if body.is_in_group("Detect"):
		get_tree().call_group("Collider","Off")
		Base.BasNode = self
#		PosiO = get_node(Base.PsPlyRt).get_global_transform().origin
#		get_node(Base.AsnyPress.get_path()).set_translation(PosiO)
		Posi = get_node(Base.PosPlF).get_rotation_degrees().x
		PosiZ = Base.PosAsny
		print(PosiZ)
		set_process(true)
		Base.PsPlyRt = str($Spatial/AsnyControl/Control.get_path())
		$Area/CollisionShape.set_disabled(true)
		Base.target = get_node(Base.PsPlyRt).get_parent()
		Base.VelG = -1.25
		Base.Bas = "H"
		Base.VelZ = 4
		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork")).hide()
#		Base.W.get_node("AsnyPlayer/ElAsny").set_mode(1)
		Base.CamPos.set_translation(Vector3(-1.5,3.5,0))
		Base.CamPos.set_rotation_degrees(Vector3(-25,-90,0))
		if Base.Ctrl == "VR":
			Base.VelG = -.075
			Base.targetAsnyVR.set_translation(Vector3(2,1.5,0.05))

func _over():
	set_process(false)
	Base.W.get_node("AsnyPlayer/ElAsny").set_mode(1)
	Base.Bas = "F"
	Base.PosAsny = PosiZ
	Base.VelZ = 9

func _overG():
	Base._ChangeF()
	get_node(Base.PosPlF).get_rotation_degrees()
	Base.target = get_node(Base.PsPlyRt).get_parent()
	Base.CamPos.set_translation(Vector3(-3,20,0))
	Base.CamPos.set_rotation_degrees(Vector3(-50,-90,0))
	Base.VelG = 0.05
	if Base.Ctrl == "VR":
		Base.VelG = 0.01
	get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork")).show()
	get_tree().call_group("Collider","On")

func _reload():
	set_process(true)
