extends Control

@onready var title = $order_container/title
@onready var coords = $order_container/coords

signal clicked

func initialize(item):
	self.ready.connect(func():
		title.text = item.title
		coords.text = "(" + str(item.coords.x) + "," + str(item.coords.y) + "," + str(item.coords.z)+ ")"
	)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1 and WRAPPER.ui_state_list.back() != WRAPPER.UIS.TERMINAL_ITEM:
		if event.position.x >= self.get_global_transform_with_canvas().origin.x && event.position.x <= (self.get_global_transform_with_canvas().origin + self.size).x && event.position.y >= self.get_global_transform_with_canvas().origin.y && event.position.y <= (self.get_global_transform_with_canvas().origin + self.size).y:
			clicked.emit()
