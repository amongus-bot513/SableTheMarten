extends KinematicBody
 

#var gravity = Vector3.DOWN * 12
var speed = 10

var velocity = Vector3()
var jumpforce : float = 10.0
var gravity : float = 17.0
var on_ground = false
var has_double_jumped = false



func _physics_process(delta):
	velocity.y -= gravity * delta
	#get_input()
	
	velocity.x = 0
	velocity.z = 0
	if Input.is_action_pressed("move_forward"):
		velocity.z -= speed 
	if Input.is_action_pressed("move_backward"):
		velocity.z += speed 
	if Input.is_action_pressed("move_right"):
		velocity.x += speed 
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed 
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	#if Input.is_action_pressed("jump") and is_on_floor():
		#velocity.y = jumpforce
	if Input.is_action_just_pressed("jump"):
		if on_ground == true:
			velocity.y = jumpforce
			has_double_jumped = false
			on_ground = false
		elif on_ground == false and has_double_jumped == false:
			velocity.y = jumpforce
			has_double_jumped = true
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	
	
	

#func get_input():
	#velocity.x = 0
	#velocity.z = 0
	#if Input.is_action_pressed("move_forward"):
		#velocity.z -= speed 
	#if Input.is_action_pressed("move_backward"):
		#velocity.z += speed 
	#if Input.is_action_pressed("move_right"):
		#velocity.x += speed 
	#if Input.is_action_pressed("move_left"):
		#velocity.x -= speed 
	
	
