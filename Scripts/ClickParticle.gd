extends CPUParticles2D

func _on_Kill_timeout():
	queue_free()
