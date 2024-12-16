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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	one_selected = false
	current_player = 1
	var power_holder = load("res://Test/Round Upgrades/round_upgrades.tscn")
	var power_holder_instance = power_holder.instantiate()
	possible_powers = power_holder_instance.get_children()
	random_powers()

func random_powers() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


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
	var current_player = Globals.get_child(current_player-1)
	for i in current_player.get_children():
		pass
	var selected_power_instance = selected_power.instantiate()
	if current_player != Globals.players.size():
		power1_button.button_pressed = false
		power2_button.button_pressed = false
		power3_button.button_pressed = false
		current_player += 1
		random_powers()
	else:
		$'/root/SceneManager'.change_scenes("level1")
		pass
