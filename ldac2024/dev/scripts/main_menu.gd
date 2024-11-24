extends Control

@onready var start = $button_container/test_scene_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	start.pressed.connect(func(): WRAPPER.change_to_scene(WRAPPER.SCENES.DEV))
