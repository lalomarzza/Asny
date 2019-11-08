extends Spatial

const Obs = [preload("res://Scenes/ObjectSingle/N/R1.scn"),
preload("res://Scenes/ObjectSingle/N/R1.scn"),
preload("res://Scenes/ObjectSingle/N/Tree.scn")]

const Mns = [preload("res://Scenes/ObjectSingle/N/HHA.scn"),
preload("res://Scenes/ObjectSingle/N/Pig.scn")]

const Mnt = [preload("res://Scenes/ObjectSingle/N/MntD.scn"),
preload("res://Scenes/ObjectSingle/N/MntI.scn")]

var Rv = preload("res://Scenes/ObjectSingle/N/CorkRiver.scn")

var RObs = 0
var RMns = 0

func _ready():
	randomize()
	RObs = round(rand_range(5,7))
	RMns = round(rand_range(1,5))

var Obbs
var SpawnOb

func _obs():
	RObs = round(rand_range(1,5))
	Obbs = Obs[randi()%Obs.size()]
	SpawnOb = Obbs.instance()
	SpawnOb.set_rotation_degrees(Vector3(0,randi()%365,0))
	get_node(str(RObs)).add_child(SpawnOb)
	get_parent().mvo[str(get_parent().s,"0",get_parent().CtO)] = RObs
	get_parent().CtO += 1

var ObMn
var SpawnMn

func _mns():
	RMns = round(rand_range(5,7))
	ObMn = Mns[randi()%Mns.size()]
	SpawnMn = ObMn.instance()
	get_node(str(RMns)).add_child(SpawnMn)
	get_parent().mvm[str(get_parent().s,get_parent().CtM)] = [RMns,"1",get_parent().s,get_parent().CtM]
	get_parent().ent = int(get_parent().mvm[str(get_parent().s,get_parent().CtM)])
	print(get_parent().ent)
	get_parent().CtM += 1

var ObMt
var SpawnMt
var BlMtOn = true

func _mnt():
	if BlMtOn == true:
		for i in 2:
			ObMt = Mnt[i]
			SpawnMt = ObMt.instance()
			get_node(str(8+i)).add_child(SpawnMt)
			get_parent().mvt[str(get_parent().s,"2",get_parent().CtT)] = 8+i
			get_parent().CtT += 1
	else:
		SpawnMt = Rv.instance()
		get_node(str(8)).add_child(SpawnMt)
		get_parent().mvt[str(get_parent().s,"3",get_parent().CtT)] = 8
		get_parent().CtT += 1
