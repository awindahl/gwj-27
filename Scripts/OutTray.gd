extends Node2D

var send_away = false

func _process(delta):
	for area in $Area2D.get_overlapping_areas():
		if Input.is_action_just_released("click"):
			if area.get_parent().attributes != []:
				if area.get_parent().approved != "":
					area.get_parent().going_out = true
					get_parent()._rule_parse(area.get_parent())
					get_parent().get_node("InTray").tutorial_request = true
