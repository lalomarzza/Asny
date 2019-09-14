extends Area

var Posi

func _on_Area_body_entered(body):
	if body.is_in_group("Asny"):
		Base.W.get_node("FX")._set_playing(true)
		Base.W.get_node("AsnyPlayer/ElAsny").set_mode(1)
		Base.press = false
		Base._musicAsnyStop()
		get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Score/Diamond").set_text(str(Base.data["Diamond"]))
		get_node("/root/Ctrl/VBox/VpCtrl/Vport/Control/Score/Diamond").show()
		call_deferred("_quit")
		Base.targetAsny.get_node("CPUParticles").set_emitting(true)
		if Base.Ctrl == "VR":
			Base.VRF.Strt = false
			get_tree().call_group("Node2D","show")
			Base.CameraI.set_process(false)
		if Base.Ctrl == "PL":
			Base.AsnyCtrl.show()
		if Base.Bas == "R" or Base.Bas == "H":
			Base.BasNode._over()

func _quit():
	if Base.Ctrl == "PL":
		get_node("/root/Ctrl/VBox/VpCtrl/Control").free()
	get_parent().free()
	Base.AsnyPress.get_parent().remove_child(Base.AsnyPress)
	Base.StoreP.add_child(Base.AsnyPress)
	
