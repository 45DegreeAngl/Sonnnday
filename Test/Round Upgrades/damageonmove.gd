extends Node
class_name DamageOnMove;
@export var player : CharacterBody2D
var target
var damage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_down_p1") || Input.is_action_just_pressed("move_up_p1"):
		target = Globals.get_player_from_device(0).player
