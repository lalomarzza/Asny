extends TextureRect

var AsnyReady = preload("res://Scenes/AsnyPlayer.scn")
var AsnySt = [preload("res://Scenes/ObjectSingle/Store/Hat.scn")]
var Music = true
var Sound = true
var Hat = true


var MR = [preload("res://Materials/ClothL.material"),
preload("res://Materials/MetallicL.material"),
preload("res://Materials/PapperL.material"),
preload("res://Materials/PlasticL.material"),
preload("res://Materials/CorkL.material"),
preload("res://Materials/WatherL.material"),
preload("res://Materials/TransparentL.material"),
preload("res://Materials/ClothL.material"),
preload("res://Materials/PapperL.material"),
preload("res://Materials/PlasticL.material"),
preload("res://Materials/CorkL.material"),
preload("res://Materials/TransparentL.material")
]

var AsnyPress
var AsnyPressHat

var MRD = [preload("res://Materials/Cloth.material"),
preload("res://Materials/Metallic.material"),
preload("res://Materials/Papper.material"),
preload("res://Materials/Plastic.material"),
preload("res://Materials/Cork.material"),
preload("res://Materials/Wather.material"),
preload("res://Materials/Transparent.material"),
preload("res://Materials/Cloth.material"),
preload("res://Materials/Papper.material"),
preload("res://Materials/Plastic.material"),
preload("res://Materials/Cork.material"),
preload("res://Materials/Transparent.material")
]

onready var tween = $Control2/Tween

var Trans = false

func _on_Music_pressed():
	var Menu = get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control1/Music")
	if Music == true:
		Menu.set_normal_texture(preload("res://Images/BublePressed.png"))
		Menu.get_child(0).hide()
		Menu.get_child(1).show()
		Music = false
		Base._musicAsnyOFF()
	else:
		Menu.set_normal_texture(preload("res://Images/Buble.png"))
		Menu.get_child(0).show()
		Menu.get_child(1).hide()
		Music = true
		Base._musicAsnyON()

func _on_Sound_pressed():
	var Menu = get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control1/Sound")
	if Sound == true:
		Menu.set_normal_texture(preload("res://Images/BublePressed.png"))
		Menu.get_child(0).hide()
		Menu.get_child(1).show()
		Sound = false
	else:
		Menu.set_normal_texture(preload("res://Images/Buble.png"))
		Menu.get_child(0).show()
		Menu.get_child(1).hide()
		Sound = true

func _on_Store_pressed():
	var Menu = get_node("/root/Ctrl/VBox/VpCtrl/Control/Menu/Control2/Hat")
	Base.CameraI.set_target(Base.W.get_node("StoreAsny/Spatial"))
	print(str(Base.W.get_child(1).get_path()))
	get_node("Control1").hide()
	get_node("Control2").show()
	Base.W.get_node("TextureRect").hide()
	if Base.Store["Hat"] == false:
		Menu.set_normal_texture(preload("res://Images/BublePressed.png"))
		Menu.get_child(0).hide()
		Menu.get_child(1).show()
	else:
		Menu.set_normal_texture(preload("res://Images/Buble.png"))
		Menu.get_child(0).show()
		Menu.get_child(1).hide()

func _on_StoreR_pressed():
	get_node("Control2").hide()
	get_node("Control1").show()
	Base.W.get_node("TextureRect").show()
	var packed_scene = PackedScene.new()
	packed_scene.pack(Base.AsnyPress)
	ResourceSaver.save("res://Scenes/AsnyPlayer.scn", packed_scene)
	Base.save_store()
	Base.CameraI.set_target(Base.W.get_node("AsnyPlayer/Spatial"))

func _on_TimerDiamond_timeout():
	get_node("/root/Ctrl/VBox/VpCtrl/Control/Score/Diamond").hide()

func _Hat():
	var Menu = get_node("/root/Ctrl/VBox/VpCtrl/Control/Menu/Control2/Hat")
	if Base.Store["Hat"] == true:
		
		OS.set_icon(load("res://icon.png"))
		Menu.set_normal_texture(preload("res://Images/BublePressed.png"))
		Menu.get_child(0).hide()
		Menu.get_child(1).show()
		Base.Store["Hat"] = false
		AsnyPressHat = AsnySt[0].instance()
		print(get_node(str(Base.StoreP.get_child(0).get_path())))
		get_node(str(Base.StoreP.get_path())+"/Asny!ExportD/Esqueleto/Skeleton").add_child(AsnyPressHat)
		AsnyPressHat.set_owner(Base.AsnyPress)
		Base.Store["HatB"] = 1
