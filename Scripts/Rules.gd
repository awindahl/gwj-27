extends Area2D

var attributes = []
var rules = []

func _ready():
	for string in rules:
		$Sprite/RichTextLabel.text += string
		
func _input(event):
	if event is InputEventMouseMotion:
		if  get_parent().get_parent().selected == self and get_parent().get_parent().can_grab:
			position = get_global_mouse_position() + get_parent().get_parent().ev_pos

func _process(delta):
	if $CollisionShape2D.disabled:
		position.y += 3
	
	if position.y > 40:
		$CollisionShape2D.disabled = false
