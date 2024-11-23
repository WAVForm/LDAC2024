extends Node

@export_category("Settings")
@export var CAMERA_SENSITIVITY = 0.1 #deg 

#Scenes
var current_scene = null
enum SCENES {DEV, MAIN_MENU}
var dev_scene = load("res://dev/scenes/test_scene.tscn")
var main_menu_scene = load("res://dev/scenes/main_menu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	change_to_scene(SCENES.MAIN_MENU)
	pass # Replace with function body.


func change_to_scene(scene_id:SCENES):
	if current_scene != null: 
		current_scene.queue_free()
	match scene_id:
		SCENES.DEV:
			current_scene = dev_scene.instantiate()
			add_child(current_scene)
		SCENES.MAIN_MENU:
			current_scene = main_menu_scene.instantiate()
			add_child(current_scene)
		_:
			pass
