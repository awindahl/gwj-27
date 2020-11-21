extends Node2D


func _on_Back_pressed():
	get_tree().change_scene("res://Title.tscn")


func _on_LinkButton_pressed():
	OS.shell_open("https://godotengine.org/license")
