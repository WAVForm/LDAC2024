extends Control

@onready var main_menu = $menu_container/items_container/main_menu_button
@onready var options = $menu_container/items_container/options_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = PROCESS_MODE_WHEN_PAUSED
	main_menu.pressed.connect(func(): WRAPPER.change_to_scene(WRAPPER.SCENES.MAIN_MENU))
	options.pressed.connect(func(): pass ) #toggle options ui
	
func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE and event.is_pressed():
		WRAPPER.prev_sub_ui()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED if not WRAPPER.is_ui_open() else Input.MOUSE_MODE_VISIBLE
		get_tree().paused = false
