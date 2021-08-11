extends Area

signal coinCollected 

func _ready():
	pass 

func _physics_process(_delta):
	rotate_y(deg2rad(2))



func _on_gem_body_entered(body):
	if body.name == "sable":
		$AnimationPlayer.play("bounce")
		$Timer.start()
	


func _on_Timer_timeout():
	emit_signal("coinCollected")
	queue_free()
