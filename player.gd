extends CharacterBody3D

@export var speed = 5
@export var fall_accel = 50
@export var mouse_sensitivity = .02


@onready var camera_3d = %Camera3D



var target_velo = Vector3.ZERO


# no jumping 
func _physics_process(delta):
	
	var input = Input.get_vector("move_left","move_right", "move_forward", "mvoe_back")
	
	var movement = transform.basis * Vector3(input.x, 0, input.y)

	
	if movement != Vector3.ZERO:
		movement = movement.normalized()
		
	target_velo.x = movement.x * speed
	target_velo.z = movement.z * speed
	
	velocity = target_velo
	move_and_slide() 
		

func _input(event):
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * mouse_sensitivity)
		camera_3d.rotate_x(-event.relative.y * mouse_sensitivity)
		camera_3d.rotation.x = clampf(camera_3d.rotation.x, -deg_to_rad(70), deg_to_rad(70))
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE: # can also pout this in _process like:	if Input.is_action_pressed("exit"):
			get_tree().change_scene_to_file("res://main_menu.tscn")
		
		
		
