extends Spatial

func _on_Area_body_entered(body):
	if body.is_in_group("Asny"):
		$AnimationPlayer.play("default")
		$AudioStreamPlayer3D._set_playing(true)
