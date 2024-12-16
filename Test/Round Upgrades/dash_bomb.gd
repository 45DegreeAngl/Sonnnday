extends RoundUpgrades
class_name DashBomb;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func level_start() -> void:
	active = true
	player = Globals.get_player_from_index(get_parent().number).player
	player.dash_timer.timout.connect(dash_complete)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func dash_complete():
	var dash_box = load("res://Test/hitbox.gd")
	var dash_box_instance = dash_box.instantiate()
	player.add_child(dash_box_instance)
	dash_box_instance.dmg = 25
	get_child(0).reparent(dash_box_instance)
