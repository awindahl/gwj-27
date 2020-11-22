extends Node2D

var is_out = false

func _on_Button_pressed():
	$Sound.play()
	
	if not is_out:
		$AnimationPlayer.play("Slide")
		is_out = true
	elif is_out:
		$AnimationPlayer.play_backwards("Slide")
		is_out = false
		
