extends Control

func _Screen():
	get_viewport().set_clear_mode(Viewport.CLEAR_MODE_ONLY_NEXT_FRAME)
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	var img = get_viewport().get_texture().get_data()
	img.flip_y()
	var tex = ImageTexture.new()
	tex.create_from_image(img)
	Base.Capture.set_texture(tex)
	Base.Capture.set_scale(Vector2(.5,.5))
	Base.Capture.show()
