extends Node3D

var using = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if using:
		var l = $laser as SpotLight3D
		l.light_energy = 1
	else:
		var l = $laser as SpotLight3D
		l.light_energy = 0.1
