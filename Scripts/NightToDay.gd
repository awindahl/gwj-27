extends Node2D


func _ready():
	$Label.text += var2str(Singleton.day)
