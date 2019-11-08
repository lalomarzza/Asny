extends Spatial

var ContOnObMn = 0
var ContOnRv = 0

var CnOb = 4
var ContOnOb = 4
var BlOb = true

var ContOnMn = 1
var BlMn = true

var ContOnMt = 1
var BlMt = true
var CnMt = 0

var pos = 0

var mvo = {}
var mvm = {}
var mvt = {}

var Cn = 0
var CtO = 0
var CtM = 0
var CtT = 0

var s

var ent

func _ready():
	mvo.clear()
	mvm.clear()
	mvt.clear()
	for S in get_children().size():
		s = S
########Mountain###########
		if S >= ContOnMt:
			if BlMt == true:
				ContOnMt += 15
				CnMt += 1
				if CnMt == 5:
					get_child(S).BlMtOn = false
				get_child(S)._mnt()
				get_child(S).BlMtOn = true
				if CnMt == 3:
					BlOb = false
					BlMn = false
				if CnMt >= 7:
					BlOb = true
					BlMn = true
					CnMt = 0
########Monsters##########
		if S >= ContOnMn:
			ContOnMn += 1
			ContOnObMn += 1
			BlOb = false
			if ContOnObMn == 8:
				if BlMn == true:
					get_child(S)._mns()
			if ContOnObMn >= 15:
				BlOb = true
				ContOnObMn = 0
				ContOnMn += 30
########Obstacles#########
		if S >= ContOnOb:
			if BlOb == true:
				ContOnOb += CnOb
				get_child(S)._obs()

var M = 0

func _mov():
	M += 1
