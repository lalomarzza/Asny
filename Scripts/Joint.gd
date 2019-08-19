extends Spatial

var Follow_Speed = 50

func _process(delta):
	$AsnyPlayer.global_transform = $AsnyPlayer.global_transform.interpolate_with($RigidBody.global_transform,delta*Follow_Speed)