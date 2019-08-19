extends MeshInstance

const Power = [preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Ruby.scn")]

var Pw
var SpawnPw

func _Pw():
	for i in 4:
		Pw = Power[randi()%Power.size()]
		SpawnPw = Pw.instance()
		get_child(i).add_child(SpawnPw)
