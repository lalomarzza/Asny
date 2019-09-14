extends Control

func _ready():
	Base.VR = self

func _process(delta):
	$Node2D.set_position(Vector2(0,Input.get_accelerometer().z*50))
#	if Input.get_accelerometer().x <= 10:
	$Node2D/Sprite/Sprite2.set_modulate(Color(255,0,35,Input.get_accelerometer().z*.85))
	
