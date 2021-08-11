extends Label

var gems = 0



func _ready():
	text = String(gems)




func _on_gem_Collected():
	gems = gems + 1
	_ready()
	if gems == 10:
		$Timer.start()


func _on_Timer_timeout():
	get_tree().change_scene("res://youwin.tscn")
