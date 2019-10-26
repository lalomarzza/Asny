extends Spatial
#
#const Terrain = [preload("res://Scenes/ObjectSingle/Coin.scn"),
#preload("res://Scenes/ObjectSingle/R1.scn"),
#preload("res://Scenes/ObjectSingle/Tree.scn"),
#preload("res://Scenes/ObjectSingle/Pine.scn"),
#preload("res://Scenes/ObjectSingle/MntD.scn"),
#preload("res://Scenes/ObjectSingle/MntI.scn"),
#preload("res://Scenes/ObjectSingle/CorkNClothD.scn"),
#preload("res://Scenes/ObjectSingle/CorkNClothI.scn"),
#preload("res://Scenes/ObjectSingle/Hose1.scn"),
#preload("res://Scenes/ObjectSingle/Lasso.scn"),
#preload("res://Scenes/ObjectSingle/RecuaNCork.scn"),
#preload("res://Scenes/ObjectSingle/Hill1.scn"),
#preload("res://Scenes/ObjectSingle/Platform.scn"),
#preload("res://Scenes/ObjectSingle/HHA.scn"),
#preload("res://Scenes/ObjectSingle/Pig.scn"),
#preload("res://Scenes/ObjectSingle/Ramp.scn")]
#
#var Tr
#var SpwTr
#var r = 0
#var num1 = 0
#
#func _ready():
#	_Spawn()
#
#func _Spawn():
#	for i in 4:
#		for m in num1:
#			r -= 12
#			Tr = Terrain[0]#randi()%Terrain.size()]
#			SpwTr = Tr.instance()
#			SpwTr.set_rotation(Vector3(m,0,0))
#			SpwTr.set_translation(Vector3(0,50,0))
#			$Terrain.add_child(SpwTr)
#		num1 += 30

const Power = [preload("res://Scenes/ObjectSingle/N/Coin.scn"),
preload("res://Scenes/ObjectSingle/N/Coin.scn")]

const Obs = [preload("res://Scenes/ObjectSingle/N/R1.scn"),
preload("res://Scenes/ObjectSingle/N/R1.scn"),
preload("res://Scenes/ObjectSingle/N/Tree.scn")]

const Obs2 = [preload("res://Scenes/ObjectSingle/N/Pine.scn"),
preload("res://Scenes/ObjectSingle/N/Tree.scn"),
preload("res://Scenes/ObjectSingle/N/Tree.scn"),
preload("res://Scenes/ObjectSingle/N/Tree.scn")]

var M1 = preload("res://Scenes/ObjectSingle/N/MntD.scn")
var M2 = preload("res://Scenes/ObjectSingle/N/MntI.scn")

var CD = preload("res://Scenes/ObjectSingle/N/CorkNClothD.scn")
var CI = preload("res://Scenes/ObjectSingle/N/CorkNClothI.scn")

var CR = [preload("res://Scenes/ObjectSingle/N/Hose1.scn"),
preload("res://Scenes/ObjectSingle/N/Lasso.scn"),
preload("res://Scenes/ObjectSingle/N/RecuaNCork.scn")]

var CH = preload("res://Scenes/ObjectSingle/N/Hill1.scn")

var Plat = preload("res://Scenes/ObjectSingle/N/Platform.scn")

const WT = [preload("res://Scenes/ObjectSingle/N/HHA.scn"),
preload("res://Scenes/ObjectSingle/N/Pig.scn")]

var Ramp = preload("res://Scenes/ObjectSingle/N/Ramp.scn")

var CkRv = preload("res://Scenes/ObjectSingle/N/CorkRiver.scn")

var Floor = preload("res://Scenes/FloorU.scn")

var RPosCntPw = 0
var RCantPw = 0
var ContPw = 0
var RPosHPw = 0
var ContOnPw = 0
var RPosHObs = 0
var ContOnOb = 0
var ContMn = 0
var ContMnPos = 12
var m = 0
var ContCk = 0
var ContCkPos = 6
var c = 0
var ContR = 0
var ContH = 0
var n = 1
var BoolPw = 1
var Rng1 = 0
var Rng2 = 0
var NewCk
var CkRnd = 0
var CkRndCn = 0
var RandObs = 0
var ContPlat = 0
var Treee
var RandRP = randi()%3+0

var S = 1
var ObR = -1
var ObO = 0
var ObH = 51
var SpawnOb
var Pw
var SpawnPw
var Mn1
var SpawnMn1
var SpawnMn2
var Ck
var SpawnCk
var SpawnFloor
var SpawnTree
var SpawnPlat

var ContSpw = 181
var ContSpawn = 4

var s = 0
var GR = 0
var GGR = 10
var RRot = 0
var RRotY = 0

var RS = 0
var HS = 0
var NS = 0
var PS = 0

