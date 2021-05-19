extends KinematicBody
 
var direction = Vector3()
#var GRAVITY = 9.8
var acceleration = 5
onready var pivot = $pivot
#var jump = 5
#var fall = Vector3()
#var y_velo = 0
var speed = 10
#var jump_num = 0
var velocity = Vector3()
var mouse_senitivity = 0.1

func ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-event.relative.x * mouse_senitivity))
		pivot.rotate_x(deg2rad(-event.relative.y * mouse_senitivity))

func _process(delta):
	
	direction = Vector3()
	
	if Input.is_action_just_pressed("move_forward"):
		direction -= transform.basis.z 
		
	elif Input.is_action_just_pressed("move_backward"):
		direction += transform.basis.z
		
	if Input.is_action_just_pressed("move_left"):
		direction -= transform.basis.x 
		
	elif Input.is_action_just_pressed("move_right"):
		direction += transform.basis.x
		
	direction = direction.normalized()
	velocity = velocity.linear_interpolate(direction * speed, acceleration * delta)
	velocity = move_and_slide(velocity, Vector3.UP)
	
	

	#if is_on_floor():
		#jump_num == 0
		
	#if not is_on_floor():
		#fall.y -= GRAVITY * delta
		
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#if jump_num == 0:
			#fall.y = jump
			#jump_num = 1
	
	#if Input.is_action_just_pressed("jump") and not is_on_floor():
		#if jump_num == 1:
			#fall.y = jump
			#jump_num = 2
	#move_and_slide(fall, Vector3.UP)
	
	
	





