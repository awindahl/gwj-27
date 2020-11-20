extends Node2D

var can_grab = false
var ev_pos = Vector2()
var selected

func _input(event):
	
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == BUTTON_LEFT:
				selected = select_piece()
				if get_tree().get_nodes_in_group("dragged").empty() and selected != null and not get_parent().is_holding:
					selected.add_to_group("dragged")
					can_grab = true
					ev_pos = selected.position - get_global_mouse_position()
		elif can_grab and selected != null:
			selected.remove_from_group("dragged")
			can_grab = false

func select_piece() -> Area2D:
	var pos: Vector2
	var intersects: Array
	var top_piece: Area2D
	var top_z: = -1000

	pos = get_viewport().get_mouse_position()
	intersects = get_world_2d().get_direct_space_state().intersect_point(pos, 32, [], 0x7FFFFFFF, true, true)
	for piece in intersects:
		if piece.collider.is_in_group("Documents"):
			if piece.collider.position.y > top_z:
				top_piece = piece.collider
				top_z = piece.collider.position.y

	return top_piece
