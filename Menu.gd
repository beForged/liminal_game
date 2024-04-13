extends Control

@onready var start_game = %StartGame
@onready var quitbutton = %Quitbutton


func _ready():
	start_game.pressed.connect(self.openGame)
	quitbutton.pressed.connect(self.closeButtonPressed)
	



func closeButtonPressed():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit(0)


func openGame():
	get_tree().change_scene_to_file("res://mainScene.tscn")
