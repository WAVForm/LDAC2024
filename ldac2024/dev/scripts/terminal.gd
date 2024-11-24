extends StaticBody3D

@onready var with_scanner = $"computer with scanner"
@onready var without_scanner = $"computer/computter "

func toggle_scanner():
	without_scanner.visible = not without_scanner.visible
	with_scanner.visible = not with_scanner.visible

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func use():
	WRAPPER.add_sub_ui(WRAPPER.UIS.TERMINAL)
	
