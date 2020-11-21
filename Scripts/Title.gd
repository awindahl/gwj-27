extends Node2D

func _ready():
	if Singleton.has_seen_intro:
		$AnimationPlayer.play("clean")


func _input(event):
	if event.is_action_pressed("click") and not Singleton.has_seen_intro:
		Singleton.has_seen_intro = true
		get_tree().paused = false
		$AnimationPlayer.play("Intro")

func _on_Credits_pressed():
	get_tree().change_scene("res://Credits.tscn")


func _on_Play_pressed():
	$AnimationPlayer.play("Blink")

func _start():
	get_tree().change_scene("res://NightToDay.tscn")
