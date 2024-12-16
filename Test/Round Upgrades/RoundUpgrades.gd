extends Node
class_name RoundUpgrades
var target
var damage
var level
var upgrade_id
var player
@export var active : bool
@export var picked : bool

func level_start() -> void:
	active = true
	player = Globals.get_player_from_index(get_parent().number).player
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func when_picked() -> void:
	level = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
