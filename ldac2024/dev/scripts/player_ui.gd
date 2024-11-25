extends Control

@onready var timer_text = $timer_container/Label
var blink_timer = Timer.new()
var blinking = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_child(blink_timer)
	blink_timer.start(0.5)
	blink_timer.timeout.connect(func(): if blinking : timer_text.visible = not timer_text.visible)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if WRAPPER.time.time_left <= 60:
		timer_text.add_theme_color_override("font_color", Color.RED)
		blinking = true
	else:
		timer_text.add_theme_color_override("font_color", Color.WHITE)
		blinking = false
	
	timer_text.text = "0"+str(int(WRAPPER.time.time_left)/60) if WRAPPER.time.time_left/60 < 10 else str(int(WRAPPER.time.time_left)/60)
	timer_text.text += ":"
	timer_text.text += "0"+str(int(WRAPPER.time.time_left)%60) if int(WRAPPER.time.time_left)%60 < 10 else str(int(WRAPPER.time.time_left)%60)
