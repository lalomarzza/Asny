extends Spatial

const ObW = [preload("res://Scenes/ObjectSingle/Octopus.scn"),
preload("res://Scenes/ObjectSingle/LowPolyRockW.scn"),
preload("res://Scenes/ObjectSingle/LowPolyRockW.scn"),
preload("res://Scenes/ObjectSingle/LowPolyRockW.scn"),
preload("res://Scenes/ObjectSingle/LowPolyRockW.scn")]

const Power = [preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Ruby.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn")]

var O1
var O2
var Pw
var SpawnPw
var ContOnPw = 0
var RCantPw

func _ready():
	randomize()
	O1 = ObW[randi()%ObW.size()]
	O2 = O1.instance()
	O2.set_rotation_degrees(Vector3(0,randi()%360,0))
	self.add_child(O2)
	ContOnPw = randi()%4+1
	if ContOnPw == 2:
		Pw = Power[randi()%Power.size()]
		SpawnPw = Pw.instance()
		get_parent().get_child(1).get_node("Spatial").add_child(SpawnPw)
		get_parent().get_child(1).set_rotation_degrees(Vector3(0,0,22.5))
