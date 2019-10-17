extends Spatial

const ObW = [preload("res://Scenes/ObjectSingle/ObW.scn")]
var ObWh
var Ob
var PosW = 1
var R1 = 1
var R2 = 15
var RT = 90
var TW = -1.2
var TH = 0
var ContF1 = 0
var Vect = Vector3(0,0,0)
var Rott
var Rtto
var cc
var yy
var ry
var ly
var PosiZ
var Posi

func _ready():
	set_process(false)
	Base.Rott = $Base/
	Base.Rtto = $Base/Spatial
	Base.ly = $Base/Spatial/L
	Base.ry = $Base/Spatial/R
	randomize()

func _enter():
	set_process(true)
	for i in 8:
		while PosW <= 330:
			R1 = rand_range(PosW+randi()%45+55,PosW+randi()%45+55)
			R2 = rand_range(R1,R1+30)
			PosW = rand_range(R1,R2)
			ObWh = ObW[0]
			Ob = ObWh.instance()
			Ob.set_rotation_degrees(Vector3(0,0,PosW))
			get_node(str("BlueMoon2/Obs")).add_child(Ob)
			Ob.get_node("Spatial").set_rotation_degrees(Vector3(RT,0,0))
		if TW <= .4:
			TH += .3
		else:
			TH -= .3
		RT -= 22.5
		TW += .4
		PosW = 0

func _process(delta):
	cc = $Base/Spatial/C.get_global_transform()
	Base.Rott.set_global_transform(cc)

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
