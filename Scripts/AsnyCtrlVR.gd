extends ViewportContainer

var Follow_Speed = 5

var D = 0.05

var Vect = Vector3(0,0,0)

var Strt = false

var TF = false

func _ready():
	Base.CameraI.set_interpolation_enabled(false)
	Base.VRF = self
	OS.set_screen_orientation(0)
	OS.set_window_size(Vector2(1024,600))

var Cont = 0

func _process(delta):
	
	if Engine.is_editor_hint() == false:
		if Strt == true:
			Base.targetAsny.global_transform = Base.targetAsny.global_transform.interpolate_with(Base.PosPlayer,delta*Follow_Speed)
	#		Cont += 1
	#		Vect = Vector3(0,0,Input.get_accelerometer().z)
	#		Base.target.set_rotation(Vect)
			if Input.get_accelerometer().x <= -1:
				Base.PosAsny = Base.PosAsny + Base.VelG
				if Base.Bas == "F":
					if Base.PosAsny >= 0.1:
						Base.PosAsny = 0.1
					Vect = Vector3(0,0,Base.PosAsny)
					Base.targetAsny2.get_node("AnimationPlayer").play("Derecha")
				if Base.Bas == "R":
					Vect = Vector3(0,0,Base.PosAsny)
					Base.targetAsny2.get_node("AnimationPlayer").play("Derecha")
				if Base.Bas == "H":
					Vect = Vector3(0,Base.PosAsny,0)
			if Input.get_accelerometer().x >= 1:
				Base.PosAsny = Base.PosAsny - Base.VelG
				if Base.Bas == "F":
					if Base.PosAsny <= -0.1:
						Base.PosAsny = -0.1
					Vect = Vector3(0,0,Base.PosAsny)
					Base.targetAsny2.get_node("AnimationPlayer").play("Izquierda")
				if Base.Bas == "R":
					Base.targetAsny2.get_node("AnimationPlayer").play("Izquierda")
					Vect = Vector3(0,0,Base.PosAsny)
				if Base.Bas == "H":
					Vect = Vector3(0,Base.PosAsny,0)
			Base.target.set_rotation(Vect)
		else:
			if TF == false:
				if Input.get_accelerometer().x <= 0:
					TF = true
			else:
				if Input.get_accelerometer().z >= 2:
					Strt = true
					Base._readyPlayerVR()
	else:
		if Strt == true:
			Base.targetAsny.global_transform = Base.targetAsny.global_transform.interpolate_with(Base.PosPlayer,delta*Follow_Speed)
	#		Cont += 1
	#		Vect = Vector3(0,0,Input.get_accelerometer().z)
	#		Base.target.set_rotation(Vect)
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
		else:
			if Input.is_action_just_pressed("ui_accept"):
				TF = true
