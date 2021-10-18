extends MarginContainer

onready var Selector_one = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var Selector_two = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var Selector_three = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

var current_selection = 0


func _ready():
	set_current_selection(0)


func _process(_delta):
	if Input.is_action_just_pressed("ui_down") and current_selection < 2:
		current_selection += 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_up") and current_selection > 0:
		current_selection -= 1
		set_current_selection(current_selection)
	elif Input.is_action_just_pressed("ui_accept"):
		handle_selection(current_selection)



func handle_selection(_current_selection):
	if _current_selection == 0:
		get_tree().change_scene("res://world.tscn")
		queue_free()
	if _current_selection == 2: 
		get_tree().quit()
		



func set_current_selection(_current_selection):
	Selector_one.text = ""
	Selector_two.text = ""
	Selector_three.text = ""
	if _current_selection == 0:
		Selector_one.text = ">"
	elif _current_selection == 1:
		Selector_two.text = ">"
	elif _current_selection == 2:
		Selector_three.text = ">"
