extends ViewportContainer

var Follow_Speed = 5

var D = 0.05

var Vect = Vector3(0,0,0)

var Strt = false

func _ready():
	Base.VRF = self
	print(OS.get_screen_orientation(),"S")
	OS.set_screen_orientation(0)
	print(OS.get_screen_orientation(),"S")
#	OS.set_window_size(Vector2(1024,600))

func _process(delta):
	if Strt == true:
		Base.targetAsny.global_transform = Base.targetAsny.global_transform.interpolate_with(Base.PosPlayer,delta*Follow_Speed)
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
		if Input.get_accelerometer().x >= 2:
			Strt = true
			Base._readyPlayerVR()
