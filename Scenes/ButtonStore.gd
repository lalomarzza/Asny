extends Control

func _on_Button_button_down():
	Base.Btn = int(get_parent().get_name())
	Base.Price = int(get_parent().get_child(0).get_name())
	Base.Menu._button_pressed()


func _on_Button_button_up():
	Base.Menu._Cancel()
