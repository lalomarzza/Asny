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
#		get_node(str("/root/Ctrl/VpCtrl/Vport/World/AsnyPlayer/")).set_translation(Vector3(3,-45,-20))
#		set_unit_offset(.025)
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
#		W.get_node("AsnyPlayer/ElAsny").set_traslation(Vector3(0,-1,0))
#		Base.targetAsny.get_node("VR").set_traslation()
##		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/DirectionalLight")).hide()
#		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/",Base.CFloor-1,"/C")).hide()
#		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/",Base.CFloor,"/C")).hide()
#		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/",Base.CFloor,"/M")).hide()
#		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/",Base.CFloor-1,"/M")).hide()
#		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/",Base.CFloor,"/O")).hide()
#		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/",Base.CFloor-1,"/O")).hide()
#		Base.AsnyPress.set_translation(Vector3(0,0,0))
#		body.get_parent().set_translation(Vector3(0,.4,0))
		get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/Spatial")).set_translation(Vector3(-3,3.5,0))
		if Base.Ctrl == "VR":
			Base.VelG = -.075
			Base.targetAsnyVR.set_translation(Vector3(2,1.5,0.05))
#			get_node(str("/root/Ctrl/VBoxContainer/ViewportContainer2/Viewport2/Spatial/Camera")).set_translation(Vector3(0.2,0,0))

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
	get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/Spatial")).set_translation(Vector3(-3,20,0))
	Base.VelG = 0.05
	if Base.Ctrl == "VR":
		Base.VelG = 0.01
	get_node(str("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork")).show()
	get_tree().call_group("Collider","On")

func _reload():
	set_process(true)
