extends PathFollow

var speed = 5
var accumC = 0

var posi = null

var Star = preload("res://Scenes/Cnstr/ObH.scn")

func _process(delta):
	posi = self.get_global_transform()
	accumC += 1
	set_offset(get_offset()+speed*delta)
	if accumC >= 10:
		_spawn()
		accumC = 0
	if get_unit_offset() >= 1:
		var packed_scene = PackedScene.new()
		packed_scene.pack(get_node("/root/Hosenator/Obs"))
		ResourceSaver.save("res://Scenes/Cnstr/CurvaH1.scn", packed_scene)
		print("Hola")
		_process(false)

func _spawn():
	var SpawnStar = Star.instance()
	SpawnStar.set_global_transform(posi)
	var base = get_node("/root/Hosenator/Obs")
	base.add_child(SpawnStar)
	SpawnStar.set_owner(base)
	pass
