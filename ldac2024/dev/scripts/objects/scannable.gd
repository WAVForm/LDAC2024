extends Node3D

class_name Scannable

@export var item:Item = Item.new("Test", "This is a test", Vector3i(0,0,0), 0, "")

func scan():
	return item
	
func use():
	return self
