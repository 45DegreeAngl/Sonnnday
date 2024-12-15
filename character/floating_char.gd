extends CharacterBody2D
@export_enum("keyboard","controller") var control_type : int = 0
const SPEED = 300.0
##how icy the floor is for stopping movement
const STOP_FACTOR = 4
var can_move : bool = true
@onready var inputManager : InputManager = $InputManager


func _physics_process(_delta: float) -> void:
	if !is_multiplayer_authority():
		return
	update_can_move()
	if !can_move: #if cant move, slow character down and stop input
		velocity.x = move_toward(velocity.x, 0, SPEED/STOP_FACTOR)
		velocity.y = move_toward(velocity.y, 0, SPEED/STOP_FACTOR)
		move_and_slide()
		return
	# Get the input direction and handle the movement/deceleration.
	var direction : Vector2 
	#match control_type:
		#0:
			#direction = Input.get_vector("A", "D", "W", "S")
		#1:
			#direction = joy_pad_LStick
	#direction = direction.normalized()
	direction = inputManager.moveDirection
	if direction:
		velocity.x = direction.x * SPEED
		velocity.y = direction.y * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED/STOP_FACTOR)
		velocity.y = move_toward(velocity.y, 0, SPEED/STOP_FACTOR)

	move_and_slide()

##updates the can_move value to the mouse captured
func update_can_move():
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		can_move = true
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE

var joy_pad_LStick:Vector2 = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if event is InputEventJoypadMotion:
		match event.axis:
			0:
				joy_pad_LStick.x = event.axis_value
			1:
				joy_pad_LStick.y = event.axis_value
