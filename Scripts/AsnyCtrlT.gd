extends Control

var Follow_Speed = 5
var RotY

func _process(delta):
	Base.targetAsny.global_transform = Base.targetAsny.global_transform.interpolate_with(Base.PosPlayer,delta*Follow_Speed)

func _on_SwipeDetector_swipe_ended(gesture):
	if gesture.get_direction()=="left"||gesture.get_direction()=="up_left"||gesture.get_direction()=="down_left":
		Base.Ult = Base.PosAsny
		Base.PosAsny = Base.PosAsny + Base.VelG
		if Base.Bas == "F":
			if Base.PosAsny >= 0.1:
				Base.PosAsny = 0.1
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Derecha")
		if Base.Bas == "R":
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Derecha")
		if Base.Bas == "H":
			Base.Vect = Vector3(0,Base.PosAsny,0)
		if Base.Bas == "W":
			Base.RotY = Base.Rott.get_rotation_degrees().y - 22.5
			print(RotY)
			Base.Rott.set_rotation_degrees(Base.Rtto.get_rotation_degrees()+Vector3(0,Base.RotY,0))
			Base.Rtto.set_rotation_degrees(Vector3(0,0,0))
#			Base.Rott.set_rotation_degrees(Vector3(Base.Rott.get_rotation_degrees().x,RotY,Base.Rott.get_rotation_degrees().z))
#			Base.Vect = Vector3(0,0,Base.RotY)
#			Base.target.get_parent().set_rotation_degrees(Base.Vect)
#			Base.Vect = Vector3(0,0,Base.PosAsny)
#			Base.target.set_rotation(Base.Vect)
	if gesture.get_direction()=="right"||gesture.get_direction()=="up_right"||gesture.get_direction()=="down_right":
		Base.Ult = Base.PosAsny
		Base.PosAsny = Base.PosAsny - Base.VelG
		if Base.Bas == "F":
			if Base.PosAsny <= -0.1:
				Base.PosAsny = -0.1
			Base.Vect = Vector3(0,0,Base.PosAsny)
			Base.targetAsny2.get_node("AnimationPlayer").play("Izquierda")
		if Base.Bas == "R":
			Base.targetAsny2.get_node("AnimationPlayer").play("Izquierda")
			Base.Vect = Vector3(0,0,Base.PosAsny)
		if Base.Bas == "H":
			Base.Vect = Vector3(0,Base.PosAsny,0)
		if Base.Bas == "W":
			Base.RotY = Base.Rott.get_rotation_degrees().y + 22.5
			Base.Rott.set_rotation_degrees(Base.Rtto.get_rotation_degrees()+Vector3(0,Base.RotY,0))
			Base.Rtto.set_rotation_degrees(Vector3(0,0,0))
#			print(Base.Rott.get_rotation().x)
#			Base.Rott.set_rotation_degrees(Vector3(Base.Rott.get_rotation_degrees().x,RotY,Base.Rott.get_rotation_degrees().z))
#			Base.Vect = Vector3(0,0,Base.RotY)
#			Base.target.get_parent().set_rotation_degrees(Base.Vect)
#			Base.Vect = Vector3(0,0,Base.PosAsny)
#			Base.target.set_rotation(Base.Vect)
	Base._rot()
