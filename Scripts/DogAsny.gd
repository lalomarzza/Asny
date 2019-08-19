extends Spatial

onready var tween = $Tween

var speed = 6

func _ready():
	set_process(false)
	$Spatial/DogAsny/AnimationPlayer.play("DogSleep")
#
#func _process(delta):
#	$Dog.look_at(Base.targetAsny.transform.origin,Vector3(0,0,0))
#	get_parent().set_offset(get_offset()+speed*delta)

func _start():
	print("Hola")
	set_process(true)
	$Spatial/DogAsny/AnimationPlayer.play("Ladrando")
	tween.interpolate_property(get_parent(),"rotation",get_parent().get_rotation(),Vector3((-Base.PosAsny),0,0),.7,Tween.TRANS_CUBIC,Tween.EASE_OUT)
	tween.start()
	$Timer.start()

func _end():
	set_process(false)
	$Timer.stop()

func _on_Timer_timeout():
		tween.interpolate_property(get_parent(),"rotation",get_parent().get_rotation(),Vector3((-Base.PosAsny),0,0),.7,Tween.TRANS_CUBIC,Tween.EASE_OUT)
		tween.start()
