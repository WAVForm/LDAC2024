extends Control

@onready var timer_text = $timer_container/Label

var blinking = false
var blink_timeout = 1.0 #second
var blink_time = 0.0 #seconds

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if WRAPPER.time.time_left <= 60:
		timer_text.add_theme_color_override("font_color", Color.RED)
		blinking = true
	else:
		timer_text.add_theme_color_override("font_color", Color.WHITE)
		blinking = false
	
	if WRAPPER.time.time_left/60 < 10:
		timer_text.text = "0"+str(int(WRAPPER.time.time_left)/60) + ":" + str(int(WRAPPER.time.time_left)%60)
	else:
		timer_text.text = str(WRAPPER.time.time_left/60) + ":" + (WRAPPER.time.time_left%60)
	
	if blinking:
		if blink_time >= blink_timeout:
			timer_text.visible = not timer_text.visible
		else:
			blink_time += delta
