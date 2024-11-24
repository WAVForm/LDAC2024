extends Node3D

var boxes:Array = [load("res://dev/scenes/gameobjects/models/box_1.tscn")
,load("res://dev/scenes/gameobjects/models/box_2.tscn")
,load("res://dev/scenes/gameobjects/models/box_3.tscn")
,load("res://dev/scenes/gameobjects/models/box_4.tscn")
,load("res://dev/scenes/gameobjects/models/box_5.tscn")
,load("res://dev/scenes/gameobjects/models/box_6.tscn")
,load("res://dev/scenes/gameobjects/models/box_7.tscn")
,load("res://dev/scenes/gameobjects/models/box_8.tscn")
,load("res://dev/scenes/gameobjects/models/box_9.tscn")
,load("res://dev/scenes/gameobjects/models/box_10.tscn")
,load("res://dev/scenes/gameobjects/models/box_11.tscn")
,load("res://dev/scenes/gameobjects/models/box_12.tscn")
,load("res://dev/scenes/gameobjects/models/box_13.tscn")
,load("res://dev/scenes/gameobjects/models/box_14.tscn")
,load("res://dev/scenes/gameobjects/models/box_15.tscn")
,load("res://dev/scenes/gameobjects/models/box_16.tscn")
,load("res://dev/scenes/gameobjects/models/box_17.tscn")]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(20):
		for j in range(2):
			var b = boxes.pick_random().instantiate()
			b.freeze = true
			self.get_node("slots/"+str(i)+str(j)).add_child(b)
	pass # Replace with function body.