var rot = 0

var lasso

func _ready():
	randomize()
	Base.RX = randi()%4
	print(Base.RX)
	Base.DN = -(Base.RX*90)
	if abs(Base.DN) == 180 || abs(Base.DN) == 270:
		print("Dia")
		get_node("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/DirectionalLight").show()
		get_node("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/DirectionalLight2").hide()
	else:
		print("Noche")
		get_node("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/DirectionalLight").hide()
		get_node("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/DirectionalLight2").show()
	print(abs(Base.DN))
	self.rotate(Vector3(1,0,0),rad2deg(Base.RX*90))
	rot = self.get_rotation_degrees().x
	_Start()

var NewMv = 180
var DicMv = {}

func _Start():
	RPosCntPw = randi()%20+15
	RandObs = randi()%2+1
	RCantPw = randi()%5+4
	CkRnd = randi()%2+1
	if CkRnd == 2:
		Rng1 = 3
		Rng2 = 5
	if CkRnd == 1:
		Rng1 = 1
		Rng2 = 3
	RPosHPw = int(rand_range(Rng1,Rng2))
	for i in 180:
		_SpawnS()

func _Spawn():
	if S == ContSpw:
		get_node(str(S-179)).free()
		ContSpw += 1
		_SpawnS()

var BoolM = false

func _SpawnS():
	S += 1
	s += .2
	SpawnFloor = Floor.instance()
	SpawnFloor.set_name(str(S))
	GR += 1
	SpawnFloor.set_rotation_degrees(Vector3(-S,0,0))
	add_child(SpawnFloor)
	ContOnOb += 1
	ContMn += 1
	ContCk += 1
	RPosHObs = int(rand_range(Rng1,Rng2))
	if ContCk == ContCkPos:
		CkRndCn += 1
		if CkRnd == 1:
			print(abs(-((Base.RX*90)+S)),"n")
			SpawnCk = CD.instance()
			if CkRndCn == 4:
				ContR += 1
				if ContR == 5:
					lasso = CR[2]#randi()%2]
					print(abs(-((Base.RX*90)+S)),"nnnnn")
					if abs(-((Base.RX*90)+S)) >= 180 && abs(-((Base.RX*90)+S)) <= 270:
						pass
					else:
						lasso = CR[1]#rand_range(0,1)]
					SpawnCk = lasso.instance()
					ContR = 0
					SpawnCk.set_translation(Vector3(0,ObH,0))
					Ck = get_node(str(S,"/L")).get_child(0).get_node("CorkD")
					Ck.add_child(SpawnCk)
					DicMv[S] = str(abs(S))
					print(DicMv[S])
				else:
					SpawnCk = CH.instance()
					SpawnCk.set_name(str(S,"C"))
					SpawnCk.set_translation(Vector3(0,ObH,0))
					Ck = get_node(str(S,"/C")).get_child(0).get_node("CorkD")
					Ck.add_child(SpawnCk)
			if CkRndCn <= 3:
				SpawnCk.set_translation(Vector3(0,float(ObH),0))
				Ck = get_node(str(S,"/C")).get_child(0).get_node("CorkD")
				Ck.add_child(SpawnCk)
				SpawnCk.set_name(str(S,"CD"))
				Treee = Obs2[randi()%Obs2.size()]
				SpawnTree = Treee.instance()
				SpawnCk.get_node(str(randi()%2+1)).add_child(SpawnTree)
				if RandObs == 1:
					RandObs = 2
				else:
					RandObs = 1
			ObH += 1
			RandObs = randi()%2+1
		if CkRnd == 2:
			SpawnCk = CI.instance()
			if CkRndCn == 4:
				ContR += 1
				if ContR == 5:
					lasso = CR[1]#rand_range(0,1)]
					if abs(-((Base.RX*90)+S)) >= 0 && abs(-((Base.RX*90)+S)) <= 270:
						pass
					else:
						lasso = CR[2]
					SpawnCk = lasso.instance()
					SpawnCk.set_name(str(S,"CD"))
					SpawnCk.set_translation(Vector3(0,float(ObH),0))
					Ck = get_node(str(S,"/L")).get_child(0).get_node("CorkI")
					Ck.add_child(SpawnCk)
					ContR = 0
				else:
					SpawnCk = CH.instance()
					SpawnCk.set_translation(Vector3(0,float(ObH),0))
					Ck = get_node(str(S,"/C")).get_child(0).get_node("CorkI")
					Ck.add_child(SpawnCk)
			if CkRndCn <= 3:
				SpawnCk.set_translation(Vector3(0,float(ObH),0))
				Ck = get_node(str(S,"/C")).get_child(0).get_node("CorkI")
				Ck.add_child(SpawnCk)
				Treee = Obs2[randi()%Obs2.size()]
				SpawnTree = Treee.instance()
				SpawnCk.get_node(str(randi()%2+1)).add_child(SpawnTree)
			ObH += 1
		if CkRnd == 3:
			var NewC = WT[randi()%WT.size()].instance()
			if randi()%2+1 == 1:
				NewCk = get_node(str(S,"/C")).get_child(0).get_node("CorkM")
			else:
				NewCk = get_node(str(S,"/C")).get_child(0).get_node("CorkM")
			c+=1
			if c >= 3 and c <=6:
				ObsC = true
			else:
				ObsC = false
			if c == 5:
				NewC.set_translation(Vector3(0,51.5,0))
				NewCk.add_child(NewC)
			if c == 10:
				CkRnd = randi()%2+1
				c = 0
		if CkRndCn == 4:
			if CkRnd == 1:
				ObH += 1
				CkRnd = 2
				BoolM = false
