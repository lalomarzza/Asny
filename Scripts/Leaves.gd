extends Spatial

func _on_RigidBody_body_entered(body):
	if body.is_in_group("Detect"):
		Base.CameraI.set_target(Base.W.get_node("AsnyPlayer/SpLv"))

func _on_RigidBody_body_exited(body):
	if body.is_in_group("Detect"):
		Base.CameraI.set_target(Base.W.get_node("AsnyPlayer/Spatial"))
