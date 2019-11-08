extends Spatial

var Star = preload("res://Scenes/Cnstr/SpawnO.scn")
var posi
var ent = 1
var Fra = 0

onready var SO = get_node("SO")

func _process(delta):
	Fra += .1
	posi = SO.get_global_transform()
	SO.set_rotation_degrees(Vector3(ent,0,0))
	if Fra >= ent:
		ent += 1
		_spawn()
		print(ent)
		if Fra >= 360:
			var packed_scene = PackedScene.new()
			packed_scene.pack(get_node("/root/Obs/SpwObs"))
			ResourceSaver.save("res://Scenes/Cnstr/SpeObs.scn", packed_scene)
			print("Hola")
			_process(false)
	

func _spawn():
	var SpawnStar = Star.instance()
	SpawnStar.set_global_transform(posi)
	SpawnStar.set_name(str(ent))
	var base = get_node("/root/Obs/SpwObs")
	base.add_child(SpawnStar)
	SpawnStar.set_owner(base)
