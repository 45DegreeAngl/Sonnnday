extends Node

class_name globals

var players : Array

#takes player num as 1-4
func get_player_from_device(deviceIdx: int) -> player_data:
	for player in players:
		if player.deviceIndex == deviceIdx:
			return player
	return null
	
func get_player_from_index(playerIndex: int) -> player_data:
	if playerIndex > players.size():
		return null
	return players[playerIndex-1]
