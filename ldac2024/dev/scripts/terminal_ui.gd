extends Control

@onready var close = $close
var order_prefab = load("res://dev/scenes/uis/terminal/terminal_order.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if not WRAPPER.boxes.is_empty():
		for box in WRAPPER.boxes:
			add_order(box.item)
	close.pressed.connect(func(): if WRAPPER.ui_state_list.back() == WRAPPER.UIS.TERMINAL: 
		WRAPPER.prev_sub_ui()
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	)
	WRAPPER.new_order_in.connect(func(item):
		add_order(item)
	)
	pass # Replace with function body.

func add_order(item):
	var o = order_prefab.instantiate()
	o.initialize(item)
	($orders/scroll/orders_container).add_child(o)
	o.clicked.connect(func():
		WRAPPER.add_sub_ui(WRAPPER.UIS.TERMINAL_ITEM)
		var item_window = WRAPPER.ui_node_list.back()
		item_window.initialize(item)
	)
