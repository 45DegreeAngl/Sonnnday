extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _input(event: InputEvent) -> void:
	if(Input.is_action_pressed("a_p1")):
		Globals.players.append(player_data.create(0))
	if(Input.is_action_pressed("a_p2")):
		Globals.players.append(player_data.create(1))
	if(Input.is_action_pressed("a_p3")):
		Globals.players.append(player_data.create(2))
	if(Input.is_action_pressed("a_p4")):
		Globals.players.append(player_data.create(3))
