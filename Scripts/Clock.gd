extends Node2D


func _process(delta):
	print(get_parent().rules)
	$ShortHand.rotation += 0.0055/20
	$LongHand.rotation += 0.06/20
