extends Sprite

func _process(delta):
	modulate.a -= 0.01


func _on_Timer_timeout():
	queue_free()
