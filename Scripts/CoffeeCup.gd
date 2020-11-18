extends Area2D

var last_pos = Vector2()
var stain = preload ("res://OfficeTools/Stain.tscn")
var attributes = []

func _input(event):
	if event is InputEventMouseMotion:
		if  get_parent().get_parent().selected == self and get_parent().get_parent().can_grab:
			position = get_global_mouse_position() + get_parent().get_parent().ev_pos

func _process(delta):
	
	for area in $StampArea.get_overlapping_areas():
		if Input.is_action_just_released("click"):
			if area.is_in_group("Stampable"):
				var new_stamp = stain.instance()
				area.get_node("Sprite/Stamps").add_child(new_stamp)
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
