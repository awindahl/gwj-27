extends Node2D

var can_grab = false
var offset = Vector2()
var ev_pos = Vector2()

func _ready():
	set_process_unhandled_input(true)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		
		if can_grab:
			get_tree().set_input_as_handled()
			position = get_global_mouse_position() + ev_pos

func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == BUTTON_LEFT:
				if get_tree().get_nodes_in_group("dragged").empty():
					add_to_group("dragged")
					can_grab = true
					ev_pos = position - get_global_mouse_position()
					get_parent().move_child(self, 1)
		elif can_grab:
			remove_from_group("dragged")
			can_grab = false
