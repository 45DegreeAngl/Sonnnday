extends Control

@onready var playerLabel1 = $'PlayerLabels/PlayerLabel1'
@onready var playerLabel2 = $'PlayerLabels/PlayerLabel2'
@onready var playerLabel3 = $'PlayerLabels/PlayerLabel3'
@onready var playerLabel4 = $'PlayerLabels/PlayerLabel4'

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for n in range(1, Globals.players.size()+1):
		var label = get_node("PlayerLabels/PlayerLabel"+str(n))
		label.visible = true
	
func _input(event: InputEvent) -> void:
	if(Input.is_action_pressed("a_p1")):
		if(not Globals.get_player_from_device(0)):
			Globals.players.append(player_data.create(0))
	if(Input.is_action_pressed("a_p2")):
		if(not Globals.get_player_from_device(1)):
			Globals.players.append(player_data.create(1))
	if(Input.is_action_pressed("a_p3")):
		if(not Globals.get_player_from_device(1)):
			Globals.players.append(player_data.create(1))
	if(Input.is_action_pressed("a_p4")):
		if(not Globals.get_player_from_device(1)):
			Globals.players.append(player_data.create(1))
