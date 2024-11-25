extends Area3D

@export var truck: int
var items:Array

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.body_entered.connect(func(body):
		if body is Scannable and body.item != null and body.item.truck == truck and body.get_parent().get_parent().get_parent() != self and items.size() < 49:
			place_on(body as Scannable)
	)
	pass # Replace with function body.

func place_on(s:Scannable):
	for i in range(get_node("points").get_child_count()):
		var n = get_node("points/0"+str(i)) if i < 10 else get_node("points/"+str(i))
		if n.get_child_count() == 0:
			s.collision_layer = 2
			s.collision_mask = 2
			items.append(s)
			s.get_parent().remove_child(s)
			n.add_child(s)
			s.process_mode = Node.PROCESS_MODE_DISABLED
			s.global_position = n.global_position
			
			WRAPPER.order_done(s)
			break
