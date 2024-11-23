extends Node

@export_category("Settings")
@export var CAMERA_SENSITIVITY = 0.1 #deg 

#Scenes
var current_scene = null
var scene_state:SCENES = SCENES.NONE
enum SCENES {NONE, DEV, MAIN_MENU}
var dev_scene = load("res://dev/scenes/test_scene.tscn")
var main_menu_scene = load("res://dev/scenes/main_menu.tscn")

#UIs
var current_ui = null
var ui_state:UIS = UIS.NONE
enum UIS {NONE ,PAUSE, TERMINAL}
var pause_ui = load("res://dev/scenes/uis/pause_ui.tscn")
var terminal_ui = load("res://dev/scenes/uis/terminal_ui.tscn")
var ui_open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_to_scene(SCENES.MAIN_MENU)
	pass # Replace with function body.

func change_to_scene(scene_id:SCENES):
	if current_scene != null: 
		current_scene.queue_free()
		change_to_ui(UIS.NONE)
	match scene_id:
		SCENES.DEV:
			current_scene = dev_scene.instantiate()
			add_child(current_scene)
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		SCENES.MAIN_MENU:
			current_scene = main_menu_scene.instantiate()
			add_child(current_scene)
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		_:
			pass
	scene_state = scene_id

func change_to_ui(ui_id:UIS):
	if current_ui != null:
		current_ui.queue_free()
	match ui_id:
		UIS.PAUSE:
			current_ui = pause_ui.instantiate()
			add_child(current_ui)
		UIS.TERMINAL:
			current_ui = terminal_ui.instantiate()
			add_child(current_ui)
		_:
			pass
	ui_state = ui_id

func toggle_ui(ui_id:UIS):
	if ui_id == ui_state:
		current_ui.visible = not current_ui.visible
	else:
		change_to_ui(ui_id)
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE if current_ui.visible == true else Input.MOUSE_MODE_CAPTURED
	
func is_ui_open():
	return current_ui.visible if current_ui != null else false
