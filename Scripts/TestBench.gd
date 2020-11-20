extends Node2D

var is_holding = false
var rules = []
var did_good = true
var did_bad = true
var score = 0
var day = 1

onready var inbox = $InTray
onready var sorted = $"Papers, Please/YSort"
var good_slip = preload("res://OfficeTools/GoodSlip.tscn")
var bad_slip = preload("res://OfficeTools/BadSlip.tscn")

func _rule_parse(object):
	
	if object.approved == "Approved":
		
		for rule in rules:
			for attr in object.attributes:
				if attr == rule:
					#score -= 1
					print("You fucked up")
					did_good = false
					break
					
		if did_good:
			print ("you did good")
		
	elif object.approved == "Denied":
		
		for rule in rules:
			for attr in object.attributes:
				if attr == rule:
					#score += 1
					print("You did good")
					did_bad = false
					break
		if did_bad:
			print("you did bad")

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


func _on_DayTime_timeout():
	get_tree().paused = true
	day += 1
