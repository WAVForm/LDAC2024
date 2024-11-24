extends Node3D

class_name Scannable

var item:Item

var scanned:bool = false

func scan():
	scanned = true
	return item
	
func use():
	return self if scanned else null
