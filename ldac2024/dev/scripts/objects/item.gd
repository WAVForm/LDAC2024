extends Node

class_name Item

var title: String
var description: String
var price: float
var category: CATEGORY
enum CATEGORY{NONE}

func _init(t_p:String, d_p:String, p_p:float, c_p:CATEGORY) -> void:
	title = t_p
	description = d_p
	price = p_p
	category = c_p
