extends Node2D

var is_holding = false
var rules = []

onready var inbox = $InTray
onready var sorted = $"Papers, Please/YSort"
var good_slip = preload("res://OfficeTools/GoodSlip.tscn")
var bad_slip = preload("res://OfficeTools/BadSlip.tscn")

func _rule_parse(object):
	if object.attributes == rules:
		$RewardTimer.start()
	else:
		$PunishmentTimer.start()


func _on_RewardTimer_timeout():
	var new_slip = good_slip.instance()
	sorted.add_child(new_slip)
	new_slip.position = inbox.position
	new_slip.position.y -= 400
	new_slip.position.x -= 100


func _on_PunishmentTimer_timeout():
	var new_slip = bad_slip.instance()
	sorted.add_child(new_slip)
	new_slip.position = inbox.position
	new_slip.position.y -= 400
	new_slip.position.x -= 100
