extends Spatial

var AsnyReady = preload("res://Scenes/AsnyPlayer.scn")
var AsnyPress

var Posi

func _ready():
	Posi = Base.StoreP.get_global_transform().origin
#	Base.AsnyPress.global_position = Posi
	print(Posi)
#	Base.AsnyPress.set_translation(Posi)

#var AsnyReady = load("res://Scenes/AsnyPlayer.scn")
#var AsnyReady2 = preload("res://Scenes/AsnyPlayer2.scn")
#var AsnyPress
#
#func _ready():
#	Base.AsnyBas = self
#	call_deferred("Loader")
#
#func Loader():
#	Base.LoadAsnyPl()
