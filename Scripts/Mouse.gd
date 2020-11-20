extends Node2D

var particle = preload("res://OfficeTools/ClickParticle.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _input(event):
	
	if event is InputEventMouseButton:
		if event.pressed:
			if event.button_index == BUTTON_LEFT:
				var new_particle = particle.instance()
				add_child(new_particle)

func _process(delta):
	position = get_global_mouse_position()
