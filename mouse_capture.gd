extends Node
##captures mouse movement in this script in case we want to branch this functionality outwards
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event: InputEvent) -> void:
	if !is_multiplayer_authority():
		return
	if event is InputEventKey and !event.is_echo() and event.is_pressed():
		match(event.keycode):
			KEY_ESCAPE:##in case you want to put keybinds into your
				toggle_mouse_CAPVIS()
	elif event is InputEventJoypadButton and !event.is_echo() and event.is_pressed():
		match(event.button_index):
			JOY_BUTTON_START:
				toggle_mouse_CAPVIS()

func toggle_mouse_CAPVIS():
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
