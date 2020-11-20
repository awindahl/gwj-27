extends Area2D

var closed_sprite = preload("res://Assets/BookSmall.png")
var open_sprite = preload("res://Assets/OpenBookSmall.png")
var status = -1
var approved = ""
var closed_pos = Vector2()
var going_out = false
var attributes = []

func _ready():
	for string in attributes:
		$Sprite/Inside.text += string 


func _input(event):
	if event is InputEventMouseMotion:
		if  get_parent().get_parent().selected == self and get_parent().get_parent().can_grab:
			position = get_global_mouse_position() + get_parent().get_parent().ev_pos

func _process(delta):
	if $CollisionShape2D.disabled and not going_out:
		position.y += 3
	
	if global_position.y > 40:
		$CollisionShape2D.disabled = false
	
	if going_out:
		$CollisionShape2D.disabled = true
		position.y -= 3
	
	for area in $Sprite/Stamps/Pocket/TextureRect/Area2D.get_overlapping_areas():
		if Input.is_action_just_released("click"):
			if not area.get_parent().is_in_group("Book"):
				if area.get_parent().attributes != []:
					area.get_parent().in_book = true
					area.get_parent().get_parent().remove_child(area.get_parent())
					$Sprite/Stamps/Pocket/TextureRect.add_child(area.get_parent())
					area.get_parent().position = Vector2(3, -9)
					area.get_parent().show_behind_parent = true
					approved = area.get_parent().attributes[0]

func _on_Button_button_up():
	if closed_pos == position and status == -1 and get_parent().get_parent().selected == self:
		$Sprite.texture = open_sprite
		$CollisionShape2D.get_shape().extents.x = 220
		$Button.rect_position.x = -220
		$Button.rect_size.x = 440
		$Sprite/Inside.visible = true
		$Sprite.rect_position.x = -220
		$Sprite.rect_size.x = 440
		$Sprite/Stamps.visible = true
		add_to_group("Stampable")
		status *= -1
	
	elif closed_pos == position and status == 1 and get_parent().get_parent().selected == self:
		$Sprite.texture = closed_sprite
		$CollisionShape2D.get_shape().extents.x = 110
		$Button.rect_position.x = -110
		$Button.rect_size.x = 220
		$Sprite/Inside.visible = false
		$Sprite.rect_position.x = -110
		$Sprite.rect_size.x = 220
		$Sprite/Stamps.visible = false
		remove_from_group("Stampable")
		status *= -1

func _on_Button_button_down():
	if get_parent().get_parent().selected == self:
		closed_pos = position
