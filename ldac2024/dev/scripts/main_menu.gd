extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	$button_container/test_scene_button.pressed.connect(func(): WRAPPER.change_to_scene(WRAPPER.SCENES.DEV))
	pass # Replace with function body.
