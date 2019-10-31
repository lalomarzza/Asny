extends Spatial

const Trees = [preload("res://Scenes/ObjectSingle/N/T1.scn"),
preload("res://Scenes/ObjectSingle/N/T1.scn"),
preload("res://Scenes/ObjectSingle/N/T1.scn"),
preload("res://Scenes/ObjectSingle/N/P1.scn")
]

var CnMn = 1
var CnTr = 1

func _enter_tree():
	randomize()
	$Cshn.set_rotation_degrees(Vector3(0,randi()%365,0))
	for i in 2:
		if i + 1 == 4:
			CnMn = 2
			CnTr = 1
		CnTr +=1
		var Tr = Trees[randi() % Trees.size()]
		var SpawnTr = Tr.instance()
		get_child(CnTr).add_child(SpawnTr)
