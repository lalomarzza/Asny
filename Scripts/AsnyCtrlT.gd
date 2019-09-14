extends Control

var Follow_Speed = 5
var RotY

func _process(delta):
	Base.targetAsny.global_transform = Base.targetAsny.global_transform.interpolate_with(Base.PosPlayer,delta*Follow_Speed)

func _on_SwipeDetector_swipe_ended(gesture):
	if gesture.get_direction()=="left"||gesture.get_direction()=="up_left"||gesture.get_direction()=="down_left":
		$AudioStreamPlayer2D.play()
		Base.Ult = Base.PosAsny
		Base.PosAsny = Base.PosAsny + Base.VelG
		if Base.Bas == "F":
			if Base.PosAsny >= 0.1:
				Base.PosAsny = 0.1
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Derecha")
			Base._rot()
		if Base.Bas == "R":
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Derecha")
			Base._rot()
		if Base.Bas == "H":
			Base.Vect = Vector3(0,Base.PosAsny,0)
			Base._rot()
		if Base.Bas == "W":
			Base.Rtto.rotate(Vector3(0,1,0),deg2rad(11.25))
	if gesture.get_direction()=="right"||gesture.get_direction()=="up_right"||gesture.get_direction()=="down_right":
		$AudioStreamPlayer2D2.play()
		Base.Ult = Base.PosAsny
		Base.PosAsny = Base.PosAsny - Base.VelG
		if Base.Bas == "F":
			if Base.PosAsny <= -0.1:
				Base.PosAsny = -0.1
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Izquierda")
			Base._rot()
		if Base.Bas == "R":
			Base.targetAsny2.get_node("AnimationPlayer").play("Izquierda")
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base._rot()
		if Base.Bas == "H":
			Base.Vect = Vector3(0,Base.PosAsny,0)
			Base._rot()
		if Base.Bas == "W":
			Base.Rtto.rotate(Vector3(0,-1,0),deg2rad(11.25))

func _input(event):
	if Input.is_action_just_pressed("ui_left"):
		Base.Ult = Base.PosAsny
		Base.PosAsny = Base.PosAsny + Base.VelG
		if Base.Bas == "F":
			if Base.PosAsny >= 0.1:
				Base.PosAsny = 0.1
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Derecha")
			Base._rot()
		if Base.Bas == "R":
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Derecha")
			Base._rot()
		if Base.Bas == "H":
			Base.Vect = Vector3(0,Base.PosAsny,0)
			Base._rot()
		if Base.Bas == "W":
			Base.Rott.rotate(Vector3(0,1,0),deg2rad(11.25))
	if Input.is_action_just_pressed("ui_right"):
		Base.Ult = Base.PosAsny
		Base.PosAsny = Base.PosAsny - Base.VelG
		if Base.Bas == "F":
			if Base.PosAsny <= -0.1:
				Base.PosAsny = -0.1
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Izquierda")
			Base._rot()
		if Base.Bas == "R":
			Base.targetAsny2.get_node("AnimationPlayer").play("Izquierda")
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base._rot()
		if Base.Bas == "H":
			Base.Vect = Vector3(0,Base.PosAsny,0)
			Base._rot()
		if Base.Bas == "W":
			Base.Rott.rotate(Vector3(0,-1,0),deg2rad(11.25))
