extends Node2D

var sent_out = 0
var rules = ["A", "B", "1967"]
var rule_list = preload("res://OfficeTools/Rules.tscn")
var book = preload("res://OfficeTools/Book1.tscn")
var request = preload ("res://OfficeTools/Paper1.tscn")

func _on_Timer_timeout():
	
	match sent_out:
		0:
			#rules
			sent_out += 1
			var new_list = rule_list.instance()
			
			for rule in rules:
				new_list.rules.append(rule)
				
			get_parent().get_node("Papers, Please/YSort").add_child(new_list)
			new_list.position = position
			new_list.position.y -= 400
			new_list.position.x -= 100
			get_parent().rules = new_list.rules
		1:
			#request
			sent_out += 1
			var new_book = book.instance()
			var new_request = request.instance()
			new_request.info.append("A")
			new_book.attributes.append("A")
			new_book.attributes.append("1967")
			get_parent().get_node("Papers, Please/YSort").add_child(new_book)
			new_book.position = position
			new_book.position.y -= 500
			get_parent().get_node("Papers, Please/YSort").add_child(new_request)
			new_request.position = position
			new_request.position.y -= 400
			new_request.position.x -= 100
		_:
			pass
