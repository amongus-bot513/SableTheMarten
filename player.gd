extends KinematicBody
 


var speed = 0.0
var velocity = Vector3()
var jumpforce  = 10.0
var on_ground = false
var has_double_jumped = false
var input = Vector3()
var moving = false
var dir = Vector3()
var snap = Vector3.DOWN
var gravity = -25.0
var max_gravity = -150.0
var floor_normal = Vector3.UP


func _physics_process(delta):
	
	
	input = Vector3.ZERO
	velocity.x = 0
	velocity.z = 0
	
	if Input.is_action_pressed("move_forward"):
		input.z += 1
		speed = 8
	if Input.is_action_pressed("move_backward"):
		input.z -= 1 
		speed = 8
	if Input.is_action_pressed("move_right"):
		input.x -= 1 
		speed = 8
	if Input.is_action_pressed("move_left"):
		input.x += 1 
		speed = 8
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	
	if velocity.y < max_gravity:
		velocity.y = max_gravity
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jumpforce
		snap = Vector3.ZERO
	else:
		snap = Vector3.DOWN
	if Input.is_action_just_pressed("jump"):
		if on_ground == true:
			velocity.y = jumpforce
			has_double_jumped = false
			on_ground = false
		elif on_ground == false and has_double_jumped == false:
			velocity.y = jumpforce
			has_double_jumped = true
	
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed
	
	velocity.y += gravity * delta
	
	input = input.normalized()
	
	dir = (transform.basis.z * input.z + transform.basis.x * input.x)
	
	velocity = move_and_slide(velocity, Vector3.UP)
	
	













