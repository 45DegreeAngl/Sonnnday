extends Node2D

class_name globals
enum InputDevice {KEYBOARD, CONTROLLER0, CONTROLLER1, CONTROLLER2, CONTROLLER3}

var players : Array

func get_player_from_instance(player : CharacterBody2D) -> player_data:
	for Player_data in players:
		if Player_data.player == player:
			return Player_data
	return null

#gets player from input device
func get_player_from_device(deviceIdx: InputDevice) -> player_data:
	for player in players:
		if player.isKeyboardPlayer && deviceIdx == InputDevice.KEYBOARD:
			return player
		if player.deviceIndex == 0 && deviceIdx == InputDevice.CONTROLLER0:
			return player
		if player.deviceIndex == 1 && deviceIdx == InputDevice.CONTROLLER1:
			return player
		if player.deviceIndex == 2 && deviceIdx == InputDevice.CONTROLLER2:
			return player
		if player.deviceIndex == 3 && deviceIdx == InputDevice.CONTROLLER3:
			return player
	return null

func _input(event: InputEvent) -> void:
	if event is InputEventKey || event is InputEventMouseMotion:
		#send event to the correct player
		var potential_player = get_player_from_device(InputDevice.KEYBOARD) #get keyboard player
		if potential_player!=null:
			if potential_player.player:
					potential_player.player.inputManager.send_event(event)

	elif event is InputEventJoypadButton || event is InputEventJoypadMotion:
		#send event to the correct player
		var potential_player = get_player_from_device(event.device+1)
		if potential_player!=null:
			if potential_player.player:
				potential_player.player.inputManager.send_event(event)

func get_player_from_index(playerIndex: int) -> player_data:
	if playerIndex > players.size():
		return null
	return players[playerIndex-1]
