extends Control

@onready var fade = $fade
var fading = false


func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		fading = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fading:
		fade.color = fade.color.lerp(Color(Color.BLACK,1.0), delta) if fade.color.a < 0.9 else fade.color.lerp(Color(Color.BLACK,1.0), delta*10)
		
		if fade.color.is_equal_approx(Color.BLACK):
			WRAPPER.change_to_scene(WRAPPER.SCENES.MAIN_MENU)
