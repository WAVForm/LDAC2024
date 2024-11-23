extends Node3D

class_name Scannable

@export var item:Item = Item.new("Test", "This is a test", 0.00, Item.CATEGORY.NONE)

func scan():
	return item
	
func use():
	return self
