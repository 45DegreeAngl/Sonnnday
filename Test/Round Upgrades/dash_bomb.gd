extends RoundUpgrades
class_name DashBomb;
@export var explosion_shape : CollisionShape2D
var dash_box
var dash_box_instance
var exploded = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func level_start() -> void:
	active = true
	player = Globals.get_player_from_index(get_parent().number).player
	player.dash_timer.timeout.connect(dash_complete)
	dash_box = load("res://General/hitbox.tscn")
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if exploded == true:
		explosion_shape.reparent(self)
		dash_box_instance.queue_free()

func dash_complete():
	dash_box_instance = dash_box.instantiate()
	player.add_child(dash_box_instance)
	dash_box_instance.global_position = player.global_position
	dash_box_instance.dmg = 25
	explosion_shape.global_position = player.global_position
	explosion_shape.reparent(dash_box_instance)
