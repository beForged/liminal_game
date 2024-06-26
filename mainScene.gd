extends Node3D

@onready var hud_ui = %HUDui
@onready var audio_stream_player_3d = %AudioStreamPlayer3D
@onready var player = %Player

var tutorial = [
	"move the mouse to look around",
	"use WASD keys to move around",
	"use E to unlock your car"
]

var curr = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	show_tutorial(curr)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _input(event):
	#tutorial code idk why i wrote this
	if event is InputEventMouseMotion and curr == 0:
		curr = 1
		show_tutorial(curr)
	if event is InputEventKey and curr < 3:
		if event.pressed and (event.keycode == KEY_W or event.keycode == KEY_A or event.keycode == KEY_S or event.keycode == KEY_D):
			curr = 2
			show_tutorial(curr)
		if event.pressed and event.keycode == KEY_E:
			curr = 3
			hide_tutorial()
			
	# play car unlock noise
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_E:
			audio_stream_player_3d.play()
			
			if player.position.distance_to(audio_stream_player_3d.position) < 5:
				hud_ui.display_text("you found your car congrats (press esc to exit to menu)")
				

func show_tutorial(num):
	hud_ui.display_text(tutorial[num])
		
func hide_tutorial():
	hud_ui.hide_text()
