extends PathFollow3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress_ratio +=delta *.1
	if progress_ratio >= 1: 
		progress_ratio = 0
	pass
