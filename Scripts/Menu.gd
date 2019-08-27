extends TextureRect

var AsnyReady = preload("res://Scenes/AsnyPlayer.scn")
var AsnyHat = preload("res://Scenes/ObjectSingle/Store/Hat.scn")

var Music = true
var Sound = true
var Hat = true
var AsnyPress
var AsnyPressHat

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
	var Menu = get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control2/Hat")
	Base.CameraI.set_target(Base.W.get_node("StoreAsny/Spatial"))
	Base.StoreP.set_global_transform(Base.CameraI.get_node("StoreAsny").get_global_transform())
	print(str(Base.W.get_child(1).get_path()))
	get_node("Control1").hide()
	get_node("Control2").show()
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
	var packed_scene = PackedScene.new()
	packed_scene.pack(Base.AsnyPress)
	ResourceSaver.save("res://Scenes/AsnyPlayer.scn", packed_scene)
	Base.save_store()
	Base.CameraI.set_target(Base.W.get_node("AsnyPlayer/Spatial"))

func _Shop():
	
	pass

#func _on_Hat_pressed():
#	Base._Hat()
#
#func _on_Store_pressed():
#	Base.LoadAsnySt()
#	get_node("Control1").hide()
#	get_node("Control2").show()
#
#func _on_StoreR_pressed():
#	get_node("Control2").hide()
#	get_node("Control1").show()
#	Base._ResSv()
#

func _on_TimerDiamond_timeout():
	get_node("/root/Ctrl/VBox/VpCtrl/Vport/Score/Diamond").hide()
	pass # Replace with function body.

func _Hat():
	var Menu = get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control2/Hat")
	if Base.Store["Hat"] == true:
		
		OS.set_icon(load("res://icon.png"))
		Menu.set_normal_texture(preload("res://Images/BublePressed.png"))
		Menu.get_child(0).hide()
		Menu.get_child(1).show()
		Base.Store["Hat"] = false
		AsnyPressHat = AsnyHat.instance()
		get_node(str(Base.StoreP.get_child(0).get_path())+"/Esqueleto2").add_child(AsnyPressHat)
		AsnyPressHat.set_owner(Base.AsnyPress)
		Base.Store["HatB"] = 1
#		Base.AsnyPress.set_translation(Vector3(0,55,0))
	else:
		Menu.set_normal_texture(preload("res://Images/Buble.png"))
		Menu.get_child(0).show()
		Menu.get_child(1).hide()
		Base.Store["Hat"] = true
		get_node(str(Base.StoreP.get_child(0).get_path())+"/Esqueleto2/Cylinder").free()
		Base.Store["HatB"] = 0

func _on_Timer_timeout():
	Base.Store["TH"] = true
	Base.data["Diamond"] -= Price
	Base.save_store()
	Base.save_data()

func _on_Hat_button_up():
	$Timer.stop()

var Price

func _on_Hat_button_down():
	if Base.Store["TH"] == false:
		Price = 50
		if Base.data["Diamond"] >= Price:
			$Timer.start()
	else:
		_Hat()
