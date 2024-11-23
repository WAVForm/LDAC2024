extends Node3D

var input_limit_timer = Timer.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_limit_timer.one_shot = true
	add_child(input_limit_timer)
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE and (input_limit_timer.is_stopped() || input_limit_timer.time_left <= 0):
		input_limit_timer.start(1)
		WRAPPER.toggle_ui(WRAPPER.UIS.PAUSE)
