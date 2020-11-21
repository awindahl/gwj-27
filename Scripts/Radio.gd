extends Node2D


func _on_RightButton_pressed():
	if get_parent().get_node("Papers, Please").selected == null:
		print("ABOGA")


func _on_LeftButton_pressed():
	if get_parent().get_node("Papers, Please").selected == null:
		print("ABOGA")
