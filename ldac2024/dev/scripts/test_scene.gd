extends Node3D

var input_limit_timer = Timer.new()
@onready var box_spawn = $box_spawn
var outline_material = load("res://materials/outline.tres")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_limit_timer.one_shot = true
	add_child(input_limit_timer)
	WRAPPER.add_nec_ui(WRAPPER.UIS.PLAYER)
	WRAPPER.new_order_in.connect(func(item):
		order_to_random_box(item)
	)
	pass # Replace with function body.

func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE and (input_limit_timer.is_stopped() || input_limit_timer.time_left <= 0):
		input_limit_timer.start(0.25)
		WRAPPER.toggle_ui_of_id(WRAPPER.UIS.PAUSE)
		WRAPPER.toggle_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func order_to_random_box(item:Item):
	item.truck = randi_range(1,6)
	var shelf = $shelves.get_children().pick_random() #pick random shelf
	var spot = str(randi_range(0,19)) + str(randi_range(0,1)) #pick random spot
	print(shelf.name)
	print(int(shelf.name.to_lower()[0])+1, (0 if int(shelf.name.to_lower()[1]) == 0 or int(shelf.name.to_lower()[1]) == 2 else 1)+1, int(spot.erase(spot.length() - 1))+1)
	item.coords = Vector3i(int(shelf.name.to_lower()[0])+1, (0 if int(shelf.name.to_lower()[1]) == 0 or int(shelf.name.to_lower()[1]) == 2 else 1)+1, int(spot.erase(spot.length() - 1))+1) #update coords
	var box = shelf.get_node("slots/"+spot).get_child(0)
	box.item = item #get first child (the box) and set item
	WRAPPER.boxes.append(box)
	box.get_node("MeshInstance3D").set_surface_override_material(0, outline_material)
	
	
