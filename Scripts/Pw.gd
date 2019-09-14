extends Spatial

func _on_RubyC_body_entered(body):
	if body.is_in_group("Asny"):
		Base._CoinD()
		$Ruby.hide()
		$RubyC/CPUParticles.set_emitting(true)
#		print(Base.ContC,"D")

func _on_Area_body_entered(body):
	if body.is_in_group("Asny"):
		Base._CoinC()
		$Coin.hide()
		$AudioStreamPlayer._set_playing(true)
#		print(Base.ContC)
