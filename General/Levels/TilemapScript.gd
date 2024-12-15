extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var player_scene = load("res://character/player.tscn")
	var player_instance = player_scene.instantiate()
	add_child(player_instance)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
