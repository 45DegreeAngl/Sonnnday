extends Node2D

#called before ready of children
func _enter_tree() -> void:
	for i in range(0, Globals.players.size()):
		var player_scene = load("res://character/player.tscn")
		var player_instance = player_scene.instantiate()
		player_instance.global_position = Vector2(i*64,0)
		
		add_child(player_instance)
		Globals.players[i].player = player_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for playerAbilities in Globals.get_children():
		for playerAbility in playerAbilities.get_children():
			playerAbility.level_start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
