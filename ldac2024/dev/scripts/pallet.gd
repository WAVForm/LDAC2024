extends Area3D

@export var truck: int
var items:Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(func(body):
		if body is Scannable:
			body.visible = false
			body.freeze = true
			place_on(body as Scannable)
	)
	pass # Replace with function body.

func place_on(s:Scannable):
	items.append(s)
