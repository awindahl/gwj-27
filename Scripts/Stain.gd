extends Sprite

func _process(delta):
	if get_parent().get_parent().get_parent().name == "Desk":
		modulate.a -= 0.005
		$Timer.start()


func _on_Timer_timeout():
	queue_free()
