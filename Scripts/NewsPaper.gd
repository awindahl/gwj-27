extends Area2D

var attributes = []
var rules = []

var sprite1 = preload("res://Assets/News1.png")
var sprite2 = preload("res://Assets/News2.png")
var sprite3 = preload("res://Assets/News3.png")
var sprite4 = preload("res://Assets/News4.png")


var regions = [
	"Temtov",
	"Trelan",
	"Windia",
	"Melpol",
	"Anagria",
	"Medleria",
	"Markov",
	"Paltoria"
	
]

var surnames = [
	"Goettner",
	"Gruendemann",
	"Kallweit",
	"Netzke",
	"Aristov",
	"Blohkin",
	"Gusev",
	"Zharkov",
	"Ishutin",
	"Vogt",
	"Nowak",
	"Pietsch",
	"Radau",
	"Windhov",
	"Moorc",
	"Quentov",
	"Clantov"
]

var bread1_1 = "The author "
var bread1_2 = " has been deemed an enemy of the state. Any works created by this author should be handed in to The Ministry for the Assignment of Literature"

var bread2_1 = "All printed media from the territory of " 
var bread2_2 = " is considered counter-revolutionary."
var bread2_3 = "Furthermore, the work of the Citizen's bureau has increased nominal GPD by "

func _ready():
	randomize()
	
	var rand_sprite = randi()%4+1
	
	match rand_sprite:
		1:
			$Sprite.texture = sprite1
		2:
			$Sprite.texture = sprite2
		3:
			$Sprite.texture = sprite3
		4:
			$Sprite.texture = sprite4
	
	var rand_name = randi()%surnames.size()
	rand_name = surnames[rand_name]
	
	var rand_reg = randi()%regions.size()
	rand_reg = regions[rand_reg]
	
	var rand_per = (randf())*10
	
	rules.append(rand_name)
	rules.append(rand_reg)
	
	get_parent().get_parent().get_parent().rules += rules
	
	$Sprite/Bread1.text = bread1_1 + rand_name + bread1_2
	$Sprite/Bread2.text = bread2_1 + rand_reg + bread2_2 + "\n \n" + bread2_3 + var2str(rand_per) + "%."

func _input(event):
	if event is InputEventMouseMotion:
		if  get_parent().get_parent().selected == self and get_parent().get_parent().can_grab:
			position = get_global_mouse_position() + get_parent().get_parent().ev_pos
