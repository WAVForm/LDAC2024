extends CharacterBody3D

@onready var pov:Node3D = $pov

const SPEED_GAIN = 0.1
const SPEED_LOSS = 0.25
const MAX_SPEED = 2.0
const JUMP_POWER = 2.0

var current_speed = 0.0
@onready var ray = pov.get_node("selection_ray") as RayCast3D
var scan_timer:Timer
var can_scan = false

var packages:Array

func _input(event):
	if WRAPPER.is_ui_open() == true:
		return
	
	if event is InputEventMouseMotion:
		turn_pov(-event.relative)
		
	elif event is InputEventMouseButton:
		if event.pressed:
			scan_timer.start(0.5)
			pov.using = true
		else:
			pov.using = false
			can_scan = false
	
	elif event.is_action_pressed("use"):
		var r = pov.get_node("selection_ray") as RayCast3D #attempt selecting interactable
		if r.is_colliding() and r.get_collider().has_method("use"):
			var returned = r.get_collider().use()
			if returned != null and returned is Scannable:
				place_in_inventory(returned)
			

func _ready():
	scan_timer = Timer.new()
	scan_timer.one_shot = true
	add_child(scan_timer)
	scan_timer.timeout.connect(func(): can_scan = true)
	

func _process(_delta):
	if can_scan and ray.is_colliding() and ray.get_collider().has_method("scan"):
		print(ray.get_collider().scan())
		var e:= InputEventMouseButton.new()
		e.pressed = false
		_input(e)

func _physics_process(delta: float) -> void:
	if WRAPPER.is_ui_open() == true:
		return
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	move()

func move():
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_POWER
		print("jumped")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	#calc current speed
	if (input_dir.x == 0 && input_dir.y == 0): #user stopped input?
		current_speed = 0.0
	else:
		current_speed = current_speed if current_speed >= MAX_SPEED else current_speed+SPEED_GAIN
	
	var direction := (pov.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:#player is moving
		velocity.x = direction.x * current_speed
		velocity.z = direction.z * current_speed
	else: #player slows down
		velocity.x = move_toward(velocity.x, 0, SPEED_LOSS)
		velocity.z = move_toward(velocity.z, 0, SPEED_LOSS)

	move_and_slide()
	
func turn_pov(input_dir:Vector2):
	#rotation.x is up n down, rotation.y is left n right
	if not ((pov.rotation_degrees.x > 90  && input_dir.y > 0) || (pov.rotation_degrees.x < -90 && input_dir.y < 0)):
		pov.rotation_degrees.x += input_dir.y * WRAPPER.CAMERA_SENSITIVITY
		pov.rotation_degrees.y += input_dir.x * WRAPPER.CAMERA_SENSITIVITY
		
func place_in_inventory(p):
	packages.append(p)
	p.visible = false
	
func take_out_inventory(p):
	p.position = pov.position
	p.visible = true
	packages.erase(p)
