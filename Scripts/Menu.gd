extends TextureRect

var AsnyReady = preload("res://Scenes/AsnyPlayer.scn")
var AsnyHat = preload("res://Scenes/ObjectSingle/Store/Hat.scn")

var Music = true
var Sound = true
var Hat = true
var AsnyPress
var AsnyPressHat

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
		

func _on_Hat_pressed():
	var Menu = get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control2/Hat")
	if Base.Store["Hat"] == true:
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

func _on_Store_pressed():
	var Menu = get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Menu/Control2/Hat")
#	if Base.Store["Res"] == 0:
#		AsnyPress = AsnyReady.instance()
#	else:
#		AsnyPress = AsnyReady2.instance()
#	get_node("/root/Ctrl/VBox/VpCtrl/Vport/World/Camera/StoreAsny/").add_child(AsnyPress)
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


#func _on_Hat_pressed():
#	Base._Hat()
#
#func _on_Store_pressed():
#	Base.LoadAsnySt()
#	get_node("Control1").hide()
#	get_node("Control2").show()
#
#
#func _on_StoreR_pressed():
#	get_node("Control2").hide()
#	get_node("Control1").show()
#	Base._ResSv()
#
