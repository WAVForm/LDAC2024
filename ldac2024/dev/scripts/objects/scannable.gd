extends Node3D

class_name Scannable

var item:Item = null

var scanned:bool = false
var original:bool = true

func scan():
	if item != null:
		scanned = true
		return item
	
func use():
	if item != null:
		return self if scanned else null
