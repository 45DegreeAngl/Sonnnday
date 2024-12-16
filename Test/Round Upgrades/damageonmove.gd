extends RoundUpgrades
class_name DamageOnMove;
@export var player : CharacterBody2D
var timers = [Timer.new,Timer.new,Timer.new,Timer.new] #damage timers for each player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	damage = 15
	for timer in timers:
		timer.wait_time = 1
		timer.one_shot = true
		timer.start()
	player = get_parent()

func on_level_up() -> void:
	level += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("move_down_p1") || Input.is_action_just_pressed("move_up_p1") || Input.is_action_just_pressed("move_left_p1") || Input.is_action_just_pressed("move_right_p1"):
		target = Globals.get_player_from_device(0).player
		if timers[0].time_left == 0:
			timers[0].start()
			player.health.direct_damage(damage * level)
