extends InterpolatedCamera

func _ready():
	set_process(false)


func _process(delta):
	set_global_transform(Base.targetAsnyVR.get_global_transform())

func VR():
	set_process(true)
