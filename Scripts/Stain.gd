extends Sprite

var decay = false

func _process(delta):
	
	if get_parent().get_parent().get_parent().get_parent().get_node("YSort/CoffeeCup") != null:
		if get_parent().get_parent().get_parent().get_parent().get_node("YSort/CoffeeCup").moving:
			decay = true
	
	if get_parent().get_parent().get_parent().name == "Desk":
		if decay:
			modulate.a -= 0.005
			$Timer.start()


func _on_Timer_timeout():
	queue_free()
