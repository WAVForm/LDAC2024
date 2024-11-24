extends Control

class_name ToolBarItem

static var item_prefab = load("res://dev/scenes/uis/toolbar_item.tscn")

static func new_item(item_text):
	var i = item_prefab.instantiate()
	i.get_node("text").text = item_text
	i.fit_text()
	return i

func fit_text():
	self.minimum_size_changed.emit()
	var t = get_node("text")
	var bg = get_node("bg")
	print(t.offset_bottom-t.offset_top, bg.offset_bottom-bg.offset_top)
	while t.size.y > bg.size.y:
		print("reduced")
		t.add_theme_font_size_override("normal_font_size", t.get_theme_font_size("normal_font_size")-1)



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
