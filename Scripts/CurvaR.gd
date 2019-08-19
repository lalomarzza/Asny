extends Spatial

const Power = [preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Coin.scn"),
preload("res://Scenes/ObjectSingle/Ruby.scn")]

var Dm = preload("res://Scenes/ObjectSingle/Thunder.scn")

const Obs = [preload("res://Scenes/ObjectSingle/Desert1.scn"),
preload("res://Scenes/ObjectSingle/Desert1.scn"),
preload("res://Scenes/ObjectSingle/Desert2.scn"),
preload("res://Scenes/ObjectSingle/Desert2.scn"),
preload("res://Scenes/ObjectSingle/Desert3.scn")]

var RPosCntPw = 0
var RCantPw = 0
var ContPw = 0
var RPosHPw = 0
var RPosHObs = 0
var ContOnPw = 0
var ContOnOb = 0

var Ob
var SpawnOb
var Pw
var SpawnPw

var taken = false

func _ready():
	randomize()
	RPosCntPw = randi()%10+5
	RCantPw = randi()%5+4
	RPosHPw = randi()%5+1
	for i in self.get_children().size():
		ContPw += 1
		ContOnOb += 1
		RPosHObs = int(rand_range(1,5))
		if ContPw >= RPosCntPw:
			if  ContOnPw <= RCantPw:
				ContOnPw += 1
				Pw = Power[randi()%Power.size()]
				SpawnPw = Pw.instance()
				if ContOnPw-1 == RCantPw:
					SpawnPw = Dm.instance()
				get_child(i).get_node(str(RPosHPw)).add_child(SpawnPw)
				if RPosHObs == RPosHPw:
					match RPosHPw:
						1,2: RPosHObs = int(rand_range(3,5))
						4,5: RPosHObs = int(rand_range(1,3))
			else:
				ContPw = 0
				ContOnPw = 0
				RPosCntPw = randi()%10+5
				RCantPw = randi()%6+4
				RPosHPw = randi()%5+1
		if ContOnOb == 7:
			Ob = Obs[randi()%Obs.size()]
			SpawnOb = Ob.instance()
			SpawnOb.rotate_y(randi()%359+1)
			get_child(i).get_child(RPosHObs).add_child(SpawnOb)
			ContOnOb = 0
