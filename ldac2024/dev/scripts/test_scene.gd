extends Node3D

var input_limit_timer = Timer.new()
@onready var box_spawn = $box_spawn
var scannable = load("res://dev/scenes/gameobjects/scannable.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_limit_timer.one_shot = true
	add_child(input_limit_timer)
	WRAPPER.add_nec_ui(WRAPPER.UIS.PLAYER)
	WRAPPER.new_order_in.connect(func(item):
		var s = scannable.instantiate()
		s.item = item
		s.position = box_spawn.global_position
		add_child(s)
	)
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE and (input_limit_timer.is_stopped() || input_limit_timer.time_left <= 0):
		input_limit_timer.start(0.25)
		WRAPPER.toggle_ui_of_id(WRAPPER.UIS.PAUSE)
		WRAPPER.toggle_mouse_mode(Input.MOUSE_MODE_CAPTURED)
