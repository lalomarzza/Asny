extends Spatial

const Trees = [preload("res://Scenes/ObjectSingle/N/T1.scn"),
preload("res://Scenes/ObjectSingle/N/T1.scn"),
preload("res://Scenes/ObjectSingle/N/T1.scn"),
preload("res://Scenes/ObjectSingle/N/Rock1.scn"),
preload("res://Scenes/ObjectSingle/N/Rock2.scn"),
preload("res://Scenes/ObjectSingle/N/Rock3.scn"),
preload("res://Scenes/ObjectSingle/N/P1.scn")]

var R1 = 0
var R2 = 0

#func _ready():
#	randomize()
#	R1 = randi()%3+1
#	R2 = randi()%3+1
#	while (R1==R2):
#		R2 = randi()%3+1
#	var Tr = Trees[randi() % Trees.size()]
#	var SpawnTr = Tr.instance()
#	get_node(str("Sp",R1)).add_child(SpawnTr)
#	Tr = Trees[randi() % Trees.size()]
#	SpawnTr = Tr.instance()
#	get_node(str("Sp",R2)).add_child(SpawnTr)
