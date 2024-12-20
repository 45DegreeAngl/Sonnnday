class_name InputManager

extends Node

@export var playerIndex : int = -1
@export var deviceIndex : int = -1
var moveDirection: Vector2 = Vector2.ZERO
var lookDirection: Vector2 = Vector2.ZERO
var aPressed: bool = false
var bPressed: bool = false
var leftTriggerJustPressed: bool = false
var rightTriggerJustPressed : bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0,Globals.players.size()):
		#if this player data is connected to this player instance
		if Globals.players[i].player == get_parent():
			playerIndex = i+1
			deviceIndex = Globals.players[i].deviceIndex+1
	if playerIndex == -1:
		push_warning("This player wasn't assigned an input device!")

func _process(_delta: float) -> void:
	moveDirection = joy_pad_LStick
	lookDirection = joy_pad_RStick
	#how to apply mouse inputs :<
	if Globals.get_player_from_index(playerIndex).isKeyboardPlayer:
		leftTriggerJustPressed = Input.is_action_just_pressed("right_trigger_kb")
		rightTriggerJustPressed = Input.is_action_just_pressed("left_trigger_kb")
	else:
		leftTriggerJustPressed = Input.is_action_just_pressed("left_trigger_p"+str(deviceIndex))
		rightTriggerJustPressed = Input.is_action_just_pressed("right_trigger_p"+str(deviceIndex))

var joy_pad_LStick:Vector2 = Vector2.ZERO
var joy_pad_RStick:Vector2 = Vector2.ZERO
var joy_pad_LTrigger:float = 0
var joy_pad_RTrigger:float = 0

func send_event(event:InputEvent):
	if event is InputEventJoypadMotion:
		match event.axis:
			0:
				joy_pad_LStick.x = event.axis_value
			1:
				joy_pad_LStick.y = event.axis_value
			2:
				joy_pad_RStick.x = event.axis_value
			3:
				joy_pad_RStick.y = event.axis_value
			4:#left trigger
				joy_pad_LTrigger = event.axis_value
			5:#right trigger
				joy_pad_LTrigger = event.axis_value

	elif event is InputEventJoypadButton:
		var temp_bool = event.is_pressed()
		match event.button_index:
			JOY_BUTTON_A:
				aPressed = temp_bool
			JOY_BUTTON_B:
				bPressed = temp_bool
	elif event is InputEventKey:
		joy_pad_LStick = Input.get_vector("move_left_KB", "move_right_KB", "move_up_KB", "move_down_KB").normalized()
	elif event is InputEventMouseMotion:
		joy_pad_RStick = (get_parent().get_global_mouse_position() - get_parent().global_position).normalized()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if(Globals.players[playerIndex-1].isKeyboardPlayer):
		#var move_horz: float = Input.get_action_strength("move_right_KB") - Input.get_action_strength("move_left_KB")
		#var move_vert: float = Input.get_action_strength("move_down_KB") - Input.get_action_strength("move_up_KB")
		#moveDirection = Vector2(move_horz, move_vert).normalized()
		#
		#lookDirection = (get_parent().get_global_mouse_position() - get_parent().global_position).normalized()
	#
		#aPressed = Input.is_action_pressed("a_KB")
		#bPressed = Input.is_action_pressed("b_KB")
	#else:
		#var move_horz: float = Input.get_action_strength("move_right_p" + str(deviceIndex)) - Input.get_action_strength("move_left_p" + str(deviceIndex))
		#var move_vert: float = Input.get_action_strength("move_down_p" + str(deviceIndex)) - Input.get_action_strength("move_up_p" + str(deviceIndex))
		#moveDirection = Vector2(move_horz, move_vert).normalized()
	#
		#var look_horz: float = Input.get_action_strength("right_stick_right_p" + str(deviceIndex)) - Input.get_action_strength("right_stick_left_p" + str(deviceIndex))
		#var look_vert: float = Input.get_action_strength("right_stick_down_p" + str(deviceIndex)) - Input.get_action_strength("right_stick_up_p" + str(deviceIndex))
		#var desiredLookDirection = Vector2(look_horz, look_vert).normalized()
		#if desiredLookDirection != Vector2.ZERO:
			#lookDirection = desiredLookDirection
	#
		#aPressed = Input.is_action_pressed("a_p" + str(deviceIndex))
		#bPressed = Input.is_action_pressed("b_p" + str(deviceIndex))
		#leftTriggerPressed = Input.is_action_just_pressed("left_trigger_p"+str(deviceIndex))
