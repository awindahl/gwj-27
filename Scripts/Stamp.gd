extends Node2D

var selected = false

func _on_PickupArea_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == BUTTON_LEFT:
				selected = true
				get_parent().is_holding = true

func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == BUTTON_LEFT:
				if selected:
					$AnimationPlayer.play("Stamp")

func _process(delta):
	if selected:
		position = get_global_mouse_position()
		var top_z = -1
		var pos: Vector2
		var intersects: Array
		var top_piece: Area2D
		
		for area in $StampArea.get_overlapping_areas():
			if area.is_in_group("Documents"):
				if area.position.y > top_z:
					top_piece = area
					top_z = area.position.y
			top_piece.attributes.append("stamped")
			print("stamped")

	if Input.is_action_just_pressed("ui_accept"):
		selected = false
		get_parent().is_holding = false
	
