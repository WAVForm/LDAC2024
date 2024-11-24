extends Control

@onready var main_menu = $menu_container/items_container/main_menu_button
@onready var options = $menu_container/items_container/options_button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main_menu.pressed.connect(func(): WRAPPER.change_to_scene(WRAPPER.SCENES.MAIN_MENU))
	options.pressed.connect(func(): pass ) #toggle options ui
