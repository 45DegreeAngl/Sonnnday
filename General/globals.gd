extends Node

class_name globals
enum InputDevice {KEYBOARD, CONTROLLER0, CONTROLLER1, CONTROLLER2, CONTROLLER3}

var players : Array

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
	
func get_player_from_index(playerIndex: int) -> player_data:
	if playerIndex > players.size():
		return null
	return players[playerIndex-1]
