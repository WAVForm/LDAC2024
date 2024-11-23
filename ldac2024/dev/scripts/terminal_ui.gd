extends Control

@onready var close = $close

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close.pressed.connect(func(): if WRAPPER.ui_state_list.back() == WRAPPER.UIS.TERMINAL: 
		WRAPPER.prev_sub_ui()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
