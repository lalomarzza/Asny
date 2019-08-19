extends PathFollow

var speed = 6

func _ready():
	set_process(false)

func _process(delta):
	set_offset(get_offset()+speed*delta)
