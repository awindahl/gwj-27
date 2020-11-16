extends Node2D

var send_away = false

func _process(delta):
	for area in $Area2D.get_overlapping_areas():
		if Input.is_action_just_released("click"):
			if area.get_parent().attributes != []:
				area.get_parent().going_out = true
				get_parent()._rule_parse(area.get_parent())
