extends Area

var Posi
var PosiZ

func _on_Area_body_entered(body):
	if Base.Bas == "F":
		if body.is_in_group("Asny"):
			Base.W.get_node("FX")._set_playing(true)
			Base.W.get_node("AsnyPlayer/ElAsny").set_mode(1)
			Base.press = false
			Base.ContF1 += 5
			Base.W._Screen()
			Base.W.get_node("AsnyPlayer/CPUParticles").set_emitting(true)
			Base._musicAsnyStop()
			get_node("/root/Ctrl/VBox/VpCtrl/Control/Score/Diamond").set_text(str(Base.data["Diamond"]))
			get_node("/root/Ctrl/VBox/VpCtrl/Control/Score/Diamond").show()
			Base.StoreP.set_global_transform(Base.CameraI.get_node("StoreAsny").get_global_transform())
			call_deferred("_quit")
			Base.StoreP.get_node("Bubble").set_emitting(true)
			if Base.Ctrl == "VR":
				Base.VRF.Strt = false
				get_tree().call_group("Node2D","show")
				Base.CameraI.set_process(false)
			if Base.Ctrl == "PL":
				Base.AsnyCtrl.show()
				Base.CtrlTrue.free()
			if Base.Bas == "R" or Base.Bas == "H":
				Base.BasNode._overG()
				Base.BasNode._over()
	if Base.Bas == "R" or Base.Bas == "H" or Base.Bas == "W":
		if body.is_in_group("Asny"):
			if Base.CW == 1:
				Base.CamPos.set_translation(Vector3(-3,20,0))
				Base.CamPos.set_rotation_degrees(Vector3(-50,-90,0))
				Base.BasNode = get_node("/root/Ctrl/VBox/VpCtrl/Vport/TerrainCork/BMW/BlueMoonW")
				Base.BasNode._overG()
				Base.BasNode._over()
				Base.Vect = Vector3(0,0,Base.Ult)
				Base._rot()
				Base.PosAsny = Base.Ult
#				if Base.Ult == 0:
				Base.PosPlayerAsny.set_translation(Vector3(0,50.75,0))
				Base.Alt = 50.75
				Base.CW = 0
				Base.VW.hide()
			Base.CW += 1

func _quit():
	get_parent().free()
	Base.AsnyPress.get_parent().remove_child(Base.AsnyPress)
	Base.StoreP.add_child(Base.AsnyPress)
