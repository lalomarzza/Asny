extends Node

var PosPlayer
var PosPlayerAsny
var AsnyReady = preload("res://Scenes/AsnyPlayer1.scn")
onready var target = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/F/AsnyControl")
var targetAsny
var targetAsnyVR
var targetAsny2
var Asny
onready var AsnyCtrl = get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control")
var Hide
#var Res = 1
var Acc = false
var Fn = true
var Posit = Vector3(0,0,0)
var PsPlyRt
var Ult = 0
var Vect = Vector3(0,0,0)
var press = false
var PosPlF = "/root/Ctrl/VBox/VpCtrl/Vport/World/F"
var ControlAsny = preload("res://Scenes/ControlAsny.scn")
var ControlAsnyVR = preload("res://Scenes/VRCam2.scn")
var VelG = 0
var Bas = "F"
var VelZ = 9
var Ctrl = "PL"
var NB = 0
var PosAsny = 0
var Pos = 4
var Cnt = 1
var Alt = 50
var AsnyPress
var BasNode
var f
var ContF = -135
var ContF1 = 0
var CFloor = 1
var Vel
var Diamond = 100
const PuntMax = "user://data.dat"
const password = "1234"
var is_loaded = false
var ContC = 0
var data = {"Score" : 0, "Diamond" : 0}
var Posi
var RotY = 0
var Rott
var VelR = 5
onready var StoreP = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/StoreAsny/")
var Rtto
var NewScore = false
var RX = 0
var DN = -90
onready var W = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/")

onready var CameraI = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Camera")

const StoreItems = "user://Store.dat"
const passwordSt = "4321"
var is_loadedSt = false
var Store = {"Res" : 0, "HatB" : 0, "Hat" : true, "TH" : false, "TR" : true}

func Reload():
	Store["Res"] = 0
	Store["HatB"] = 0
	Store["Hat"] = true
	save_store()

func ReloadS():
	Store["TH"] = false
	save_store()

func _ready():
#	CameraI.set_interpolation_enabled(true)
#	Base.CameraI.set_target_path(str(Base.W,"/Spatial/"))
	_ChangeF()
	_Store()
	AsnyPress = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/StoreAsny/Asny!ExportD/")
#	OS.set_icon(load("res://examples/test_reference.png"))
	if get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control1/Button").connect("pressed",self,"_readyPlayer"):
		_readyPlayer()
	if get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control1/Button4").connect("pressed",self,"_VR"):
		_VR()
	Sv()
	SvSt()
	print(Store)
#	Res = int(Base.data["Rest"])
#	ReloadS()

func Sv():
	var file = File.new()
	if file.file_exists(PuntMax):
		load_data()
	else:
		save_data()
		load_data()

func SvSt():
	var file = File.new()
	if file.file_exists(StoreItems):
		load_store()
	else:
		save_store()
		load_store()

func _ChangeF():
	PsPlyRt = str("/root/Ctrl/VBox/VpCtrl/Vport/World/F/AsnyControl/Control")

var VRS = false

func _process(delta):
#	if VRS == true:
#		if Input.get_accelerometer().x >= 1:
#			_readyPlayerVR()
#			VRF._start()
#			VRS = false
	if Input.is_action_just_pressed("ui_accept"):
		if Ctrl == "VR":
			_readyPlayerVR()
			VRF.Strt = true
		else:
			_readyPlayer()
	if press == false:
		pass
	if press == true:
		PosPlayer = get_node(PsPlyRt).global_transform
		PosPlayerAsny = get_node(PsPlyRt)
		f = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/F/")
		ContF1 -= VelZ*delta
		if f.get_rotation_degrees().x <= ContF:
			ContF -= 1
			if ContF == DN:
				DN -= 90
				if DN <= -360:
					DN = 0
					RX = 0
				print(DN)
			f.get_parent()._Spawn()
		f.set_rotation_degrees(Vector3(ContF1,0,0))

func save_data():
	var file = File.new()
	file.open_encrypted_with_pass(PuntMax,File.WRITE,password)
	file.store_var(data)
	file.close()
	is_loaded = false

