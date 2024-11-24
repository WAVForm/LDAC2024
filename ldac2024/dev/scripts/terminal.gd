extends StaticBody3D

@onready var notif = $notif

func _ready():
	WRAPPER.new_order_in.connect(func(item):
		notif.visible = true
	)

func use():
	WRAPPER.add_sub_ui(WRAPPER.UIS.TERMINAL)
	notif.visible = false
