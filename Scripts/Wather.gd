extends Spatial

var ContF1 = 0

func _process(delta):
	ContF1 = -20 * delta
	Base.Rtto.set_rotation_degrees(Base.Rtto.get_rotation_degrees()+Vector3(ContF1,0,0))
#	print($Base/.get_rotation_degrees())#+Vector3(ContF1,Base.RotY,$Base/.get_rotation_degrees().z))
#	Base.Rott.set_rotation_degrees(Vector3(ContF1,Base.RotY,Base.Rott.get_rotation_degrees().z))

const ObW = [preload("res://Scenes/ObjectSingle/ObW.scn")]
var ObWh
var Ob
var PosW = 1
var R1 = 1
var R2 = 15
var RT = 90
var TW = -1.2
var TH = 0
func _ready():
	Base.Rott = $Base/
	Base.Rtto = $Base/Spatial
	randomize()
	for i in 8:
		while PosW <= 330:
			R1 = rand_range(PosW+randi()%10+15,PosW+randi()%25+35)
			R2 = rand_range(R1,R1+15)
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

