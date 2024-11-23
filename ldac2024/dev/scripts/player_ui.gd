extends Control

@onready var toolbar = $toolbar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var e = ToolBarItem.new_item("Empty")
	toolbar.add_child(e)
	var s = ToolBarItem.new_item("Scanner")
	toolbar.add_child(s)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
