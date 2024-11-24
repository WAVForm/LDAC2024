extends Node

@export_category("Settings")
@export var CAMERA_SENSITIVITY = 0.1 #deg 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_to_scene(SCENES.MAIN_MENU)
	pass # Replace with function body.

#Scenes
var current_scene = null
var scene_state:SCENES = SCENES.NONE
enum SCENES {NONE, DEV, MAIN_MENU}
var dev_scene = load("res://dev/scenes/test_scene.tscn")
var main_menu_scene = load("res://dev/scenes/main_menu.tscn")

func change_to_scene(scene_id:SCENES):
	if current_scene != null:
		current_scene.queue_free()
	reset_ui()
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


#UIs
var necessary_uis:Array= []
var ui_node_list:Array = []
var ui_state_list:Array = []
enum UIS {PAUSE, TERMINAL, TERMINAL_ITEM, PLAYER}
var pause_ui = load("res://dev/scenes/uis/pause_ui.tscn")
var terminal_ui = load("res://dev/scenes/uis/terminal_ui.tscn")
var terminal_item_ui = load("res://dev/scenes/uis/terminal/terminal_item_ui.tscn")
var player_ui = load("res://dev/scenes/uis/player_ui.tscn")

func reset_ui():
	while not ui_node_list.is_empty():
		prev_sub_ui()

func switch_current_ui(ui_id:UIS):
	prev_sub_ui()
	add_sub_ui(ui_id)

func add_nec_ui(ui_id:UIS):
	match ui_id:
		UIS.PLAYER:
			necessary_uis.append(player_ui.instantiate())
	add_child(necessary_uis.back())

func add_sub_ui(ui_id:UIS):
	match ui_id:
		UIS.PAUSE:
			ui_node_list.append(pause_ui.instantiate())
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		UIS.TERMINAL:
			ui_node_list.append(terminal_ui.instantiate())
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		UIS.TERMINAL_ITEM:
			ui_node_list.append(terminal_item_ui.instantiate())
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		_:
			pass
	add_child(ui_node_list.back())
	ui_state_list.append(ui_id)
	
func prev_sub_ui():
	if not ui_node_list.is_empty(): #if ui list not empty
		ui_node_list.back().queue_free() #free last ui
		ui_node_list.pop_back() #remove last ui
		ui_state_list.pop_back() #remote last ui state

func is_ui_open():
	if not ui_node_list.is_empty():
		return ui_node_list.back().visible
	else:
		return false

func toggle_ui_of_id(ui_id:UIS):
	if ui_state_list.is_empty() or ui_state_list.back() != ui_id:
		add_sub_ui(ui_id)
	else:
		prev_sub_ui()
		
func toggle_mouse_mode(prev):
	Input.mouse_mode = prev if ui_node_list.is_empty() else Input.mouse_mode
	
#Orders
var orders:Array
signal new_order_in(item:Item)

func _input(event):
	if event.is_action_pressed("ui_page_up"):
		new_order_in.emit(Item.Items.pick_random())
		orders.append(Item.Items.pick_random())
