extends Node3D

var order_timer = Timer.new()
var input_limit_timer = Timer.new()
@onready var box_spawn = $box_spawn

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	input_limit_timer.one_shot = true
	add_child(input_limit_timer)
	add_child(order_timer)
	order_timer.start(randi_range(30,60))
	order_timer.timeout.connect(func():
		var item = Item.Items.pick_random()
		order_to_random_box(item)
	)
	WRAPPER.add_nec_ui(WRAPPER.UIS.PLAYER)
	self.add_child(WRAPPER.time)
	WRAPPER.time.start(120) #start 5 minute timer
	WRAPPER.time.timeout.connect(func(): WRAPPER.change_to_scene(WRAPPER.SCENES.END))

func _input(event):
	if event is InputEventKey and event.keycode == KEY_ESCAPE and (input_limit_timer.is_stopped() || input_limit_timer.time_left <= 0):
		input_limit_timer.start(0.25)
		WRAPPER.add_sub_ui(WRAPPER.UIS.PAUSE)
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		get_tree().paused = true
	if event.is_action_pressed("ui_page_up") and OS.is_debug_build():
		order_timer.timeout.emit()

func order_to_random_box(item:Item):
	item.truck = randi_range(1,4)
	var shelf = $shelves.get_children().pick_random() #pick random shelf
	var spot = str(randi_range(0,19)) + str(randi_range(0,1)) #pick random spot
	item.coords = Vector3i(int(shelf.name.to_lower()[0])+1, (0 if int(shelf.name.to_lower()[1]) == 0 or int(shelf.name.to_lower()[1]) == 2 else 1)+1, int(spot.erase(spot.length() - 1))+1) #update coords
	var box = shelf.get_node("slots/"+spot).get_child(0)
	if box.item != null:
		order_to_random_box(item)
		return
	box.item = item #get first child (the box) and set item
	WRAPPER.boxes.append(box)
	WRAPPER.new_order_in.emit(box)
	
	
