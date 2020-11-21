extends Area2D

var attributes = []
var info = []
var going_out = false
var in_book = false
var ordered_num 

func _ready():
	for string in info:
		$Sprite/RichTextLabel.text += string

func _input(event):
	if event is InputEventMouseMotion and not in_book:
		if  get_parent().get_parent().selected == self and get_parent().get_parent().can_grab:
			position = get_global_mouse_position() + get_parent().get_parent().ev_pos


func _process(delta):
	if $CollisionShape2D.disabled and not going_out:
		position.y += 3
	
	if position.y > 40 and not in_book:
		$CollisionShape2D.disabled = false
	
	if going_out and not in_book:
		$CollisionShape2D.disabled = true
		position.y -= 3
