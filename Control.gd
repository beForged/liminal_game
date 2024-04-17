extends Control

@onready var label = %Label


var end = Color(1.0, 1.0, 1.0, 1.0)
var start = Color(1.0, 1.0, 1.0, 0.0)
	
func display_text(text, duration):
	var tween = get_tree().create_tween()
	tween.tween_property(label, "self_modulate", end, 1)
	# label.self_modulate = Color(1.0, 1.0, 1.0, lerp(0.0, 1.0, ))
	label.text = text
	# tween.tween_interval(duration)
	# tween.tween_property(label, "self_modulate", start, 1)
	
func hide_text():
	var tween = get_tree().create_tween()
	tween.tween_property(label, "self_modulate", start, 1)
	label.text = ""

