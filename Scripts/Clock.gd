extends Node2D


func _process(delta):
	$ShortHand.rotation += 0.0055/10
	$LongHand.rotation += 0.06/10
