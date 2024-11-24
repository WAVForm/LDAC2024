extends Node

class_name Item

static var TEST = Item.new("Test Item", "this is a test", Vector3i(0,0,0), 0, "")

@export var title: String
@export var description: String
@export var coords: Vector3i
@export var truck: int
@export var image: Image

func _init(p_title:String, p_desc: String, p_coords: Vector3i, p_truck: int, p_imgpath: String) -> void:
	title = p_title
	description = p_desc
	coords = p_coords
	truck = p_truck
	image = Image.load_from_file(p_imgpath)
