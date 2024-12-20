class_name player_data

var deviceIndex: int
var points: int
var total_kills: int
var total_deaths: int
var player : CharacterBody2D
var isKeyboardPlayer: bool
var isKill : bool

static func create(deviceIndex: int) -> player_data:
	var instance = player_data.new()
	instance.deviceIndex = deviceIndex
	instance.points = 0
	instance.total_kills = 0
	instance.total_deaths = 0
	instance.isKeyboardPlayer = false
	instance.isKill = true
	return instance
