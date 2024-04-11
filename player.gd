extends CharacterBody3D

@export var speed = 5
@export var fall_accel = 50
@export var mouse_sensitivity = .02


@onready var camera_3d = %Camera3D



var target_velo = Vector3.ZERO


# no jumping 
func _physics_process(delta):
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1
	
	if direction != Vector3.ZERO:
		direction = direction.normalized()
		
	target_velo.x = direction.x * speed
	target_velo.z = direction.z * speed
	
	velocity = target_velo
	move_and_slide() 
		

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera_3d.rotate_x(-event.relative.y * mouse_sensitivity)
		camera_3d.rotation.x = clampf(camera_3d.rotation.x, -deg_to_rad(70), deg_to_rad(70))
		
		
		
		
