extends Node2D

var total_weapons : int = 0
var cur_active_weapon_indx : int = -1
var weapon_atks 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	total_weapons = get_child_count()
	for child in get_children():
		if child is Area2D:
			if cur_active_weapon_indx<0:
				cur_active_weapon_indx = child.get_index()
			child.monitoring = false

func connect_weapon():
	pass

func hit_with_weapon(index,atk):
	pass
