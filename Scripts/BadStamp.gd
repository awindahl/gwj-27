extends Node2D

var stamp = preload("res://OfficeTools/RedStamp.tscn")
#var selected = false
#
#func _on_PickupArea_input_event(viewport, event, shape_idx):
#	if event is InputEventMouseButton:
#		if event.pressed:
#			if event.button_index == BUTTON_LEFT:
#				selected = true
#				get_parent().is_holding = true
#
#func _input(event):
#	if event is InputEventMouseButton:
#		if event.pressed:
#			if event.button_index == BUTTON_LEFT:
#				if selected:
#					$AnimationPlayer.play("Stamp")
#
#func _process(delta):
#	if selected:
#		position = get_global_mouse_position()
#
#
#	if Input.is_action_just_pressed("ui_accept"):
#		selected = false
#		get_parent().is_holding = false

func _stamp():
	var stamped_doc = get_top_doc()
	if stamped_doc != null:
		
		var new_stamp = stamp.instance()
		
		if stamped_doc.is_in_group("Stampable"):
			if stamped_doc.attributes.find("Approved", 0) and stamped_doc.attributes.find("Denied", 0):
				stamped_doc.attributes.append("Denied")
				
			stamped_doc.get_node("Sprite/Stamps").add_child(new_stamp)
			new_stamp.global_position = $StampArea.global_position


func get_top_doc() -> Area2D:
	var top_z = -1
	var pos: Vector2
	var intersects: Array
	var top_piece: Area2D
	
	for area in $StampArea.get_overlapping_areas():
		if area.is_in_group("Documents"):
			if area.position.y > top_z:
				top_piece = area
				top_z = area.position.y
				
	return top_piece


func _on_Button_pressed():
	$AnimationPlayer.play("Stamp")
