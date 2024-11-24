extends Control

@onready var title = $order_container/title
@onready var coords = $order_container/coords
@onready var time = $order_container/time

var box: Scannable
signal clicked

func initialize(s:Scannable):
	self.ready.connect(func():
		box = s
		title.text = s.item.title
		coords.text = "(" + str(s.item.coords.x) + "," + str(s.item.coords.y) + "," + str(s.item.coords.z)+ ")"
	)

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == 1 and WRAPPER.ui_state_list.back() != WRAPPER.UIS.TERMINAL_ITEM:
		if event.position.x >= self.get_global_transform_with_canvas().origin.x && event.position.x <= (self.get_global_transform_with_canvas().origin + self.size).x && event.position.y >= self.get_global_transform_with_canvas().origin.y && event.position.y <= (self.get_global_transform_with_canvas().origin + self.size).y:
			clicked.emit()

func _process(delta: float) -> void:
	if box.time.time_left <= 60:
		time.add_theme_color_override("font_color", Color.RED)
	else:
		time.add_theme_color_override("font_color", Color.WHITE)
	
	time.text = "0"+str(int(box.time.time_left)/60) if box.time.time_left/60 < 10 else str(int(box.time.time_left)/60)
	time.text += ":"
	time.text += "0"+str(int(box.time.time_left)%60) if int(box.time.time_left)%60 < 10 else str(int(box.time.time_left)%60)
