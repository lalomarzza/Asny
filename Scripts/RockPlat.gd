extends MeshInstance

const Power = [preload("res://Scenes/ObjectSingle/N/Coin.scn"),
preload("res://Scenes/ObjectSingle/N/Coin.scn"),
preload("res://Scenes/ObjectSingle/N/Coin.scn"),
preload("res://Scenes/ObjectSingle/N/Coin.scn"),
preload("res://Scenes/ObjectSingle/N/Coin.scn"),
preload("res://Scenes/ObjectSingle/N/Coin.scn"),
preload("res://Scenes/ObjectSingle/N/Ruby.scn")]

var Pw
var SpawnPw

func _Pw():
	for i in 4:
		Pw = Power[randi()%Power.size()]
		SpawnPw = Pw.instance()
		get_child(i).add_child(SpawnPw)
