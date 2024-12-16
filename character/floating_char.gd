extends CharacterBody2D
@export_enum("keyboard","controller") var control_type : int = 0
@export var health : Health
const SPEED = 300.0
const DASH = 1200.0
##how icy the floor is for stopping movement
const STOP_FACTOR = 4
var can_move : bool = true
var can_dash : bool = true
var dashing : bool = false
var max_dashes = 2
var current_dashes = 2
@export var dash_timer : Timer
@export var dash_recharge : Timer
@onready var inputManager : InputManager = $InputManager
@onready var sprite: Sprite2D = $"Sprite2D"

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
	direction = inputManager.moveDirection
	sprite.rotation = inputManager.lookDirection.angle() - PI/2
	if inputManager.leftTriggerPressed && can_dash:
		current_dashes -= 1
		dashing = true
		dash_timer.start()
		if dash_recharge.is_stopped():
			dash_recharge.start()
		print("left trigger moment")
	if dashing:
		direction = inputManager.lookDirection
		if direction:
			velocity.x = (direction.x * DASH) + (inputManager.moveDirection.x * SPEED)
			velocity.y = (direction.y * DASH) + (inputManager.moveDirection.y * SPEED)
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED/STOP_FACTOR)
			velocity.y = move_toward(velocity.y, 0, SPEED/STOP_FACTOR)
	else:
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


func _on_dash_timer_timeout() -> void:
	dashing = false


func _on_dash_recharge_timer_timeout() -> void:
	if current_dashes < max_dashes:
		current_dashes += 1
