extends Control
var current_player
var possible_powers
var one_selected #checks if at least one power is currently selected
@export var power1_button : Button
@export var power2_button : Button
@export var power3_button : Button
@export var confirm : Button
var power1
var power2
var power3
var selected_power
var power_holder_instance

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for playerAbilities in Globals.get_children():
		for playerAbility in playerAbilities.get_children():
			playerAbility.active = true
	one_selected = false
	current_player = 1
	var power_holder = load("res://Test/Round Upgrades/round_upgrades.tscn")
	power_holder_instance = power_holder.instantiate()
	possible_powers = power_holder_instance.get_children()
	random_powers()

func random_powers() -> void:
	power1 = power_holder_instance.get_child(0)
	power2 = power_holder_instance.get_child(1)
	power3 = power_holder_instance.get_child(0)



func _on_power_1_toggled(toggled_on: bool) -> void:
	selected_power = power1
	confirm.disabled = false


func _on_power_2_toggled(toggled_on: bool) -> void:
	selected_power = power2
	confirm.disabled = false


func _on_power_3_toggled(toggled_on: bool) -> void:
	selected_power = power3
	confirm.disabled = false


func _on_confirm_pressed() -> void:
	var power_is_upgrade = false
	for i in Globals.get_child(current_player-1).get_children():
		if i.upgrade_id == selected_power.upgrade_id:
			i.level += 1
			power_is_upgrade = true
	if power_is_upgrade == false:
		var power_dupe = selected_power.duplicate()
		power_dupe.level = 1
		Globals.get_child(current_player-1).add_child(power_dupe)
		#power_dupe.reparent(Globals.get_child(current_player-1))
	if current_player != Globals.players.size():
		power1_button.button_pressed = false
		power2_button.button_pressed = false
		power3_button.button_pressed = false
		current_player += 1
		random_powers()
	else:
		$'/root/SceneManager'.change_scenes("level1")
		pass
