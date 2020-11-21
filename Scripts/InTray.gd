extends Node2D

var sent_out = 0
var rules = []
var rule_list = preload("res://OfficeTools/Rules.tscn")
var book = preload("res://OfficeTools/Book1.tscn")
var request = preload ("res://OfficeTools/Paper1.tscn")
var random_request

var num_request = 0

var first_book_title_fact = [
	"The Fundamentals of",
	"The Phenomenology of",
	"The Basics of",
	"Advanced",
	"Theoretical",
	"A Theory of",
	"A Collection on",
	"A Commentary on",
	"An Advanced Guide to",
	"The Handbook on"
]

var second_book_title_fact = [
	"Physics",
	"Chemistry",
	"Biology",
	"Nuclear Physics",
	"Sociology",
	"State Theory",
	"Censorship",
	"Philosophy",
	"Ethics",
	"Socialism"
]

var first_book_title_fiction = [
	"The Thief's",
	"The Watchmaker's",
	"A Traveller's",
	"A Man's",
	"A Woman's",
	"A Dog's",
	"The Comrade's",
	"A Loyal Comrade's",
	"Soldier's",
	"Party Member's",
	"Traitor's",
	"The Messenger's",
	"The Leader's",
	"A Midwinter",
	"A Summer's",
	"An Ugly",
	"A Frightening"
]

var second_book_title_fiction =[
	"Tale",
	"Adventure",
	"Betrayal",
	"Journey",
	"Sorrow",
	"Duty",
	"Purpose",
	"Death",
	"Vengeance",
	"Story",
	"Life"
]

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


func _randomize_rule() -> Array:
	randomize()
	
	var rule = []
	
	var rand_title_fact_first = randi()%first_book_title_fact.size()
	rand_title_fact_first = first_book_title_fact[rand_title_fact_first]
	
	var rand_title_fact_second = randi()%second_book_title_fact.size()
	rand_title_fact_second = second_book_title_fact[rand_title_fact_second]
	
	var rand_title_fiction_first = randi()%first_book_title_fiction.size()
	rand_title_fiction_first = first_book_title_fiction[rand_title_fiction_first]
	
	var rand_title_fiction_second = randi()%second_book_title_fiction.size()
	rand_title_fiction_second = second_book_title_fiction[rand_title_fiction_second]

	var rand_date = randi()%45+1919
	rand_date = var2str(rand_date)
	var rand_date2 = randi()%45+1919
	rand_date2 = var2str(rand_date2)
	var rand_date3 = randi()%45+1919
	rand_date3 = var2str(rand_date3)
	
	
	var rand_name = randi()%surnames.size()
	rand_name = surnames[rand_name]
	rand_name += ", "
	
	var rand_reg = randi()%regions.size()
	rand_reg = regions[rand_reg]
	
	var what_rule = randi()%4+1
	var num_rule = false
	
	var to_be_added = []
	
	match what_rule:
		1:
			var random_i = randi()%2
			
			if random_i == 0:
				rand_title_fact_second += "\n"
				to_be_added = rand_title_fact_second
				#rule.append(rand_title_fact_second)
			elif random_i == 1:
				rand_title_fiction_second += "\n"
				to_be_added = rand_title_fiction_second
				#rule.append(rand_title_fiction_second)
		2:
			#rule.append(rand_name)
			to_be_added = rand_name
		3:
			num_rule = true
			rand_date += "\n"
#			rand_date2 += "\n"
#			rand_date3 += "\n"
			to_be_added = rand_date
#			to_be_added.append(rand_date2)
#			to_be_added.append(rand_date3)
			#rule.append(rand_date)
		4:
			to_be_added = rand_reg
			#rule.append(rand_reg)
	
	for item in get_parent().rules:
		if item != to_be_added[0]:
			rule.append(to_be_added)
			return rule
	
	return _randomize_rule()

func _randomize_request() -> Array:
	randomize()
	
	var request = []
	
	var rand_title_fact_first = randi()%first_book_title_fact.size()
	rand_title_fact_first = first_book_title_fact[rand_title_fact_first]
	
	var rand_title_fact_second = randi()%second_book_title_fact.size()
	rand_title_fact_second = second_book_title_fact[rand_title_fact_second]
	
	var rand_title_fiction_first = randi()%first_book_title_fiction.size()
	rand_title_fiction_first = first_book_title_fiction[rand_title_fiction_first]
	
	var rand_title_fiction_second = randi()%second_book_title_fiction.size()
	rand_title_fiction_second = second_book_title_fiction[rand_title_fiction_second]
	
	
	var random_i = randi()%2
	
	if random_i == 0:
		rand_title_fact_first += " "
		request.append(rand_title_fact_first)
		rand_title_fact_second += "\n"
		request.append(rand_title_fact_second)
	elif random_i == 1:
		rand_title_fiction_first += " "
		request.append(rand_title_fiction_first)
		rand_title_fiction_second += "\n"
		request.append(rand_title_fiction_second)
	
	
	var rand_name = randi()%surnames.size()
	rand_name = surnames[rand_name]
	rand_name += ", "
	request.append(rand_name)
	
	var rand_date = randi()%45+1919
	rand_date = var2str(rand_date)
	rand_date += "\n"
	request.append(rand_date)
	
	var rand_reg = randi()%regions.size()
	rand_reg = regions[rand_reg]
	
	request.append(rand_reg)
	
	return request


func _on_RulesTimer_timeout():
	var new_list = rule_list.instance()
	
	var new_rules = _randomize_rule()
	new_list.rules += new_rules
	get_parent().rules += new_rules
	
	var new_rules2 = _randomize_rule()
	new_list.rules += new_rules2
	get_parent().rules += new_rules2
	#new_list.rules.append("\n")
	#new_list.rules += _randomize_rule()
	print(get_parent().rules)
	
	get_parent().get_node("Papers, Please/YSort").add_child(new_list)
	
	new_list.position = position
	new_list.position.y -= 400
	new_list.position.x -= 100
	$RulesTimer.start(20)
	

func _on_RequestTimer_timeout():
	
	get_parent().total += 1
	random_request = _randomize_request()
	var new_book = book.instance()
	var new_request = request.instance()
	num_request += 1
	new_book.ordered_num = num_request
	new_request.ordered_num = num_request
	new_request.info = random_request
	new_book.attributes = random_request
	get_parent().get_node("Papers, Please/YSort").add_child(new_book)
	new_book.position = position
	new_book.position.y -= 500
	get_parent().get_node("Papers, Please/YSort").add_child(new_request)
	new_request.position = position
	new_request.position.y -= 400
	new_request.position.x -= 100
	$RequestTimer.start(15)