func load_data():
	if is_loaded:
		return
	var file = File.new()
	file.open_encrypted_with_pass(PuntMax,File.READ,password)
	data = file.get_var()
	file.close()
	is_loaded = true
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/Coins").set_text(str(data["Score"]))
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/Diamond").set_text(str(data["Diamond"]))

func save_store():
	var file = File.new()
	file.open_encrypted_with_pass(StoreItems,File.WRITE,passwordSt)
	file.store_var(Store)
	file.close()
	is_loadedSt = false

func load_store():
	if is_loadedSt:
		return
	var file = File.new()
	file.open_encrypted_with_pass(StoreItems,File.READ,passwordSt)
	Store = file.get_var()
	file.close()
	is_loadedSt = true

var Cong = 0

func _CoinC():
	ContC += 1
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/Coins").set_text(str(ContC))
	if ContC >= Diamond:
		_CoinD()
		Diamond += 100
	if ContC >= int(data["Score"]):
		data["Score"] = ContC
		save_data()
		Cong += 1
		if Cong == 2:
			get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/CPUParticles2D").set_emitting(true)

func _CoinD():
	ContC += 1
	data["Diamond"] += 1
	save_data()
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/Diamond").set_text(str(data["Diamond"]))
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/TimerDiamond").start()

func _rot():
	Base.target.set_rotation(Vect)

func _readyPlayer():
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/TimerDiamond").start()
	Cong = 0
	if Bas == "F":
		VelG = .05
		VelZ = 9
	if Bas == "R":
		VelG = 1.25
		VelZ = 4.2
	if Bas == "H":
		VelG = -1.25
		VelZ = 4
	_musicAsnyPlay()
	ContC = 0
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/Coins").set_text(str(ContC))
	StoreP.remove_child(AsnyPress)
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer").add_child(AsnyPress)
	Asny = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/Asny!ExportD")
	_Ctrl()
	press = true
	targetAsny = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/")
	targetAsny2 = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/Asny!ExportD")
	AsnyCtrl.hide()
	CameraI.set_interpolation_enabled(true)
	if Bas == "R":
		BasNode._reload()
	if Bas == "H":
		BasNode._reload()

var VRF

func _VR():
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/").hide()
	_CtrlVR()
#	W.get_node("AsnyPlayer/Spatial").set_rotation_degrees(Vector3(0,-90,90))
	

func _readyPlayerVR():
	Cong = 0
	if Bas == "F":
		VelG = .005
	if Bas == "R":
		VelG = .125
	if Bas == "H":
		VelG = -.125
	_musicAsnyPlay()
	ContC = 0
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/Coins").set_text(str(ContC))
	StoreP.remove_child(AsnyPress)
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/").add_child(AsnyPress)
	Asny = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/Asny!ExportD")
	press = true
	targetAsny = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/")
	targetAsnyVR = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/VR")
	targetAsny2 = get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyPlayer/Asny!ExportD")
#	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Camera/StoreAsny/CPUParticles").hide()
	CameraI.VR()
	if Bas == "R":
		BasNode._reload()
	if Bas == "H":
		BasNode._reload()

func _Ctrl():
	var CtrlTrue = ControlAsny.instance()
	get_node("/root/Ctrl/VBox/VpCtrl").add_child(CtrlTrue)

func _CtrlVR():
	var CtrlTrue = ControlAsnyVR.instance()
	get_node("/root/Ctrl/VBox/").add_child(CtrlTrue)
	Ctrl = "VR"

func _musicAsnyON():
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyMusic/").set_stream_paused(false)
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Relax/").set_stream_paused(false)
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyMusic/").stop()

func _musicAsnyOFF():
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyMusic/").set_stream_paused(true)
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Relax/").set_stream_paused(true)

func _musicAsnyPlay():
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Relax/").stop()
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyMusic/").play()

func _musicAsnyStop():
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/AsnyMusic/").stop()
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Relax/").play()

var CtrlH

func _Store():
	CtrlH = get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control2/Hat")
	if Store["HatB"] == 0:
		CtrlH.get_child(0).show()
		CtrlH.get_child(1).hide()
	if Store["HatB"] == 1:
		CtrlH.get_child(0).hide()
		CtrlH.get_child(1).show()
