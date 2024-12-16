class_name InputManager

extends Node

@export var playerIndex : int = -1
@export var deviceIndex : int = -1
var moveDirection: Vector2 = Vector2.ZERO
var lookDirection: Vector2 = Vector2.ZERO
var aPressed: bool = false
var bPressed: bool = false
var leftTriggerPressed: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in range(0,Globals.players.size()):
		#if this player data is connected to this player instance
		if Globals.players[i].player == get_parent():
			playerIndex = i+1
			deviceIndex = Globals.players[i].deviceIndex+1
	if playerIndex == -1:
		push_warning("This player wasn't assigned an input device!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if(Globals.players[playerIndex-1].isKeyboardPlayer):
		var move_horz: float = Input.get_action_strength("move_right_KB") - Input.get_action_strength("move_left_KB")
		var move_vert: float = Input.get_action_strength("move_down_KB") - Input.get_action_strength("move_up_KB")
		moveDirection = Vector2(move_horz, move_vert).normalized()
		
		lookDirection = (get_parent().get_global_mouse_position() - get_parent().global_position).normalized()
	
		aPressed = Input.is_action_pressed("a_KB")
		bPressed = Input.is_action_pressed("b_KB")
	else:
		moveDirection = Input.get_vector("move_left_p" + str(deviceIndex), "move_right_p" + str(deviceIndex), "move_up_p" + str(deviceIndex), "move_down_p" + str(deviceIndex)).normalized()
	
		var desiredLookDirection = Input.get_vector("right_stick_left_p" + str(deviceIndex), "right_stick_right_p" + str(deviceIndex), "right_stick_up_p" + str(deviceIndex), "right_stick_down_p" + str(deviceIndex)).normalized()
		if desiredLookDirection != Vector2.ZERO:
			lookDirection = desiredLookDirection
	
		aPressed = Input.is_action_pressed("a_p" + str(deviceIndex))
		bPressed = Input.is_action_pressed("b_p" + str(deviceIndex))
		leftTriggerPressed = Input.is_action_just_pressed("left_trigger_p"+str(deviceIndex))
