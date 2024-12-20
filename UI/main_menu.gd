extends Control

@export var startButton : Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startButton.pressed.connect(on_start_pressed)

func on_start_pressed() -> void:
	$'/root/SceneManager'.change_scenes("powerselect")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for n in range(1, Globals.players.size()+1):
		var label = get_node("PlayerLabels/PlayerLabel"+str(n))
		label.visible = true
	
func _input(_event: InputEvent) -> void:
	if(Input.is_action_pressed("a_KB")):
		if(not Globals.get_player_from_device(Globals.InputDevice.KEYBOARD)):
			var playerdata = player_data.create(-1)
			playerdata.isKeyboardPlayer = true
			Globals.players.append(playerdata)
	if(Input.is_action_pressed("a_p1")):
		if(not Globals.get_player_from_device(Globals.InputDevice.CONTROLLER0)):
			Globals.players.append(player_data.create(0))
	if(Input.is_action_pressed("a_p2")):
		if(not Globals.get_player_from_device(Globals.InputDevice.CONTROLLER1)):
			Globals.players.append(player_data.create(1))
	if(Input.is_action_pressed("a_p3")):
		if(not Globals.get_player_from_device(Globals.InputDevice.CONTROLLER2)):
			Globals.players.append(player_data.create(2))
	if(Input.is_action_pressed("a_p4")):
		if(not Globals.get_player_from_device(Globals.InputDevice.CONTROLLER3)):
			Globals.players.append(player_data.create(3))
