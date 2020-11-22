extends Node2D

var radio1 = preload("res://Assets/radio1.wav")
var radio2 = preload("res://Assets/radio2.wav")
var radio3 = preload("res://Assets/radio3.wav")
var radio4 = preload("res://Assets/radio4.wav")

func _on_RightButton_pressed():
	randomize()
	if get_parent().get_node("Papers, Please").selected == null:
		
		var rand = randi()%4 + 1
		match rand:
			1:
				$Radio.stream = radio1
			2:
				$Radio.stream = radio2
			3:
				$Radio.stream = radio3
			4:
				$Radio.stream = radio4
				
		$Radio.play()


func _on_LeftButton_pressed():
	if get_parent().get_node("Papers, Please").selected == null:
		$Radio.stream = null
