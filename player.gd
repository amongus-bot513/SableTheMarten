extends KinematicBody
 

#var gravity = Vector3.DOWN * 12
#var speed = 10
#var camera
#var velocity = Vector3()
#var jumpforce : float = 10.0
#var gravity : float = 17.0
#var on_ground = false
#var has_double_jumped = false


#func _physics_process(delta):
	#velocity.y -= gravity * delta
	#get_input()
	#camera = get_node("target/Camera").get_global_transform()
	#velocity.x = 0
	#velocity.z = 0
	#if Input.is_action_pressed("move_forward"):
		#velocity.z -= speed 
	#if Input.is_action_pressed("move_backward"):
	#	velocity.z += speed 
	#if Input.is_action_pressed("move_right"):
#	#	velocity.x += speed 
#	if Input.is_action_pressed("move_left"):
#		velocity.x -= speed 
#	
#	if is_on_floor():
#		on_ground = true
#	else:
#		on_ground = false
	#if Input.is_action_pressed("jump") and is_on_floor():
		#velocity.y = jumpforce
#	if Input.is_action_just_pressed("jump"):
#		if on_ground == true:
#			velocity.y = jumpforce
#			has_double_jumped = false
#			on_ground = false
#		elif on_ground == false and has_double_jumped == false:
#			velocity.y = jumpforce
#			has_double_jumped = true
	
#	velocity = move_and_slide(velocity, Vector3.UP)

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
	
var on_ground = false
var has_double_jumped = false
var gravity = -60.0
var max_gravity = -150.0
var speed = 0.0
var velocity = Vector3()
var jump_height = 25.0
var dir = Vector3()
var input = Vector3()
var floor_normal = Vector3.UP
var snap = Vector3.DOWN
var move_blend = 0.0
var jump_blend = 0.0
var stop_on_slope = false
var max_slope = deg2rad(40.0)
var jumping = false
var moving = false
var can_run = false
var can_attack = false
var anim = ANIM_WALK
var jumpforce : float = 10.0
var jump_num = 0

var state
enum { WALK, JUMP, }

const ANIM_WALK = 0
const ANIM_JUMP= 1
const BLEND_MINIMUM = 0.5
const RUN_JUMPD_BLEND_AMOUNT = 0.05
const IDLE_BLEND_AMOUNT = 0.2
const JUMPU_BLEND_AMOUNT = 0.1

func _physics_process(delta):
	
	#animate()
	velocity.x = 0.0
	velocity.z = 0.0
	input = Vector3.ZERO
	
	if(Input.is_action_pressed("move_forward")):
		input.z += 1
		speed = 14
		moving = true
		
		
	if(Input.is_action_pressed("move_backward")):
		input.z -= 1
		speed = 8.0
		moving = true
		
		
	
	
	if(Input.is_action_pressed("move_left")):
		input.x += 1
		speed = 8.0
		moving = true
		
	
	if(Input.is_action_pressed("move_right")):
		input.x -= 1
		speed = 8.0
		moving = true
		
		
		

	input = input.normalized()
	
	dir = (transform.basis.z * input.z + transform.basis.x * input.x)
	
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed
	
	velocity.y += gravity * delta
	
	if velocity.y < max_gravity:
		velocity.y = max_gravity
	
	
	if is_on_floor():
		on_ground = true
	else:
		on_ground = false
	
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_height
		snap = Vector3.ZERO
		moving = true
		can_run = false
	if Input.is_action_just_pressed("jump"): 
		velocity.y = jump_height
		if on_ground == true:
			jumping = true
			velocity.y = jump_height
			has_double_jumped = false
			on_ground = false
		elif on_ground == false:
			velocity.y = jump_height
			jumping = false
	
	velocity = move_and_slide(velocity, Vector3.UP)
	#if Input.is_action_pressed("jump") and is_on_floor():
		#velocity.y = jumpforce
	
	#if(Input.is_action_just_pressed("jump")) and is_on_floor():
		#snap = Vector3.ZERO
		#velocity.y = jump_height
		#jumping = true
		#moving = true
		#can_run = false
	#else:
		#snap = Vector3.DOWN
	
	#stop_on_slope = true if get_floor_velocity().x == 0 and get_floor_velocity().z == 0 else false

	#velocity = move_and_slide_with_snap(velocity,snap,floor_normal, stop_on_slope ,1, max_slope)
	
	#if is_on_floor() and velocity.y < 0:
		#velocity.y = 0.0
		#jumping = false












