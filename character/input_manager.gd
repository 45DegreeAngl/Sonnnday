class_name InputManager

extends Node

@export var playerIndex : int = -1
@export var deviceIndex : int = -1
var moveDirection: Vector2 = Vector2.ZERO
var lookDirection: Vector2 = Vector2.ZERO
var aPressed: bool = false
var bPressed: bool = false

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
	var move_horz: float = Input.get_action_strength("move_right_p" + str(deviceIndex)) - Input.get_action_strength("move_left_p" + str(deviceIndex))
	var move_vert: float = Input.get_action_strength("move_down_p" + str(deviceIndex)) - Input.get_action_strength("move_up_p" + str(deviceIndex))
	moveDirection = Vector2(move_horz, move_vert).normalized()
	
	var look_horz: float = Input.get_action_strength("right_stick_right_p" + str(deviceIndex)) - Input.get_action_strength("right_stick_left_p" + str(deviceIndex))
	var look_vert: float = Input.get_action_strength("right_stick_up_p" + str(deviceIndex)) - Input.get_action_strength("right_stick_down_p" + str(deviceIndex))
	lookDirection = Vector2(look_horz, look_vert).normalized()
	
	aPressed = Input.is_action_pressed("a_p" + str(deviceIndex))
	bPressed = Input.is_action_pressed("b_p" + str(deviceIndex))
