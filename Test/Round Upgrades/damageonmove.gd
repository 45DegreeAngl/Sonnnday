extends RoundUpgrades
class_name DamageOnMove;
var timers = [Timer.new(),Timer.new(),Timer.new(),Timer.new()] #damage timers for each player

func _init() -> void:
	upgrade_id = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("yipee")
	damage = 15
	for timer in timers:
		timer.wait_time = 1
		timer.one_shot = true
		timer.start()
func on_level_up() -> void:
	level += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#checks if player one has moved then damages them
	if active == true:
		if Input.is_action_just_pressed("move_down_p1") || Input.is_action_just_pressed("move_up_p1") || Input.is_action_just_pressed("move_left_p1") || Input.is_action_just_pressed("move_right_p1"):
			target = Globals.get_player_from_index(1).player
			if timers[0].time_left == 0:
				print("ouch")
				timers[0].start()
				if target:
					target.health.direct_damage(damage * level)
			#checks if player two has moved then damages them
		if Input.is_action_just_pressed("move_down_p2") || Input.is_action_just_pressed("move_up_p2") || Input.is_action_just_pressed("move_left_p2") || Input.is_action_just_pressed("move_right_p2"):
			target = Globals.get_player_from_index(2).player
			if timers[0].time_left == 0:
				print("ouch")
				timers[0].start()
				if target:
					target.health.direct_damage(damage * level)
				#checks if player three has moved then damages them
		if Input.is_action_just_pressed("move_down_p3") || Input.is_action_just_pressed("move_up_p3") || Input.is_action_just_pressed("move_left_p3") || Input.is_action_just_pressed("move_right_p3"):
			target = Globals.get_player_from_index(3).player
			if timers[0].time_left == 0:
				print("ouch")
				timers[0].start()
				if target:
					target.health.direct_damage(damage * level)
				#checks if player four has moved then damages them
		if Input.is_action_just_pressed("move_down_p4") || Input.is_action_just_pressed("move_up_p4") || Input.is_action_just_pressed("move_left_p4") || Input.is_action_just_pressed("move_right_p4"):
			target = Globals.get_player_from_index(4).player
			if timers[0].time_left == 0:
				print("ouch")
				timers[0].start()
				if target:
					target.health.direct_damage(damage * level)
