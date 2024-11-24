extends Control

func initialize(item:Item):
	$left_side_container/image.texture = ImageTexture.create_from_image(item.image)
	$right_side_container/coordinate_container/coordinate_body.text = "(Row: " + str(item.coords.x) + ", Col: " + str(item.coords.y) + ", Shelf: " + str(item.coords.z) + ")" 
	$right_side_container/description_container/description_body.text = item.description
	$right_side_container/title_container/title.text = item.title
	$right_side_container/truck_container/truck_image/Label.text = str(item.truck)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$exit.pressed.connect(func(): WRAPPER.prev_sub_ui())
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
