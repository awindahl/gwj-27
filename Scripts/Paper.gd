extends Area2D

var attributes = []
var info = []
var going_out = false

func _ready():
	for string in info:
		$Sprite/RichTextLabel.text += string

func _input(event):
	if event is InputEventMouseMotion:
		if  get_parent().get_parent().selected == self and get_parent().get_parent().can_grab:
			position = get_global_mouse_position() + get_parent().get_parent().ev_pos


func _process(delta):
	if $CollisionShape2D.disabled and not going_out:
		position.y += 3
	
	if position.y > 40:
		$CollisionShape2D.disabled = false
	
	if going_out:
		$CollisionShape2D.disabled = true
		position.y -= 3
