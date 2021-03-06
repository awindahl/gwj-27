extends Node2D

var is_holding = false
var rules = []
var did_good = true
var did_bad = true
var total = 0
var fails = 0
var successes = 0
var day = 1

var did_fuckup = false
var no_fuckup = true

onready var inbox = $InTray
onready var sorted = $"Papers, Please/YSort"
var good_slip = preload("res://OfficeTools/GoodSlip.tscn")
var bad_slip = preload("res://OfficeTools/BadSlip.tscn")

func _rule_parse(object):
	
	$OutTray.send_away = false
	
	did_fuckup = false
	no_fuckup = true
	
	if object.correct_request:
	
		if object.approved == "Approved":
			
			for rule in rules:
				for attr in object.attributes:
					if attr == rule and not did_fuckup:
						did_good = false
						
						
			if did_good:
				print ("you did good")
				successes += 1
				$OutTray.send_away = true
			else:
				print("You fucked up")
				fails += 1
				$OutTray.send_away = true
				
			
		elif object.approved == "Denied":
			
			for rule in rules:
				for attr in object.attributes:
					if attr == rule and no_fuckup:
						did_bad = false
						
			if did_bad:
				print("you did bad")
				fails += 1
				$OutTray.send_away = true
			else:
				print ("You did good")
				successes += 1
				$OutTray.send_away = true
	else:
		print("wrong request")
		fails += 1

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
	$VictoryScreen/TotalNum.text = var2str(total)
	var missed = (total - successes - fails)
	fails += missed
	$VictoryScreen/FailNum.text = var2str(fails)
	$VictoryScreen/SuccessNum.text = var2str(successes)
	Singleton.party_ranking -= successes
	Singleton.party_ranking += fails
	$VictoryScreen/RankNum.text = var2str(Singleton.party_ranking)
	$AnimationPlayer.play("Fade to Black")
	Singleton.day += 1
