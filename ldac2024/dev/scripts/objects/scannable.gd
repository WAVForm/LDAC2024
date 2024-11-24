extends Node3D

class_name Scannable

var outline_material = load("res://materials/outline.tres")

var item:Item = null
var time:Timer

var scanned:bool = false
var original:bool = true
var started: bool = false

func _ready():
	time = Timer.new()
	add_child(time)

func _process(delta: float) -> void:
	if item != null and not started:
		if original:
			outline(true)
		started = true
		time.one_shot = true
		time.start(randi_range(60,120)) #make random time between 1-2 minutes
		time.timeout.connect(func(): 
			WRAPPER.order_fail(self)
		)

func outline(b: bool):
	if b:
		get_node("MeshInstance3D").set_surface_override_material(0, outline_material)
	else:
		get_node("MeshInstance3D").set_surface_override_material(0, null)

func scan():
	if item != null:
		scanned = true
		return item
	
func use():
	if item != null:
		return self if scanned else null