#		Base.AsnyPress.set_translation(Vector3(0,55,0))
	else:
		Menu.set_normal_texture(preload("res://Images/Buble.png"))
		Menu.get_child(0).show()
		Menu.get_child(1).hide()
		Base.Store["Hat"] = true
		get_node(str(Base.StoreP.get_child(1).get_path())+"/Esqueleto/Skeleton/Hat").free()
		Base.Store["HatB"] = 0

func _on_Hat_button_up():
	_Cancel()

func _Cancel():
	tween.stop_all()
	Price = 0
	$Control2/TextureProgress/Diamond2.set_text(str(Price))
	$Control2/TextureProgress.hide()

var Price
var ObjStr

func _on_Hat_button_down():
#	Base.Store["TH"] = false
	if Base.Store["TH"] == false:
		ObjStr = "TH"
		Price = 25
		$Control2/TextureProgress/Diamond2.set_text(str(Price))
		$Control2/TextureProgress.show()
		if Base.data["Diamond"] >= Price:
			tween.interpolate_property($Control2/TextureProgress, "value", -200, 100, 3, Tween.TRANS_LINEAR, Tween.EASE_IN)
			tween.start()
	else:
		_Hat()

func _on_Tween_tween_completed(object, key):
	Base.Store[ObjStr] = true
	Base.data["Diamond"] -= Price
	get_node("/root/Ctrl/VBox/VpCtrl/Control/Score/Diamond").set_text(str(Base.data["Diamond"]))
	Base.save_store()
	Base.save_data()

var Bullet = preload("res://Scenes/ObjectSingle/N/RocketB.scn")
var BulletR = preload("res://Scenes/ObjectSingle/N/RocketR.scn")
var RB

func _on_R_button_down():
	if Base.Store["TR"] == false:
		ObjStr = "TR"
		Price = 50
		$Control2/TextureProgress/Diamond2.set_text(str(Price))
		$Control2/TextureProgress.show()
		if Base.data["Diamond"] >= Price:
			tween.interpolate_property($Control2/TextureProgress, "value", -200, 100, 3, Tween.TRANS_LINEAR, Tween.EASE_IN)
			tween.start()
	else:
		if Base.Store["Rocket"] == "Red":
			get_node(str(Base.StoreP.get_path(),"/Asny!ExportD/Esfera")).free()
			RB = Bullet.instance()
			get_node(str(Base.StoreP.get_path(),"/Asny!ExportD/")).add_child(RB)
			Base.Store["Rocket"] = "Blue"
			RB.set_owner(Base.AsnyPress)
		else:
			get_node(str(Base.StoreP.get_path(),"/Asny!ExportD/RocketB")).free()
			RB = BulletR.instance()
			get_node(str(Base.StoreP.get_path(),"/Asny!ExportD/")).add_child(RB)
			Base.Store["Rocket"] = "Red"
			RB.set_owner(Base.AsnyPress)

func _on_R_button_up():
	_Cancel()

var C = 0

func _on_Button7_button_up():
	C = 0
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/").set_size(Vector2(140,248))
	for m in MR.size():
		for i in get_tree().get_nodes_in_group(str(m)):
			if m >= 7 && C == 0:
				C += 1
			i.set_surface_material(C,MR[m])
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/MultiMeshInstance").set_material_override(MR[3])
	$Control1/Button7.hide()
	$Control1/Button7R.show()

func _Change():
	print("Hola")

func _on_Button7R_button_down():
	C = 0
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/").set_size(Vector2(1080,1920))
	for m in MRD.size():
		for i in get_tree().get_nodes_in_group(str(m)):
			if m >= 7 && C == 0:
				C += 1
			i.set_surface_material(C,MRD[m])
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/MultiMeshInstance").set_material_override(MRD[3])
	$Control1/Button7.show()
	$Control1/Button7R.hide()