#				ContR += 1
				ContH += 1
				ContPlat += 1
				RandRP = randi()%3+0
				if ContH == 2:
					CkRnd = 3
					BoolM = true
					ContH = 0
			else:
				CkRnd = 1
#				ContR += 1
				BoolM = false
				ContH += 1
				ContPlat += 1
				RandRP = randi()%3+0
				if ContH == 2:
					CkRnd = 3
					BoolM = true
					ContH = 0
			CkRndCn = 0
			ObH = 51
			ObR = -1
		ContCkPos += 6
	if BoolM == true:
		CntR += 1
		if CntR == 5:
			if ContMn == ContMnPos:
				BoolO = false
			if ContMn == ContMnPos:
				Mn1 = get_node(str(S,"/M")).get_child(0).get_node("Mntn")
				SpawnMn1 = CkRv.instance()
				Mn1.add_child(SpawnMn1)
				ContMnPos += 12
				BoolO = true
			CntR = 0
		else:
			if ContMn == ContMnPos:
				Mn1 = get_node(str(S,"/M")).get_child(0).get_node("Mntn")
				SpawnMn1 = M1.instance()
				Mn1.add_child(SpawnMn1)
				SpawnMn2 = M2.instance()
				Mn1.add_child(SpawnMn2)
				ContMnPos += 12
	else:
		if ContMn == ContMnPos:
			Mn1 = get_node(str(S,"/M")).get_child(0).get_node("Mntn")
			SpawnMn1 = M1.instance()
			Mn1.add_child(SpawnMn1)
			SpawnMn2 = M2.instance()
			Mn1.add_child(SpawnMn2)
			ContMnPos += 12
	if S == ContSpawn:
		ContSpawn += 360
		n = 0
		m = 0
	_new()

var CntR = 0
var Obbs
var CObs = 8
var BoolO = true
var ObsC

func _new():
	if CkRnd == 2:
		Rng1 = 3
		Rng2 = 5
		CObs = 8
	elif CkRnd == 1:
		Rng1 = 3
		Rng2 = 5
		CObs = 8
	else:
		Rng1 = 1
		Rng2 = 5
		CObs = 4
	if BoolPw == 1:
		if  ContOnPw <= RCantPw:
			if BoolO == true:
				ContOnPw += 1
				Pw = Power[randi()%Power.size()]
				SpawnPw = Pw.instance()
				SpawnPw.set_name(str(S,"P"))
				get_node(str(S,"/O")).get_child(0).get_node(str(RPosHPw)).add_child(SpawnPw)
				while RPosHObs == RPosHPw:
					RPosHObs = int(rand_range(Rng1,Rng2))
				if ObsC == true:
					while RPosHObs <= 2 and RPosHObs >= 4:
						RPosHObs = int(rand_range(Rng1,Rng2))
		else:
			ContPw = 0
			ContOnPw = 0
			BoolPw = 2
			RCantPw = 4
			RPosHPw = int(rand_range(Rng1,Rng2))
	if BoolPw >= 2:
		ContPw += 1
		if ContPw == 7:
			BoolPw = 1
	if ContOnOb >= CObs:
		if BoolO == true:
			Obbs = Obs[randi()%Obs.size()]
			SpawnOb = Obbs.instance()
			SpawnOb.set_name(str(S,"O"))
			SpawnOb.set_rotation_degrees(Vector3(0,randi()%365,0))
			get_node(str(S,"/O")).get_child(0).get_node(str(RPosHObs)).add_child(SpawnOb)
			ContOnOb = 0

var ObMv = 0

func _Mov():
	ObMv += 1

func _Screen():
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	var img = get_viewport().get_texture().get_data()
	img.flip_y()
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	Base.Capture.set_texture(tex)
	Base.Capture.set_scale(Vector2(.4,.4))
	Base.Capture.get_parent().show()
