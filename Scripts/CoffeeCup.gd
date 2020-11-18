extends Area2D

var last_pos = Vector2()
var stain = preload ("res://OfficeTools/Stain.tscn")
var attributes = []
var moving = false

func _input(event):
	if event is InputEventMouseMotion:
		if  get_parent().get_parent().selected == self and get_parent().get_parent().can_grab:
			position = get_global_mouse_position() + get_parent().get_parent().ev_pos
			moving = true

func _process(delta):
	print(moving)
	if Input.is_action_just_released("click") and get_parent().get_parent().selected == self:
		$Timer.start()
		moving = false

func _stamp():
	var stamped_doc = get_top_doc()
	if stamped_doc != null:
		var new_stamp = stain.instance()
		
		if stamped_doc.is_in_group("Stampable"):
			stamped_doc.get_node("Sprite/Stamps").add_child(new_stamp)
			new_stamp.global_position = $StampArea.global_position

func get_top_doc() -> Area2D:
	var top_z = -1
	var pos: Vector2
	var intersects: Array
	var top_piece: Area2D
	
	for area in $StampArea.get_overlapping_areas():
		if area.is_in_group("Stampable"):
			if area.position.y > top_z:
				top_piece = area
				top_z = area.position.y
				
	return top_piece


func _on_Timer_timeout():
	_stamp()
